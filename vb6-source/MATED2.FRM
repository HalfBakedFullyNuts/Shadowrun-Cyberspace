VERSION 2.00
Begin Form Form2 
   BackColor       =   &H00C0C0C0&
   Caption         =   "ICE Construction"
   ClientHeight    =   4440
   ClientLeft      =   1800
   ClientTop       =   1425
   ClientWidth     =   5250
   Height          =   4845
   Icon            =   MATED2.FRX:0000
   Left            =   1740
   LinkTopic       =   "Form2"
   ScaleHeight     =   4440
   ScaleWidth      =   5250
   Top             =   1080
   Width           =   5370
   Begin ComboBox ComboNodes 
      Height          =   315
      Left            =   2880
      TabIndex        =   27
      Text            =   "Combo1"
      Top             =   3960
      Width           =   1695
   End
   Begin CommandButton Command1 
      Caption         =   "&Ready with this node"
      Height          =   375
      Left            =   240
      TabIndex        =   26
      Top             =   3960
      Width           =   2295
   End
   Begin ComboBox Combotrig 
      BackColor       =   &H00FFFFFF&
      Height          =   300
      Index           =   1
      Left            =   2760
      TabIndex        =   25
      Text            =   "none"
      Top             =   2520
      Width           =   2295
   End
   Begin SSFrame Frame3D3 
      Caption         =   "ICE Construction: "
      Font3D          =   4  'Inset w/heavy shading
      ForeColor       =   &H00000000&
      Height          =   3855
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   5055
      Begin ComboBox Combotrig 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Index           =   0
         Left            =   120
         TabIndex        =   24
         Text            =   "none"
         Top             =   2520
         Width           =   2295
      End
      Begin ComboBox ICEType 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   1800
         TabIndex        =   21
         Text            =   "Access"
         Top             =   360
         Width           =   2055
      End
      Begin SpinButton Spin1 
         Height          =   255
         Left            =   4440
         Top             =   360
         Width           =   255
      End
      Begin TextBox TextRating 
         Height          =   285
         Left            =   4080
         TabIndex        =   20
         Text            =   "6"
         Top             =   360
         Width           =   375
      End
      Begin ListBox List2 
         BackColor       =   &H00808080&
         Height          =   615
         Left            =   1440
         TabIndex        =   19
         Top             =   3000
         Width           =   3495
      End
      Begin CommandButton Command3 
         Caption         =   "&Add ICE"
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   18
         Top             =   3000
         Width           =   1095
      End
      Begin CommandButton Command3 
         Caption         =   "&Erase ICE"
         Height          =   375
         Index           =   1
         Left            =   240
         TabIndex        =   17
         Top             =   3360
         Width           =   1095
      End
      Begin SSFrame Frame3D4 
         Caption         =   "Staging:"
         Font3D          =   3  'Inset w/light shading
         ForeColor       =   &H00000000&
         Height          =   1335
         Left            =   120
         ShadowStyle     =   1  'Raised
         TabIndex        =   12
         Top             =   840
         Width           =   1575
         Begin SSOption Option3D3 
            Caption         =   "(L) no"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   16
            Top             =   240
            Width           =   855
         End
         Begin SSOption Option3D3 
            Caption         =   "(M) moderate"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   15
            Top             =   480
            Width           =   1365
         End
         Begin SSOption Option3D3 
            Caption         =   "(S) serious"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   14
            Top             =   720
            Width           =   1215
         End
         Begin SSOption Option3D3 
            Caption         =   "(D) deadly"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   13
            Top             =   960
            Width           =   1215
         End
      End
      Begin SSFrame Frame3D5 
         Caption         =   "Activity:"
         Font3D          =   3  'Inset w/light shading
         ForeColor       =   &H00000000&
         Height          =   1335
         Left            =   1800
         ShadowStyle     =   1  'Raised
         TabIndex        =   7
         Top             =   840
         Width           =   1575
         Begin SSOption Option3D5 
            Caption         =   "ever"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   11
            Top             =   240
            Width           =   1335
         End
         Begin SSOption Option3D5 
            Caption         =   "passive Alert"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   10
            Top             =   480
            Width           =   1335
         End
         Begin SSOption Option3D5 
            Caption         =   "active Alert"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   9
            Top             =   720
            Width           =   1335
         End
         Begin SSOption Option3D5 
            Caption         =   "triggered"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   8
            Top             =   960
            Width           =   1335
         End
      End
      Begin SSFrame Frame3D6 
         Caption         =   "Mobility:"
         Font3D          =   3  'Inset w/light shading
         ForeColor       =   &H00000000&
         Height          =   1335
         Left            =   3480
         ShadowStyle     =   1  'Raised
         TabIndex        =   2
         Top             =   840
         Width           =   1455
         Begin SSOption Option3D4 
            Caption         =   "mobile"
            Height          =   255
            Index           =   0
            Left            =   120
            TabIndex        =   6
            Top             =   240
            Width           =   855
         End
         Begin SSOption Option3D4 
            Caption         =   "mobile (pas)"
            Height          =   255
            Index           =   1
            Left            =   120
            TabIndex        =   5
            Top             =   480
            Width           =   1260
         End
         Begin SSOption Option3D4 
            Caption         =   "mobile (act)"
            Height          =   255
            Index           =   2
            Left            =   120
            TabIndex        =   4
            Top             =   720
            Width           =   1290
         End
         Begin SSOption Option3D4 
            Caption         =   "immobile"
            Height          =   255
            Index           =   3
            Left            =   120
            TabIndex        =   3
            Top             =   960
            Width           =   1275
         End
      End
      Begin ComboBox Combo2 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   120
         TabIndex        =   1
         Text            =   "White"
         Top             =   360
         Width           =   1575
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "alarmed triggers:"
         Height          =   255
         Index           =   1
         Left            =   2880
         TabIndex        =   23
         Top             =   2280
         Width           =   1695
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "suspicious triggers:"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   22
         Top             =   2280
         Width           =   1695
      End
   End
