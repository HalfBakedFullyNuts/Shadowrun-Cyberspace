VERSION 2.00
Begin Form Form14 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Multiple ICE in node"
   ClientHeight    =   2400
   ClientLeft      =   2460
   ClientTop       =   1500
   ClientWidth     =   3270
   Height          =   2805
   Icon            =   CYBER14.FRX:0000
   Left            =   2400
   LinkTopic       =   "Form14"
   ScaleHeight     =   2400
   ScaleWidth      =   3270
   Top             =   1155
   Width           =   3390
   Begin CommandButton Command1 
      Caption         =   "Attack all with Area-Effect"
      Height          =   375
      Left            =   240
      TabIndex        =   3
      Top             =   1920
      Width           =   2775
   End
   Begin ListBox icelist 
      BackColor       =   &H00808080&
      Height          =   1005
      Left            =   240
      TabIndex        =   2
      Top             =   840
      Width           =   2775
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   735
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3270
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Choose that ICE from the list you want to deal with:"
         FontBold        =   -1  'True
         FontItalic      =   0   'False
         FontName        =   "MS Sans Serif"
         FontSize        =   9.75
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   495
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   3015
      End
   End
End
Option Explicit

Sub Command1_Click ()
  retdata = -2
  Form14.Hide
End Sub

Sub icelist_Click ()
  
  retdata = icelist.ListIndex
  Form14.Hide
End Sub

