VERSION 2.00
Begin Form Form9 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Hacking Pool Splitting"
   ClientHeight    =   2295
   ClientLeft      =   1110
   ClientTop       =   1500
   ClientWidth     =   3405
   Height          =   2700
   Icon            =   CYBER09.FRX:0000
   Left            =   1050
   LinkTopic       =   "Form9"
   ScaleHeight     =   2295
   ScaleWidth      =   3405
   Top             =   1155
   Width           =   3525
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   720
      Index           =   1
      Left            =   15
      TabIndex        =   0
      Top             =   1575
      Width           =   3390
      Begin CommandButton Command1 
         Caption         =   "&Okay"
         Height          =   450
         Left            =   2085
         TabIndex        =   6
         Top             =   165
         Width           =   1035
      End
      Begin SSFrame Frame3D2 
         Height          =   555
         Left            =   450
         TabIndex        =   2
         Top             =   45
         Width           =   870
         Begin Label Label2 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "20/20"
            Height          =   195
            Left            =   165
            TabIndex        =   3
            Top             =   165
            Width           =   555
         End
      End
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   1200
      Index           =   0
      Left            =   0
      TabIndex        =   4
      Top             =   0
      Width           =   3390
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "How many dices of your hacking pool would you like to spend at maximum for every first simple action?"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "MS Sans Serif"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   975
         Index           =   0
         Left            =   120
         TabIndex        =   5
         Top             =   120
         Width           =   3015
      End
   End
   Begin HScrollBar HScroll1 
      Height          =   375
      Left            =   0
      Min             =   1
      TabIndex        =   1
      Top             =   1200
      Value           =   1
      Width           =   3375
   End
End
Option Explicit

Sub Command1_Click ()
  Form9.Hide
End Sub

Sub Form_Activate ()
  Dim i%

  HScroll1.Min = 0
  HScroll1.Max = decker.hackingpool
  If decker.spendhacking > decker.hackingpool Then decker.spendhacking = decker.hackingpool
  HScroll1.Value = decker.spendhacking
  Call HScroll1_GotFocus
  Label2.Caption = Format(decker.spendhacking) & "/" & Format(decker.hackingpool)

End Sub

Sub HScroll1_Change ()
  Dim i%

  i = HScroll1.Value
  decker.spendhacking = i
  Label2.Caption = Format(i) & "/" & Format(decker.hackingpool)

End Sub

Sub HScroll1_GotFocus ()
  HScroll1.Max = decker.hackingpool
End Sub

