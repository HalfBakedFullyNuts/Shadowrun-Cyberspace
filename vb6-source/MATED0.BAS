Option Explicit

Rem ========================================
Rem  This Module contains functions used by
Rem  CYBERSPC.EXE and MATED.EXE
Rem ========================================

Function Nodetype2val (typ As String) As Integer
  Rem --- SubFunction used by MatrixStatistic() ---
  Dim n As Integer

  Select Case UCase$(typ$)
    Case "CPU": n = 0
    Case "DS": n = 1
    Case "IOP": n = 2
    Case "SM", "SN": n = 3
    Case "SPU": n = 4
    Case "SAN": n = 5
    Case "MAT", "CRA": n = 6
  End Select
  Nodetype2val = n

End Function

Sub SaveLTG (c$, makeentry%)
  Rem c$ = filename
  Rem makeentry = true/false connect entrynode with/not with external matrix.
  Dim a$
  Dim nodenr%, k%, icenr%, i%, ret%, m%

  If TestMatrix(makeentry) = False Then
    ret = MsgBox("Matrix grid testing reveals inconsistency (see Error Messages)." & Chr$(10) & "Do you really want to save this configuration?", 1 + 32 + 256)
  Else
    ret = 1  ' okay
  End If
  
  ' Write Matrix configuration
  If ret = 1 And InStr(c$, "*") <= 0 Then
    Debug.Print "Write Matrix..."
    Open c$ For Output As #1
    Print #1, "[Matrix]"
    Print #1, "Description=" & matrixname$
    Print #1, "Nodes=" & Format(nodenum)
    Print #1, "Entry=" & Format(entrynode)
    Print #1, "Range=" & Format(deck.range)
    Select Case alert
      Case 0: a$ = "none"
      Case 1: a$ = "passive"
      Case 2: a$ = "active"
    End Select
    Print #1, "Alert=" & a$
    If emergeperc <= 100# And emergetics >= 0 Then
      Print #1, "Emergency=" & Trim$(Format(emergeperc)) & "/" & Trim$(Format(emergetics))
    End If
    If shutdowntics > 0 Then
      Print #1, "Shutdowntics=" & Trim$(Format(shutdowntics))
    End If
    Select Case matreadonly
      Case True: a$ = "Yes"
      Case False: a$ = "No"
    End Select
    Print #1, "Readonly=" & a$
    If (ltgimagepath$ <> "") Then
      Print #1, "LTGImagePath=" & ltgimagepath$
    End If
    ' Determinate save order of ICE for ptrigger, atrigger parameters
    m = 0
    For i = 1 To nodenum
      For k = 0 To icenum - 1
        If ice(k).nodenr = i Then
          iceorder(k) = m
          Debug.Print "ICEnr"; ice(k).description; " is saved as "; Format(m); ". ICE. pts"; ice(k).ptrigger
          m = m + 1
        End If
      Next k
    Next i
    'For k = 0 To icenum - 1
    '  If ice(k).ptrigger >= 0 Then
    '    Debug.Print k; ice(k).description & " ptriggers " & ice(k).ptrigger & ice(ice(k).ptrigger).description & " and will trigger " & iceorder(ice(k).ptrigger)
    '  End If
    'Next k

    For nodenr = 0 To nodenum
      Print #1,
      Print #1, "[Node" & Format(nodenr) & "]"
      If UCase$(node(nodenr).typ) = "LNK" Then
        node(nodenr).mesg = Trim$(node(nodenr).mesg)
        Print #1, "Type=" & node(nodenr).typ & " " & node(nodenr).mesg & " " & Format(node(nodenr).xpos) & " " & Format(node(nodenr).ypos)
      Else
        Print #1, "Type=" & node(nodenr).typ & " " & node(nodenr).color & "-" & node(nodenr).rating & " " & Format(node(nodenr).xpos) & " " & Format(node(nodenr).ypos);
        If node(nodenr).locked > 0 Then
          Print #1, " locked " & Format(node(nodenr).locked)
        Else
          Print #1,
        End If
        If Len(node(nodenr).mesg) > 0 Then
          Print #1, "Mesg=" & node(nodenr).mesg
        End If
      End If
      If node(nodenr).nfiles > 0 Then
        Print #1, "Files=";
        For k = 1 To node(nodenr).nfiles
          Print #1, node(nodenr).file(k).name & "/" & Format(node(nodenr).file(k).size) & "/" & Format(node(nodenr).file(k).Value) & " ";
        Next k
        Print #1,
      End If
      
      icenr = GetAllICEofNode(nodenr)
      If icenr = 1 Then
        k = iceofnode(0)
        Print #1, "ICEType=" & GetICEsavestr(k)
      Else
        For i = 0 To icenr - 1
          k = iceofnode(i)
          Print #1, "ICEType" & Format(i + 1) & "=" & GetICEsavestr(k)
        Next i
      End If
      Print #1, "Links=" & GetLinkssavestr(nodenr)
    Next nodenr
    Close #1
  End If