End
Option Explicit

Dim ptrigger As Integer
Dim atrigger As Integer

Sub Combo2_Change ()
  Rem ICE Color (White/Gray/Black Phys/Black Stun)
  Dim a$
  Dim i%, ret%

  a$ = UCase$(Combo2.Text)
  For i = 0 To 3
    If a$ = UCase$(icoltypes(i)) Then
      ret = i
      Exit For
    End If
  Next i
  If ret = -1 Then
    a$ = Left$(a$, 1)
    Select Case a$
      Case "W": ret = 0
      Case "G": ret = 1
      Case "B", "P": ret = 2
      Case "S": ret = 3
    End Select
  End If
  If ret >= 0 Then
    Combo2.Text = icoltypes(ret)
    icecolor = ret
  Else
    Combo2.Text = icoltypes(icecolor)
  End If
  Select Case icecolor
    Case 0:
      Option3D3(0).Value = True
      Option3D5(0).Value = True
      Option3D4(0).Value = True
    Case 1:
      Option3D3(0).Value = True
      Option3D5(1).Value = True
      Option3D4(1).Value = True
    Case 2, 3:
      Option3D3(0).Value = True
      Option3D5(1).Value = True
      Option3D4(1).Value = True
  End Select

End Sub

Sub Combo2_Click ()
  Call Combo2_Change
End Sub

Sub ComboNodes_Change ()
    curnode = Val(Combonodes.Text)
    Call UpdateTriggerCombos
    Call ShowICEList(curnode)
End Sub

Sub ComboNodes_Click ()
  Call ComboNodes_Change
End Sub

Sub Combotrig_Change (Index As Integer)
  Dim i%
  Dim icenr%

  If Combotrig(Index).Text = "none" Then
    icenr = -1
  ElseIf Combotrig(Index).Text = "All trig. ICE in Matrix" Then
    icenr = -2
  ElseIf Combotrig(Index).Text = "All ICE in same " & node(curnode).typ & Format(curnode) Then
    icenr = -3
  Else
    icenr = Val(Combotrig(Index).Text)
  End If
  If Index = 0 Then ptrigger = icenr Else atrigger = icenr
  Debug.Print "Change Combotrig: "; icenr
End Sub

Sub Combotrig_Click (Index As Integer)
  Combotrig_Change (Index)
End Sub

Sub Command1_Click ()
  Rem Button: closes this form

  Form2.Hide   ' Hide would not refresh status
End Sub

