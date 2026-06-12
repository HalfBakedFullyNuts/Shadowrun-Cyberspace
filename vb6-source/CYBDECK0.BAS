Option Explicit
Rem ======================================================
Rem  This Modules contains functions used by
Rem  CYBERSPC.EXE, CYBDEMO.EXE, CYBDECK.EXE
Rem ======================================================

Function CalcProgsize (ByVal p$, ByVal rating%) As Integer
  Rem Calculate size of a program
  Dim r%
  Dim size As Long
  Dim a$, b$, c$

  size = 0
  a$ = p$
  b$ = UCase$(StrwoBrackets(GetWord(a$, "-")))
  Select Case b$
    Case "ATTACK":
          a$ = p$
          c$ = UCase$(Strbrackets(GetWord(a$, "-")))
          Select Case Left$(c$, 1)
            Case "L": r = rating + 0   ' rulebook says +1 but this must be wrong
            Case "M": r = rating + 2
            Case "S": r = rating + 3
            Case "D": r = rating + 5
            Case Else: r = rating
          End Select
          size = r * r * 2
    Case "SLOW": size = rating * rating * 4
    Case "MEDIC": size = rating * rating * 4
    Case "MIRRORS": size = rating * rating * 3
    Case "BLIND": size = rating * rating * 3
    Case "HOG": size = rating * rating * 3
    Case "SHIELD": size = rating * rating * 4
    Case "SMOKE": size = rating * rating * 2
    Case "ANALYZE": size = rating * rating * 3
    Case "ANALYSE": size = rating * rating * 3
    Case "BROWSE": size = rating * rating * 1
    Case "DECRYPT": size = rating * rating * 2
    Case "EVALUATE": size = rating * rating * 2
    Case "DECEPTION": size = rating * rating * 2
    Case "RELOCATE": size = rating * rating * 2
    Case "SLEAZE": size = rating * rating * 3
    Case "AUTO EXECUTE": size = rating * rating * 1
    Case "ARMOR": size = rating * rating * 3
    Case "CLOAK": size = rating * rating * 3
    Case "COMPRESSOR": size = rating * rating * 2
    Case "CONTROLLER": size = rating * rating * 4
    Case "POISON": size = rating * rating * 3
    Case "RESTORE": size = rating * rating * 3
    Case "RESTRICT": size = rating * rating * 3
    Case "REVEAL": size = rating * rating * 3
    Case "SCANNER": size = rating * rating * 3
    Case "SIFT": size = rating * rating * 1
    Case "SATLINK": size = 3  ' Satellite uplink control
    Case Else: size = rating  ' normal data
  End Select

  CalcProgsize = size

End Function

Function DeckAttribToStr (deck As cyberdecktype, nr As Integer) As String
  Rem Converts MPCP, BOD,EVA, MASK, SENS into a string for saving
  Dim ret$
  
  ret$ = Format(deck.oripp(nr))
  If nr = 4 Then  ' MPCP damage is permanent
    ret$ = Format(deck.oripp(nr) - deck.dam(nr))
    deck.dam(nr) = 0
  End If

  If deck.add(nr) > 0 Then
    ret$ = ret$ & "+" & Trim$(Str$(deck.add(nr)))
  Else
    ret$ = ret$ & Trim$(Str$(deck.add(nr)))
  End If
  If deck.dam(nr) > 0 Then
    ret$ = ret$ & "+" & Trim$(Str$(deck.dam(nr)))
  Else
    ret$ = ret$ & Trim$(Str$(deck.dam(nr)))
  End If
  If deck.chg(nr) > 0 Then
    ret$ = ret$ & "+" & Trim$(Str$(deck.chg(nr)))
  Else
    ret$ = ret$ & Trim$(Str$(deck.chg(nr)))
  End If
  DeckAttribToStr = ret$
End Function

Function GetSignedVal (a$) As Integer
  Rem Return first number in string or zero
  Rem a$ is reduced by this number
  Dim ret%
  Dim b$

  ret = Val(a$)
  b$ = Left$(a$, 1)
  If b$ = "+" Or b$ = "-" Or b$ = " " Then
    a$ = Mid$(a$, 2)
    b$ = Left$(a$, 1)
  End If
  While (b$ >= "0" And b$ <= "9" And Len(a$) > 0)
    a$ = Mid$(a$, 2)
    b$ = Left$(a$, 1)
  Wend
  GetSignedVal = ret
End Function