End Sub

Sub StrToFiles (ByVal nodenr%, ByVal nodestr$)
  Dim j%
  Dim a$

  j = 0
  Debug.Print Len(nodestr$); nodestr$
  a$ = Trim$(nodestr$)
  While Len(a$) > 0
    j = j + 1
    If j > MAXFILESNUM Then
      NewPad ("Error: Maximum of " & Format(MAXFILESNUM) & " per node")
      a$ = ""
      j = j - 1
    Else
      node(nodenr).file(j).name = GetWord(a$, "/")
      node(nodenr).file(j).size = Val(GetWord(a$, "/"))
      node(nodenr).file(j).Value = Val(GetWord(a$, " "))
    End If
  Wend
  node(nodenr).nfiles = j
End Sub

Function StrToICE (ByVal nodenr%, ByVal icenr%, ByVal icestr$) As Integer
  Rem Transforms ICEType-String to attributes:
  Rem Input:
  Rem  nodenr = current node index
  Rem  icenr  = number of ice
  Rem  icestr$="Gray Killer (M)-9 passive immobile damage 4"
  Rem
  Rem Returns:
  Rem  next ice number
  Rem
  Rem If icestr$ is "" then no ice is added.
  Rem
  Dim a$, opt$

  a$ = Trim$(icestr$)
  node(nodenr).icesleep = 0
  node(nodenr).iceactive = 0
  If icenr > MAXICENUM Then
    NewPad ("Error: Can't handle more than " & Format(MAXICENUM + 1) & " ICEs.")
    a$ = ""
  End If
  If Len(a$) > 0 Then
    ice(icenr).code = GetWord(a$, " ")
    Rem Defaults for mobility and activity
    Select Case UCase$(ice(icenr).code)
      Case "WHITE":
        ice(icenr).mobile = IMOBILE
        ice(icenr).active = 0
      Case "GRAY", "GREY":
        ice(icenr).code = "Gray"
        ice(icenr).mobile = PMOBILE
        ice(icenr).active = 1
      Case "BLACK":
        ice(icenr).mobile = PMOBILE
        ice(icenr).active = 1
    End Select
      
    ice(icenr).description = GetWord(a$, "-")
    ice(icenr).rating = Val(GetWord(a$, " "))
    ice(icenr).ptrigger = -1
    ice(icenr).atrigger = -1
    ice(icenr).damage = 0
    ice(icenr).freezemod = 0
    ice(icenr).satisfaction = ICELOOK
    ice(icenr).succattacked = False
    ice(icenr).range = RANGECON
    ice(icenr).modana = 0
    ice(icenr).modtar = 0
    ice(icenr).modtrace = 0
    ice(icenr).ini = -1
    ice(icenr).nodenr = nodenr
    ice(icenr).lastnode = -1
    ice(icenr).tracetics = 0
    While Len(a$) > 0
      opt$ = GetWord(a$, " ")
      Select Case UCase$(opt$)
        Case "MOBILE": ice(icenr).mobile = EMOBILE
        Case "PMOBILE": ice(icenr).mobile = PMOBILE
        Case "AMOBILE": ice(icenr).mobile = AMOBILE
        Case "IMMOBILE": ice(icenr).mobile = IMOBILE
        Case "EVER": ice(icenr).active = 0
        Case "PASSIVE": ice(icenr).active = 1
        Case "ACTIVE": ice(icenr).active = 2
        Case "TRIGGERED": ice(icenr).active = 3
        Case "PTRIGGER": ice(icenr).ptrigger = Val(a$)
        Case "ATRIGGER": ice(icenr).atrigger = Val(a$)
        Case "DAMAGE": ice(icenr).damage = Val(a$)
            If ice(icenr).damage < 0 Then
              If ice(icenr).damage = -100 Then
                ice(icenr).freezemod = 100
                ice(icenr).damage = 0
              Else
                ice(icenr).freezemod = Int(-ice(icenr).damage / 16)
                ice(icenr).damage = -ice(icenr).damage Mod 16
              End If
            End If
            If ice(icenr).damage >= 10 Then
              ice(icenr).active = 4
            End If
      End Select
    Wend
    If ice(icenr).active > alert Then
      node(nodenr).icesleep = node(nodenr).icesleep + 1
    Else
      node(nodenr).iceactive = node(nodenr).iceactive + 1
    End If
    icenr = icenr + 1
  End If

  StrToICE = icenr