Sub Command3_Click (Index As Integer)
  Rem Button: Add ICE / Erase ICE
  Dim k%, r%, act%, mob%, ret%, ats%, pts%
  Dim a$, b$, c$, s$, t$

  If curnode <> -1 Then
    If Index = 0 Then ' Add ICE
      Select Case icecolor
        Case 0: b$ = "White"
        Case 1: b$ = "Gray"
        Case 2: b$ = "Black"
        Case 3: b$ = "Black"
      End Select
      ice(icenum).code = b$
      a$ = ICEType.Text
      ice(icenum).description = a$
      If icecolor <= 1 And staging = 0 Then
        b$ = ""
      Else
        Select Case icecolor
          Case 0, 1: b$ = " ("
          Case 2: b$ = " (Phys"
          Case 3: b$ = " (Stun"
        End Select
        Select Case staging
          Case 0: s$ = "L)"
          Case 1: s$ = "M)"
          Case 2: s$ = "S)"
          Case 3: s$ = "D)"
        End Select
      End If
      a$ = a$ & b$ & s$
      ice(icenum).description = a$
      ice(icenum).rating = Format(TextRating.Text)
      ice(icenum).active = activity
      ice(icenum).mobile = mobility
      ice(icenum).nodenr = curnode
      ice(icenum).damage = 0
      Debug.Print "ptrigger/atrigger = "; ptrigger, atrigger
      ice(icenum).ptrigger = ptrigger
      ice(icenum).atrigger = atrigger
      icenum = icenum + 1
      Call UpdateTriggerCombos
      Form1.ICEnrLabel.Caption = "ICEs: " & Format(icenum)
      For k = 0 To icenum - 1
        Debug.Print ice(k).description; "pts"; ice(k).ptrigger
      Next k%
    Else              ' erase ICE

      If List2.ListIndex >= 0 Then
        a$ = UCase$(List2.List(List2.ListIndex))
        Debug.Print "Loesche Eintrag: "; a$
        c$ = GetWord(a$, " ")
        b$ = GetWord(a$, "-")
        r = Val(GetWord(a$, " "))
        pts = -1
        ats = -1
        If InStr(a$, "PTS") > 0 Then pts = Val(Mid$(a$, InStr(a$, "PTS") + 3))
        If InStr(a$, "ATS") > 0 Then ats = Val(Mid$(a$, InStr(a$, "ATS") + 3))
        While a$ <> ""
          Select Case GetWord(a$, " ")
            Case "EVER": act = 0
            Case "PASSIVE": act = 1
            Case "ACTIVE": act = 2
            Case "TRIGGERED": act = 3
            Case "NEVER": act = 4
            Case "MOBILE": mob = EMOBILE
            Case "PMOBILE": mob = PMOBILE
            Case "AMOBILE": mob = AMOBILE
            Case "IMMOBILE": mob = IMOBILE
          End Select
        Wend
        ret = -1
        Debug.Print "c$ act/mob/pts/ats/r b$="; c$, act, mob, pts, ats, r, b$
        For k = 0 To icenum - 1
          If ice(k).nodenr = curnode And UCase$(ice(k).code) = c$ And UCase$(ice(k).description) = b$ And ice(k).rating = r And ice(k).active = act And ice(k).mobile = mob And ice(k).atrigger = ats And ice(k).ptrigger = pts Then
            ret = k
            Exit For
          End If
        Next k
        If ret >= 0 Then
          Debug.Print "Loesche ICE "; ret; " "; ice(ret).description
        Else
          Debug.Print "Loesche ICE "; ret
        End If
        DeleteICE (ret)
      End If
    End If
    ShowICEList (curnode)
    List2.ListIndex = List2.ListCount - 1
    Form1.ICEnrLabel.Caption = "ICEs: " & Format(icenum)
  End If

End Sub

Sub Form_Activate ()
  Dim i%
  Dim a$

  ptrigger = -1
  atrigger = -1
  a$ = Combo2.Text
  Combo2.Clear
  Combo2.Text = a$
  a$ = ICEType.Text
  ICEType.Clear
  ICEType.Text = a$
  For i = 0 To 3
    Combo2.AddItem icoltypes(i)
  Next i
  For i = 0 To 14
    ICEType.AddItem icetypes(i)
  Next i
  Option3D3(0).Value = True   ' Staging (L)
  Option3D4(3).Value = True   ' Mobility immobile
  Option3D5(0).Value = True   ' Activity ever
  Call UpdateTriggerCombos
  Call UpdateNodeCombo
  ShowICEList (curnode)

End Sub

