VERSION 2.00
Begin Form Form5 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Teleport"
   ClientHeight    =   1680
   ClientLeft      =   2310
   ClientTop       =   1530
   ClientWidth     =   4230
   Height          =   2085
   Icon            =   CYBER05.FRX:0000
   Left            =   2250
   LinkTopic       =   "Form5"
   ScaleHeight     =   1680
   ScaleWidth      =   4230
   Top             =   1185
   Width           =   4350
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   705
      Index           =   1
      Left            =   0
      TabIndex        =   5
      Top             =   975
      Width           =   4230
      Begin CommandButton Abort 
         Caption         =   "&Abort"
         Height          =   450
         Left            =   3120
         TabIndex        =   7
         Top             =   120
         Width           =   915
      End
      Begin CommandButton Teleport 
         Caption         =   "&Teleport"
         Height          =   450
         Left            =   2040
         TabIndex        =   6
         Top             =   120
         Width           =   915
      End
      Begin SSFrame Frame3D1 
         Height          =   570
         Left            =   120
         TabIndex        =   0
         Top             =   45
         Width           =   1725
         Begin Label Label2 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "1 - SAN @(7,1)"
            Height          =   195
            Left            =   225
            TabIndex        =   2
            Top             =   210
            Width           =   1335
         End
      End
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   600
      Index           =   0
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   4215
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Choose node number for teleport:"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "MS Sans Serif"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   495
         Index           =   0
         Left            =   120
         TabIndex        =   4
         Top             =   60
         Width           =   3015
      End
   End
   Begin HScrollBar HScroll1 
      Height          =   375
      Left            =   1
      Min             =   1
      TabIndex        =   1
      Top             =   600
      Value           =   1
      Width           =   4215
   End
End

Sub Abort_Click ()
    Rem Press Abort button

    retdata = -1
    Form5.Hide
End Sub

Sub Form_Activate ()
    Dim i%

    Call HScroll1_GotFocus
    i = HScroll1.Value
    Label2.Caption = Format(i) & " " & node(i).typ & " @(" & Format(node(i).xpos) & "," & Format(node(i).ypos) & ")"

End Sub

Sub HScroll1_Change ()
    Dim i%

    i = HScroll1.Value
    Label2.Caption = Format(i) & " " & node(i).typ & " @(" & Format(node(i).xpos) & "," & Format(node(i).ypos) & ")"

End Sub

Sub HScroll1_GotFocus ()
    HScroll1.Max = nodenum
End Sub

Sub Teleport_Click ()
    Rem Teleport to other node

    deck.range = RANGECON
    retdata = HScroll1.Value
    Form5.Hide

End Sub