End Function

Sub StrToLinks (ByVal nodenr%, ByVal linkstr$)
  Rem Transform String to Links, e.g. "2/3/5" or even ""
  Dim a$
  Dim k%, l%

  k = 0
  a$ = Trim$(linkstr$)
  While Len(a$) > 0
    l = Val(GetWord(a$, "/"))
    If l >= 0 And l <= nodenum Then
      k = k + 1
      If k > MAXLINKSNUM Then
        NewPad ("Error: Maximum of " & Format(MAXLINKSNUM) & " links per node exceeded!")
        a$ = ""
        k = k - 1
      Else
        node(nodenr).link(k) = l
      End If
    Else
      NewPad ("Error in Node" & Format(nodenr) & ": Link to " & Format(l) & " is out of this grid!")
    End If
  Wend
  node(nodenr).nlinks = k

End Sub

Sub StrToNode (ByVal nodenr%, ByVal nodestr$)
  Rem Example "CPU Red-6 3 4 locked 12" -> Transform string to node parameters
  Rem         "LNK FIRSTRUN.LTG 23 3 4"
  Dim a$, b$

  If Len(nodestr$) = 0 Then
    node(nodenr).color = ""
    node(nodenr).colnr = 0
    node(nodenr).rating = 0
    node(nodenr).failsysop = 0
    node(nodenr).visited = 0
    node(nodenr).nodeanatarget = 0
    node(nodenr).nodebrowsetarget = 0
    node(nodenr).nodeevaltarget = 0
    node(nodenr).nodesifttarget = 0
    node(nodenr).curlink = 0
    node(nodenr).nfiles = 0
    node(nodenr).locked = 0
  Else
    If nodenr > 100 Then
      NewPad ("Error: Cannot handle more than 100 nodes!")
    Else
      a$ = Trim$(nodestr$)
      node(nodenr).typ = GetWord(a$, " ")
      If UCase$(node(nodenr).typ) = "LNK" Then
        ' LNK-Node exception: connects to another matrix
        node(nodenr).color = ""
        node(nodenr).colnr = 0
        node(nodenr).rating = 0
        node(nodenr).mesg = GetWord(a$, " ")  ' next LTG name and it's entrynode
        node(nodenr).mesg = node(nodenr).mesg & " " & GetWord(a$, " ")
        'Debug.Print "StrToNode: mesg:"; node(nodenr).mesg
      Else
        ' normal case:
        node(nodenr).color = GetWord(a$, "-")
        Select Case UCase$(Left$(node(nodenr).color, 1))
          Case "B": node(nodenr).colnr = 1
          Case "G": node(nodenr).colnr = 2
          Case "O": node(nodenr).colnr = 3
          Case "R": node(nodenr).colnr = 4
          Case "P": node(nodenr).colnr = 5
          Case "D": node(nodenr).colnr = 6
          Case Else: NewPad ("Unknown node color " & Format(node(nodenr).color) & ".")
        End Select
        node(nodenr).rating = Val(GetWord(a$, " "))
      End If
      node(nodenr).xpos = Val(GetWord(a$, " "))
      node(nodenr).ypos = Val(GetWord(a$, " "))
      a$ = Trim$(a$)
      b$ = UCase$(GetWord(a$, " "))
      node(nodenr).locked = 0
      If b$ = "LOCKED" Then
        node(nodenr).locked = Val(GetWord(a$, " "))
        If node(nodenr).locked > 0 Then
          node(nodenr).locked = node(nodenr).locked - roundssinceload
          If node(nodenr).locked < 0 Then node(nodenr).locked = 0
        End If
      End If
      node(nodenr).failsysop = 0
      node(nodenr).visited = 0
      node(nodenr).nodeanatarget = 0
      node(nodenr).nodebrowsetarget = 0
      node(nodenr).nodeevaltarget = 0
      node(nodenr).nodesifttarget = 0
      node(nodenr).curlink = 0
      node(nodenr).nfiles = 0
    End If
  End If