Sub ICEType_Change ()
  Dim a$
  Dim i%, ret%

  a$ = UCase$(ICEType.Text)
  ret = -1
  For i = 0 To 14
    If a$ = UCase$(icetypes(i)) Then
      ret = i
      Exit For
    End If
  Next i
  If ret = -1 Then
    For i = 0 To 14
      If UCase$(Left$(icetypes(i), 1)) = Left$(a$, 1) Then
        ret = i
        Exit For
      End If
    Next i
  End If
  Debug.Print "Ret="; ret
  If ret >= 0 Then
    ICEType.Text = icetypes(ret)
    Select Case ret
      Case 0, 1, 2, 3: Combo2.Text = "White"
      Case Else: Combo2.Text = "Gray"
    End Select
  Else
    ICEType.Text = icetypes(0)
  End If

End Sub

Sub ICEType_Click ()
  Call ICEType_Change
End Sub

Sub Option3D3_Click (Index As Integer, Value As Integer)
  If Value = True Then
    staging = Index
  End If
End Sub

Sub Option3D4_Click (Index As Integer, Value As Integer)
  If Value = True Then
    mobility = Index
  End If
End Sub

Sub Option3D5_Click (Index As Integer, Value As Integer)
  If Value = True Then
    activity = Index
  End If
End Sub

Sub ShowICEList (nodenr%)
  Rem Show all ICE in node in a list
  Dim i%, n%, icenr%
  Dim a$
  Static activestr(0 To 4)

  activestr(0) = "ever"
  activestr(1) = "passive"
  activestr(2) = "active"
  activestr(3) = "triggered"
  activestr(4) = "never"

  n = GetAllICEofNode(nodenr)
  List2.Clear
  For i = 0 To n - 1
    icenr = iceofnode(i)
    a$ = ice(icenr).code & " " & ice(icenr).description & "-" & Format(ice(icenr).rating) & " " & activestr(ice(icenr).active)
    Select Case ice(icenr).mobile
      Case EMOBILE: a$ = a$ & " mobile"
      Case PMOBILE: a$ = a$ & " pmobile"
      Case AMOBILE: a$ = a$ & " amobile"
      Case IMOBILE: a$ = a$ & " immobile"
    End Select
    If ice(icenr).ptrigger <> -1 Then
      a$ = a$ & " pts" & Format(ice(icenr).ptrigger)
    End If
    If ice(icenr).atrigger <> -1 Then
      a$ = a$ & " ats" & Format(ice(icenr).atrigger)
    End If

    List2.AddItem a$
  Next i

  
End Sub

Sub Spin1_SpinDown ()
  Dim r%

  r = Val(TextRating.Text) - 1
  If r = -1 Then r = 0
  TextRating.Text = Format(r)
End Sub

Sub Spin1_SpinUp ()
  Dim r%

  r = Val(TextRating.Text) + 1
  If r < 0 Then r = 0
  TextRating.Text = Format(r)
End Sub

Sub UpdateNodeCombo ()
  Dim i%
  Dim a$

  Combonodes.Clear
  a$ = Format(curnode) & " " & node(curnode).typ & " " & Left$(node(curnode).color, 1) & "-" & node(curnode).rating
  Combonodes.Text = a$
  For i = 1 To nodenum
    a$ = Format(i) & " " & node(i).typ & " " & Left$(node(i).color, 1) & "-" & node(i).rating
    Combonodes.AddItem a$
  Next i

End Sub

Sub UpdateTriggerCombos ()
  Dim icenr%
  Dim a$

  Combotrig(0).Clear
  Combotrig(1).Clear
  Combotrig(0).Text = "none"
  Combotrig(1).Text = "none"
  Combotrig(0).AddItem "none"
  Combotrig(1).AddItem "none"
  Combotrig(0).AddItem "All trig. ICE in Matrix"
  Combotrig(1).AddItem "All trig. ICE in Matrix"
  Combotrig(0).AddItem "All ICE in same " & node(curnode).typ & Format(curnode)
  Combotrig(1).AddItem "All ICE in same " & node(curnode).typ & Format(curnode)
  For icenr = 0 To icenum - 1
    If ice(icenr).active = 3 Then  ' triggerable
      a$ = Format(icenr, "000") & " " & ice(icenr).description & "-" & Format(ice(icenr).rating) & " " & node(ice(icenr).nodenr).typ & Format(ice(icenr).nodenr)
      Combotrig(0).AddItem a$
      Combotrig(1).AddItem a$
    End If
  Next icenr
End Sub