Function LoadDeck (c$) As Integer
  Rem Read deck statistics
  Dim a$, p$
  Dim i As Integer
  Dim no As Integer
  
  deck.model = ReadDataIni(c$, "Persona", "Model")
  Call StrToDeckAttrib(c$, deck, 4)   ' MPCP
  Call StrToDeckAttrib(c$, deck, 0)   ' Bod
  Call StrToDeckAttrib(c$, deck, 1)   ' Evasion
  Call StrToDeckAttrib(c$, deck, 2)   ' Masking
  Call StrToDeckAttrib(c$, deck, 3)   ' Sensor
  deck.damage = Val(ReadDataIni(c$, "Persona", "Damage"))
  a$ = "Technical Parameters"
  deck.hardening = Val(ReadDataIni(c$, a$, "Hardening"))
  deck.storagemem = Val(ReadDataIni(c$, a$, "StorageMem"))
  deck.activemem = Val(ReadDataIni(c$, a$, "ActiveMem"))
  deck.load = Val(ReadDataIni(c$, a$, "Load"))
  deck.io = Val(ReadDataIni(c$, a$, "I/O"))
  deck.response = Val(ReadDataIni(c$, a$, "Response"))
  deck.satuplink = Val(ReadDataIni(c$, a$, "Satuplink"))
  deck.purecyber = Val(ReadDataIni(c$, a$, "PureCyber"))
  If deck.purecyber <> 0 Then deck.purecyber = 1
  deck.realfilter = Val(ReadDataIni(c$, a$, "RealityFilter"))
  If deck.realfilter <> 0 Then deck.realfilter = 1
  deck.realfilteruse = 0
  deck.displaymode = Val(ReadDataIni(c$, a$, "DisplayMode"))
  icedisplay = deck.displaymode
  deck.compressed = 0
  deck.onuplink = 0
  deck.modmedic = 0
  deck.modshield = 0
  deck.modsmoke = 0
  deck.ratearmor = 0
  deck.ratecloak = 0
  deck.ratemedic = 0
  deck.ratemirrors = 0
  deck.rateshield = 0
  deck.ratesmoke = 0
  deck.usedprgs.armor = False ' Programs which are not refreshable
  deck.usedprgs.cloak = False
  deck.usedprgs.smoke = False
  deck.usedprgs.medic = False
  deck.usedprgs.mirrors = False ' Programs which are refreshable
  deck.usedprgs.shield = False
  deck.usedprgs.auto_execute = 0
  deck.modattack = 0
  deck.modload = 0
  deck.istraced = False


  ' Read program list

  deck.activeprogmem = 0
  deck.storageprogmem = 0
  
  i = 0
  a$ = "NULL"
  While a$ <> ""
    i = i + 1
    p$ = "program" + Format(i)
    a$ = ReadDataIni(c$, "Utilities", p$)
  Wend
  no = i
  ReDim proglist$(no)
  For i = 0 To no - 1
    p$ = "program" + Format(i)
    a$ = ReadDataIni(c$, "Utilities", p$)
    If a$ <> "" Then proglist(i) = a$
  Next i
  
  curnode = 0
  deck.range = RANGEOBS
  timetics = 0
  dirtyflag = False

  LoadDeck = no
End Function

Sub RecalcAttrib (deck As cyberdecktype)
  Rem Recalculates the Attributes from the ....() values

  deck.bod = deck.oripp(0) + deck.add(0) - deck.dam(0) + deck.chg(0)
  deck.evasion = deck.oripp(1) + deck.add(1) - deck.dam(1) + deck.chg(1)
  deck.masking = deck.oripp(2) + deck.add(2) - deck.dam(2) + deck.chg(2)
  deck.sensor = deck.oripp(3) + deck.add(3) - deck.dam(3) + deck.chg(3)
  If deck.realfilter <> 0 Then deck.realfilter = 1
  deck.mpcp = deck.oripp(4) + deck.add(4) - deck.dam(4) + deck.chg(4) - deck.realfilteruse
  If deck.bod <= 1 And deck.oripp(0) >= 1 Then
    deck.bod = 1
    deck.dam(0) = deck.oripp(0) + deck.add(0) - deck.bod + deck.chg(0)
  End If
  If deck.evasion <= 1 And deck.oripp(1) >= 1 Then
    deck.evasion = 1
    deck.dam(1) = deck.oripp(1) + deck.add(1) - deck.evasion + deck.chg(1)
  End If
  If deck.masking <= 1 And deck.oripp(2) >= 1 Then
    deck.masking = 1
    deck.dam(2) = deck.oripp(2) + deck.add(2) - deck.masking + deck.chg(2)
  End If
  If deck.sensor <= 1 And deck.oripp(3) >= 1 Then
    deck.sensor = 1
    deck.dam(3) = deck.oripp(3) + deck.add(3) - deck.sensor + deck.chg(3)
  End If