End Sub

Function TestMatrix (makeentry As Integer) As Integer
  Rem Tests the consistency of the loaded matrix
  Rem makeentry = True: connect entrynode with external matrix (mated.exe)
  Rem makeentry = False: do not connect it ... (cyberspc.exe)
  Dim i%, k%, l%, m%, ret%
  Dim x0%, x1%, y0%, y1%
  Dim a As String
  Dim b As String
  Dim fi As Integer


  For i = 0 To nodenum
    Debug.Print node(i).typ; "-"; Format$(i),
    For l = 1 To node(i).nlinks
      Debug.Print node(i).link(l); "/";
    Next l
    Debug.Print
  Next i

  Rem --- Test for links ---
  ret = 1
  If nodenum <= 0 Then
    NewPad ("No grid at all. Zero nodes.")
    ret = 0
  End If
  If entrynode > nodenum Then
    entrynode = 1
    If nodenum > 0 Then
      NewPad ("Entry node is not in this Matrix. Set to 1. node.")
      ret = 0
    End If
  End If
  If node(entrynode).typ = "LNK" Then
    NewPad ("Entry node is in a LinkLoad node. This does not make sense.")
    ret = 0
  End If
  Rem -- automatic add entrynode --
  If node(0).nlinks = 0 Then
    Call Addlink(0, entrynode)
  End If
  Rem -- is entrynode connect with 0 and vice visa? --
  If makeentry Then
    If IsLinked(entrynode, 0) = False Then Call Addlink(entrynode, 0)
    If IsLinked(0, entrynode) = False Then Call Addlink(0, entrynode)
  End If
  For i = 0 To nodenum
    If node(i).nlinks = 0 Then
      NewPad (node(i).typ & Format(i) & " has no connection at all!")
      ret = 0
    Else
      For k = 1 To node(i).nlinks
        l = node(i).link(k)
        m = 1
        Do
          If i = node(l).link(m) Then Exit Do
          m = m + 1
          If m > node(l).nlinks Then
            If l > 0 And node(l).typ <> "MAT" Then
              NewPad ("Back link from " & node(l).typ & Format(l) & " to " & node(i).typ & Format(i) & " is missing! Added.")
            End If
            node(l).nlinks = node(l).nlinks + 1
            node(l).link(node(l).nlinks) = i
            ret = 0
          End If
        Loop
      Next k
    End If
  Next i

  Rem --- Test for positions ---
  For i = 1 To nodenum - 1
    For k = i + 1 To nodenum
      If node(i).xpos = node(k).xpos And node(i).ypos = node(k).ypos Then
        NewPad ("Nodes " & Format(i) & " and " & Format(k) & " have same position!")
        ret = 0
        Exit For
      End If
    Next k
  Next i

  Rem --- Test if LNK-node has corresponding file ---
  On Error Resume Next
  For i = 1 To nodenum
    If node(i).typ = "LNK" Then
      a$ = Trim$(node(i).mesg)
      b$ = GetWord(a$, " ")
      fi = FreeFile
      b$ = ExtractPath(ltgfile$) & b$
      Open b$ For Input As fi
      If LOF(fi) = 0 Then
        NewPad ("Cannot open linked file " & b$)
      Else
        Close #1
      End If
    End If
  Next i
  Rem --- Determine max/min coordinate ---
  x0 = 10000
  x1 = -10000
  y0 = 10000
  y1 = -10000
  For i = 1 To nodenum
    If node(i).xpos < x0 Then x0 = node(i).xpos
    If node(i).ypos < y0 Then y0 = node(i).ypos
    If node(i).xpos > x1 Then x1 = node(i).xpos
    If node(i).ypos > y1 Then y1 = node(i).ypos
  Next i
  Debug.Print "Coordinates rectangle: (" & Format(x0) & "," & Format(y0) & ") - (" & Format(x1) & "," & Format(y1) & ")"

  TestMatrix = ret
