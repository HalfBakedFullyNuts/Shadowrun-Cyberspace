VERSION 2.00
Begin Form Form7 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Data files"
   ClientHeight    =   2025
   ClientLeft      =   2925
   ClientTop       =   1485
   ClientWidth     =   3405
   Height          =   2430
   Icon            =   CYBER07.FRX:0000
   Left            =   2865
   LinkTopic       =   "Form7"
   ScaleHeight     =   2025
   ScaleWidth      =   3405
   Top             =   1140
   Width           =   3525
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   1065
      Index           =   1
      Left            =   15
      TabIndex        =   5
      Top             =   960
      Width           =   3390
      Begin CommandButton Command2 
         Cancel          =   -1  'True
         Caption         =   "&Cancel"
         Height          =   495
         Left            =   2400
         TabIndex        =   8
         Top             =   435
         Width           =   855
      End
      Begin CommandButton Command1 
         Caption         =   "&Okay"
         Height          =   495
         Left            =   1440
         TabIndex        =   1
         Top             =   435
         Width           =   855
      End
      Begin SSFrame Frame3D1 
         Height          =   570
         Left            =   120
         TabIndex        =   2
         Top             =   360
         Width           =   1215
         Begin Label Label2 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackColor       =   &H00C0C0C0&
            Caption         =   "1 - 100 MP"
            Height          =   195
            Left            =   135
            TabIndex        =   6
            Top             =   210
            Width           =   975
         End
      End
      Begin Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Filename"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   120
         Width           =   3135
      End
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   600
      Index           =   0
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   3390
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Choose file number to transfer:"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "MS Sans Serif"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   495
         Left            =   300
         TabIndex        =   4
         Top             =   45
         Width           =   2805
      End
   End
   Begin HScrollBar HScroll1 
      Height          =   375
      Left            =   0
      Min             =   1
      TabIndex        =   0
      Top             =   600
      Value           =   1
      Width           =   3375
   End
End
Option Explicit

Sub Command1_Click ()
  Rem Return data file number

  retdata = HScroll1.Value
  Form7.Hide
End Sub

Sub Command2_Click ()
    Rem Cancel-Button
    
    retdata = -1
    Form7.Hide
End Sub

Sub Form_Activate ()
  Dim i%

  i = HScroll1.Value
  If i > node(curnode).nfiles Then i = node(curnode).nfiles
  HScroll1.Value = i
  Label2.Caption = Format(i) & " - " & Format(node(curnode).file(i).size) & " MP"
  label3.Caption = node(curnode).file(i).name

End Sub

Sub HScroll1_Change ()
  Dim i%

  i = HScroll1.Value
  Label2.Caption = Format(i) & " - " & Format(node(curnode).file(i).size) & " MP"
  label3.Caption = node(curnode).file(i).name
End Sub

Sub HScroll1_GotFocus ()
  
  HScroll1.Max = node(curnode).nfiles

End Sub