End Sub

Sub SaveDeck (c As String, progno As Integer)
  Dim a$, b$, p$
  Dim ret%, i%

  If TestDeck(deck, progno) = False Then
    ret = MsgBox("Cyberdeck testing reveals inconsistency (see Error Messages)." & Chr$(10) & "Do you really want save this configuration?", 1 + 32 + 256)
  Else
    ret = 1  ' okay
  End If

  ' Write cyberdeck configuration
  If ret = 1 And InStr(c$, "*") <= 0 Then
    Open c$ For Output As #1
    Print #1, "[Persona]"
    Print #1, "Model=" & Format(deck.model)
    Print #1, "MPCP=" & Format(deck.oripp(4)) & "+"; Format(deck.add(4)) & "-" & deck.dam(4) & "-" & Format(-deck.chg(4))
    Rem Format: Bod=Oribod + add - dam - chg
    Print #1, "Bod=" & Format(deck.oripp(0)) & "+" & Format(deck.add(0)) & "-" & deck.dam(0) & "-" & Format(-deck.chg(0))
    Print #1, "Evasion=" & Format(deck.oripp(1)) & "+" & Format(deck.add(1)) & "-" & deck.dam(1) & "-" & Format(-deck.chg(1))
    Print #1, "Masking=" & Format(deck.oripp(2)) & "+" & Format(deck.add(2)) & "-" & deck.dam(2) & "-" & Format(-deck.chg(2))
    Print #1, "Sensor=" & Format(deck.oripp(3)) & "+" & Format(deck.add(3)) & "-" & deck.dam(3) & "-" & Format(-deck.chg(3))
    Print #1, "Damage=" & Format(deck.damage)
    Print #1,
    Print #1, "[Technical Parameters]"
    Print #1, "Hardening=" & Format(deck.hardening)
    Print #1, "ActiveMem=" & Format(deck.activemem)
    Print #1, "StorageMem=" & Format(deck.storagemem)
    Print #1, "Load=" & Format(deck.load)
    Print #1, "I/O=" & Format(deck.io)
    Print #1, "Response=" & Format(deck.response)
    Print #1, "Satuplink=" & Format(deck.satuplink)
    Print #1, "PureCyber=" & Format(deck.purecyber)
    Print #1, "RealityFilter=" & Format(deck.realfilter)
    Print #1, "DisplayMode=" & Format(deck.displaymode)
    Print #1,
    Print #1, "[Utilities]"
    For i = 0 To progno - 1
      a$ = proglist$(i)
      b$ = a$
      p$ = RTrim$(GetWord(a$, "["))
      ' save data correct in "Data-size" format
      ret = Val(a$)
      If Val(GetWord(b$, "-")) = 0 Then
        p$ = Trim$(p$) & "-" & Format(ret)
      End If
      Print #1, "Program" & Format(i + 1) & "=" & p$
    Next i
    Close #1
    dirtyflag = False
  End If

End Sub

Sub StrToDeckAttrib (c$, deck As cyberdecktype, attribnr%)
  Rem Converts String with Bod/Eva/Mask/Sens save description
  Rem into the attribute values.
  Rem Format: ori+add-dam+chg
  Dim a$, b$
  ReDim atts(5) As String
  Dim attrib As Integer

  atts(0) = "Bod"
  atts(1) = "Evasion"
  atts(2) = "Masking"
  atts(3) = "Sensor"
  atts(4) = "MPCP"
  a$ = ReadDataIni(c$, "Persona", atts(attribnr))
  deck.oripp(attribnr) = GetSignedVal(a$)
  deck.add(attribnr) = GetSignedVal(a$)
  deck.dam(attribnr) = -GetSignedVal(a$)
  deck.chg(attribnr) = GetSignedVal(a$)
  Call RecalcAttrib(deck)
  ' Debug.Print "deck.oripp,add,dam,chg="; deck.oripp(attribnr); deck.add(attribnr); deck.dam(attribnr); deck.chg(attribnr)

End Sub