End Function

Sub Addlink (lastnode%, curnode%)
  Rem adds the link between lastnode and curnode to node()
  Dim k%, ret%

  ' Connect lastnode with curnode
  ret = -1
  If lastnode >= 0 Then
    For k = 1 To node(lastnode).nlinks
      If node(lastnode).link(k) = curnode Then  ' Test if nodes are already connected
        ret = 0
        Exit For
      End If
    Next k
    If ret = -1 Then                 ' no link there
      node(lastnode).nlinks = node(lastnode).nlinks + 1
      node(lastnode).link(node(lastnode).nlinks) = curnode
    End If
  End If

End Sub

Function GetICEsavestr (icenr%) As String
  Rem Returns String for saving ICE attributes in SaveLTG
  Rem  ptrigger and atrigger is complicated. It must be sorted in order of the nodes.
  Rem  -> iceorder() must contain the order.
  Dim a$
  Static activestr(0 To 4)

  activestr(0) = "ever"
  activestr(1) = "passive"
  activestr(2) = "active"
  activestr(3) = "triggered"
  activestr(4) = ""
  a$ = ice(icenr).code & " " & ice(icenr).description & "-" & ice(icenr).rating
  ' mobility string (when not default)
  If UCase$(ice(icenr).code) = "WHITE" And ice(icenr).mobile <> IMOBILE Then
    Select Case ice(icenr).mobile
      Case EMOBILE: a$ = a$ & " mobile"
      Case PMOBILE: a$ = a$ & " pmobile"
      Case AMOBILE: a$ = a$ & " amobile"
      Case IMOBILE: a$ = a$ & " immobile"
    End Select
  ElseIf UCase$(ice(icenr).code) <> "WHITE" And ice(icenr).mobile <> PMOBILE Then
    Select Case ice(icenr).mobile
      Case EMOBILE: a$ = a$ & " mobile"
      Case PMOBILE: a$ = a$ & " pmobile"
      Case AMOBILE: a$ = a$ & " amobile"
      Case IMOBILE: a$ = a$ & " immobile"
    End Select
  End If
  ' activity string (when not default)
  If UCase$(ice(icenr).code) = "WHITE" And ice(icenr).active <> 0 Then
    a$ = a$ & " " & activestr(ice(icenr).active)
  ElseIf UCase$(ice(icenr).code) <> "WHITE" And ice(icenr).active <> 1 Then
    a$ = a$ & " " & activestr(ice(icenr).active)
  End If
  
  If ice(icenr).ptrigger <> -1 Then ' only save non-defaults
    If ice(icenr).ptrigger >= 0 Then
      ' Is ice(icenr).ptrigger when ICE is sorted
      a$ = a$ & " ptrigger " & Format(iceorder(ice(icenr).ptrigger))
      Debug.Print ice(icenr).description & " triggers " & ice(iceorder(ice(icenr).ptrigger)).description
    Else
      a$ = a$ & " ptrigger " & Format(ice(icenr).ptrigger)
    End If
  End If
  If ice(icenr).atrigger <> -1 Then
    If ice(icenr).atrigger >= 0 Then
      a$ = a$ & " atrigger " & Format(iceorder(ice(icenr).atrigger))
    Else
      a$ = a$ & " atrigger " & Format(ice(icenr).atrigger)
    End If
  End If

  ' damage string (when not default)
  If ice(icenr).damage > 0 Then
    a$ = a$ & " Damage " & Format(ice(icenr).damage)
  ElseIf ice(icenr).freezemod = 100 Then
    a$ = a$ & " Damage -100"
  ElseIf ice(icenr).damage > 0 Or ice(icenr).freezemod > 0 Then
    If ice(icenr).damage > 10 Then ice(icenr).damage = 10
    a$ = a$ & " Damage " & Format(-(ice(icenr).damage + ice(icenr).freezemod * 16))
  End If

  GetICEsavestr = a$
End Function

Function GetLinkssavestr (nodenr%) As String
  Rem Returns a string containing all links of the node sorted by angle from 270^0 to -90^0 in descending order
  Rem e.g.:   5   6
  Rem     4         7
  Rem    3    *      8
  Rem               9
  Rem     2   1   10
  Dim a As String
  Dim agl As Single
  Dim i As Integer, j As Integer, h As Integer
  Dim nlnk As Integer
  Dim last As Integer
  
  For i = 1 To node(nodenr).nlinks
    h = node(nodenr).link(i)
    If UCase$(node(h).typ) <> "MAT" And UCase$(node(h).typ) <> "CRA" Then
      agl = atn2(-(node(h).ypos - node(nodenr).ypos), node(h).xpos - node(nodenr).xpos)
    Else
      agl = -M_PI    ' reserved for external matrix, because sort should bring it as first link
    End If
    If agl <= -.5 * M_PI Then agl = 2 * M_PI + agl  ' -180 to -90 -> 180-270^0
    ' BE CAREFUL: M_PI must hold "<=" exactly!!!
    ' agl = [-Pi/2, 3/2 Pi]
    sortdicearr(i) = Int(agl * 100 * 180# / M_PI)  ' sortdicearr contains angle * 100 for sorting (max 327.68 degrees possible)
    ' sortdicearr() = [-9000,27000]
    dicearr(i) = node(nodenr).link(i)  ' dicearr contains nodenumber where links point to (for indexing)
  Next i
  
  ' now sorting (Bubblesort)...
  For i = 1 To node(nodenr).nlinks
    For j = 1 To i - 1
      If (sortdicearr(i) < sortdicearr(j)) Then
        h = sortdicearr(i)                ' rearrange angles
        sortdicearr(i) = sortdicearr(j)
        sortdicearr(j) = h
        h = dicearr(i)                    ' rearrange node numbers
        dicearr(i) = dicearr(j)
        dicearr(j) = h
      End If
    Next j
  Next i
  
  
  ' now put sorted node numbers into string and into node().link()
  a$ = ""
  h = node(nodenr).nlinks
  last = -1   ' link to none
  nlnk = 0
  For i = h To 1 Step -1
    If dicearr(i) <> last Then   ' Do not save multiple connections to the same node
      nlnk = nlnk + 1
      last = dicearr(i)
      node(nodenr).link(nlnk + 1) = dicearr(i)
      a$ = a$ & "/" & Format(dicearr(i))
    End If
  Next i
  node(nodenr).nlinks = nlnk
  If Left(a$, 1) = "/" Then a$ = Mid$(a$, 2)

  Debug.Print "Linkstr="; a$
  GetLinkssavestr = a$

End Function

Function IsLinked (lastnode%, curnode%) As Integer
  Rem --- Tests if lastnode has connection to curnode
  Rem (but not vice visa)
  Dim i As Integer
  Dim m As Integer

  m = False
  For i = 1 To node(lastnode).nlinks
    If (node(lastnode).link(i) = curnode) Then
      m = True
      Exit For
    End If
  Next i
  IsLinked = m
End Function

Function MatrixStatistic () As String
  Rem Shows inconsistencies of the created/loaded Matrix
  Dim i%, m%, s%, z%, idx%, k%, fit%, l%
  Dim fi%
  Static nodelim(0 To 9, 0 To 4) As Integer
  Static security$(0 To 4)
  Static cnt(0 To 4) As Integer
  Static nodecon(0 To 8, 0 To 8) As Integer
  Dim a$
  Dim retstr$             ' result string with text
  Dim crlf$

  crlf$ = Chr$(10) & Chr$(13)
  retstr$ = ""
  security$(0) = "no security"
  security$(1) = "low security (libraries, telecom)"
  security$(2) = "med security (government, underworld, most corporate)"
  security$(3) = "high security (Megacorps, financial, major crime)"
  security$(4) = "ultra security (most vital Megacorps, military systems)"

  fi = FreeFile
  Open datapath$ & "NODELIM.DAT" For Input As fi
  a$ = readline(80, fi)
  a$ = readline(80, fi)
  For z = 0 To 4
    For s = 0 To 9
      Input #fi, nodelim(s, z)
      Debug.Print nodelim(s, z); " ";
    Next s
    Debug.Print
  Next z
  
  Debug.Print "+++"
  a$ = readline(80, fi)
  Debug.Print a$
  a$ = readline(80, fi)
  Debug.Print a$
  a$ = readline(80, fi)
  Debug.Print a$
  For z = 0 To 8
    For s = 0 To 8
      Input #fi, nodecon(s, z)
      Debug.Print nodecon(s, z);
    Next s
    Debug.Print
  Next z
  Close #fi

  For i = 0 To 4
    cnt(i) = 0               ' reset counter
  Next i

  For i = 1 To nodenum
    m = (node(i).colnr - 1) * 10 + node(i).rating
    If m >= 5 And m <= 10 Then
      retstr$ = retstr$ & "Node " & Format(i) & ": Only Blue 1-4 possible." & crlf$
    ElseIf m >= 16 And m <= 20 Then
      retstr$ = retstr$ & "Node " & Format(i) & ": Only Green 1-5 possible." & crlf$
    ElseIf m >= 28 And m <= 30 Then
      retstr$ = retstr$ & "Node " & Format(i) & ": Only Orange 1-7 possible." & crlf$
    ElseIf m >= 38 Then
      retstr$ = retstr$ & "Node " & Format(i) & ": Red 8 or higher is exaggerated." & crlf$
      Debug.Print "Node " & Format(i) & ": Red 8 or higher is exaggerated."
    ElseIf node(i).rating >= 10 Then
      retstr$ = retstr$ & "Node " & Format(i) & ": System rating is extremely exaggerated." & crlf$
    Else
      Select Case node(i).typ
        Case "DLJ", "SM", "SN": idx = 0
        Case "IOP": idx = 1
        Case "CPU", "SAN": idx = 2
        Case "DS", "SPU": idx = 3
        Case "LNK": idx = 4
      End Select
      fit = False
      For k = 0 To 4
        If m >= nodelim(2 * k, idx) And m <= nodelim(2 * k + 1, idx) Then
          cnt(k) = cnt(k) + 1
          fit = True
        End If
      Next k
      ' Rating 0/1/1/2/2 of 3 nodes is possible due to overlap in idx = 3
      If fit = False Then
        retstr$ = retstr$ & "Node " & Format(i) & " does not fit the color/rate scheme." & crlf$
      End If
    End If
  Next i

  s = 0
  m = 0
  For i = 0 To 4
    If cnt(i) >= m Then
      m = cnt(i)
      s = i
    End If
  '  retstr$ = retstr$ & Format(cnt(i)) & "/" & Format(nodenum) & " nodes with " & StrwoBrackets(security$(i))& crlf$
  Next i
  retstr$ = retstr$ & Format(cnt(0)) & "/" & Format(cnt(1)) & "/" & Format(cnt(2)) & "/" & Format(cnt(3)) & "/" & Format(cnt(4)) & " of " & Format(nodenum) & " nodes with no/low/med/high/ultra security." & crlf$
  If m < nodenum Then retstr$ = retstr$ & "Not all nodes fit color/rate scheme." & crlf$

  Rem --- Test if Node Connections are allowed ---
  For i = 0 To nodenum
    For k = 1 To node(i).nlinks
      m = node(i).link(k)
      If nodecon(Nodetype2val(node(i).typ), Nodetype2val(node(m).typ)) = 0 Then
        retstr$ = retstr$ & "Connection type " & node(i).typ & "(" & Format(i) & ")" & " <-> " & node(m).typ & "(" & Format(m) & ") is illegal." & crlf$
      End If
    Next k
  Next i
  
  Rem --- Test if System has extraordinary color ---
  m = 0
  For i = 1 To nodenum
    Debug.Print node(i).colnr
    If node(i).colnr > 4 Then
      m = m + 1
    End If
  Next i
  If m > 0 Then
    retstr$ = retstr$ & "System has " & Format$(m) & " nodes with color above Red!" & crlf$
  End If
  
  Rem --- Test if System has a CPU ---
  m = 0
  For i = 1 To nodenum
    If UCase$(node(i).typ) = "CPU" Then
      m = m + 2 * node(i).rating * node(i).colnr ' Kludge count all CPUs for ICE-Rating Test below
    End If
  Next i
  If m = 0 Then
    retstr$ = retstr$ & "System has no CPU!" & crlf$
  End If
  Rem --- Test if ICE-Rating is exaggerated or to much for the Cluster (Cluster-Kludge) ---
  Rem --- use "m" from CPU-Test ---
  s = 0
  For i = 0 To icenum - 1
    If UCase$(ice(i).code) <> "BLACK" Then
      s = s + ice(i).rating    ' Count sum of original White/Gray ICE-Ratings VR 1.0 p. 23
    End If
  Next i
  If m < s Then   ' VR 1.0 p. 23
    retstr$ = retstr$ & "Too much White+Gray ICE for the system! Sum of ratings is " & Format(s) & " and should be " & Format(m) & " at maximum." & crlf$
  End If

  m = 0
  k = 0
  z = 0
  l = 0
  For i = 0 To icenum - 1
    If ice(i).active = 0 Then
      m = m + ice(i).rating                            ' Count sum of original ICE-Ratings ever present
    End If
    If ice(i).rating > 12 Then k = 1                   ' ICE-Rate > 12 ?
    If node(ice(i).nodenr).colnr = 1 Then z = z + 1    ' ICE in Blue node?
    If node(ice(i).nodenr).typ = "LNK" Then l = l + 1  ' ICE in LNK node
  Next i
  If s = 0 Then
    retstr$ = retstr$ & "There is no ICE at all." & crlf$
  Else
    retstr$ = retstr$ & Format(Int((100# * m) / s + .5)) & "% of all ICE-Ratings are normally active (should be 25%)." & crlf$
  End If
  If k <> 0 Then
    retstr$ = retstr$ & "Some ICE has Rating higher than 12." & crlf$
  End If
  If z <> 0 Then
    retstr$ = retstr$ & "Some ICE in a blue node." & crlf$
  End If
  If l <> 0 Then
    retstr$ = retstr$ & "Some ICE in a LinkLoad pseudo node." & crlf$
  End If

  MatrixStatistic = retstr$
End Function

Sub NewPadGM (s$)
  Rem Output secret message for Gamemaster
  Dim pos%
  Dim n%
  Dim start%
  Dim a$
  Dim padwidth%, padclearlen%
  Dim fo As Integer

  padwidth = 40
  padclearlen = 7
  a$ = Form8.pad.Caption
  If Len(a$) > 0 Then
    a$ = a$ & Chr$(10) & Chr$(13) & s$
  Else
    If Len(s$) > 0 Then
      a$ = s$
    End If
  End If
  Rem Write Logfile
  If logfiletrue Then
    fo = FreeFile
    On Error Resume Next
    Open logfilename$ For Append Access Write As fo
    Print #fo, Format(roundssinceload, "0000"); " !! GMLOG: "; s$
    If Err <> 0 Then
      logfiletrue = False
      logfilename$ = ""
      NewPad ("Error writing logfile!!!")
    Else
      Close #fo
    End If
  End If
  Do
    start = 1
    n = 0
    pos = InStr(a$, Chr$(10))
    While pos >= start
      n = n + Int((pos + 1 - start) / padwidth + .99)
      start = pos + 1
      pos = InStr(start, a$, Chr$(10))
    Wend
    If n > padclearlen Then a$ = Mid$(a$, InStr(a$, Chr$(13)) + 1)
  Loop Until n <= padclearlen
  
  Form8.pad.Caption = a$

End Sub