Function TestDeck (deck As cyberdecktype, progno As Integer) As Integer
  Rem Check consistency of the Cyberdeck
  Dim ret%, r%, effmpcp%, i%
  Dim s As Long
  Dim sizearmor%, sizeattack%, sizecloak%, sizedeception%, sizeshield%, sizesleaze%
  Dim a$, b$, p$, mpcp$, mpcp2$
  Dim testdeckstr$

  ret = False
  sizearmor = 10000
  sizeattack = 10000
  sizecloak = 10000
  sizedeception = 10000
  sizeshield = 10000
  sizesleaze = 10000
  
  Form1.pad = ""
  If deck.realfilteruse <> 0 Then deck.realfilteruse = 1
  effmpcp = deck.oripp(4)
  If deck.realfilteruse <> 0 Then
    mpcp$ = " effective MPCP"
    mpcp2$ = "Effective MPCP"
  Else
    mpcp$ = " MPCP"
    mpcp2$ = "MPCP"
  End If
  If deck.oripp(4) > 24 Then
    NewPad ("Never heard of a cyberdeck with MPCP above 24! Are you God?")
  ElseIf deck.oripp(0) + deck.oripp(1) + deck.oripp(2) + deck.oripp(3) - deck.add(0) - deck.add(1) - deck.add(2) - deck.add(3) > 3 * effmpcp Then
    NewPad ("Rating of Persona programs higher than" & mpcp$ & " supports.")
  ElseIf deck.oripp(0) > effmpcp Then
    NewPad ("Bod rate cannot be higher as" & mpcp$ & "!")
  ElseIf deck.oripp(1) > effmpcp Then
    NewPad ("Evasion rate cannot be higher as" & mpcp$ & "!")
  ElseIf deck.oripp(2) > effmpcp Then
    NewPad ("Masking rate cannot be higher as" & mpcp$ & "!")
  ElseIf deck.oripp(3) > effmpcp Then
    NewPad ("Sensor rate cannot be higher as" & mpcp$ & "!")
  ElseIf deck.hardening > Int(.5 * effmpcp) Then
    NewPad (mpcp2$ & " cannot handle such a high hardening!")
  ElseIf deck.activemem > 50 * effmpcp Then
    NewPad (mpcp2$ & " cannot address so much active memory!")
  ElseIf deck.load > 10 * effmpcp Then
    NewPad (mpcp2$ & " cannot handle such a high Load speed!")
  ElseIf deck.io > 5 * effmpcp Then
    NewPad (mpcp2$ & " cannot handle such a high I/O speed!")
  ElseIf deck.response > Int(effmpcp / 4) Then
    NewPad (mpcp2$ & " cannot handle such a high Response Increase factor.")
  ElseIf deck.storageprogmem > deck.storagemem Then
    NewPad ("Storage Memory too small to hold all utilities!")
  Else
    ' Compressor can handle all programs
    ret = True
    For i = 0 To progno - 1
      a$ = proglist$(i)
      p$ = GetWord(a$, "-")
      r = Val(a$)
      a$ = proglist$(i)
      b$ = UCase$(StrwoBrackets(GetWord(a$, "-")))
      s = CalcProgsize(p$, r)
      Select Case b$
        Case "ATTACK": If sizeattack > s Then sizeattack = s
        Case "ARMOR": If sizearmor > s Then sizearmor = s
        Case "CLOAK": If sizecloak > s Then sizecloak = s
        Case "DECEPTION": If sizedeception > s Then sizedeception = s
        Case "SHIELD": If sizeshield > s Then sizeshield = s
        Case "SLEAZE": If sizesleaze > s Then sizesleaze = s
      End Select
      Rem  A program to large for active mem ?
      If s > deck.activemem Then
        ret = False
        NewPad ("Program " & p$ & "-" & Format(r) & " too large for active memory!")
      End If
      If deck.compressed > 0 And s > 100 * deck.compressed Then
        NewPad ("Program " & p$ & "-" & Format(r) & " too large for Compressor-" & Format(deck.compressed) & "!")
        ret = False
      End If
    Next i
    If sizeattack = 10000 Then sizeattack = 0
    If sizearmor = 10000 Then sizearmor = 0
    If sizecloak = 10000 Then sizecloak = 0
    If sizedeception = 10000 Then sizedeception = 0
    If sizeshield = 10000 Then sizeshield = 0
    If sizesleaze = 10000 Then sizesleaze = 0

    If sizeattack + sizearmor > deck.activemem Then
      NewPad ("Attack + Armor do not fit together in active memory.")
      ret = False
    ElseIf sizesleaze + sizecloak > deck.activemem Then
      NewPad ("Sleaze + Cloak do not fit together in active memory.")
      ret = False
    ElseIf sizedeception + sizecloak > deck.activemem Then
      NewPad ("Deception + Cloak do not fit together in active memory.")
      ret = False
    ElseIf sizeattack + sizeshield > deck.activemem Then
      NewPad ("Attack + Shield do not fit together in active memory.")
      ret = False
    End If
  End If
  TestDeck = ret


End Function

