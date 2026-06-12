VERSION 2.00
Begin Form Form12 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Repair Damage"
   ClientHeight    =   2220
   ClientLeft      =   2505
   ClientTop       =   1200
   ClientWidth     =   6015
   Height          =   2625
   Icon            =   CYBER12.FRX:0000
   Left            =   2445
   LinkTopic       =   "Form12"
   ScaleHeight     =   2220
   ScaleWidth      =   6015
   Top             =   855
   Width           =   6135
   Begin SSCommand Command3D1 
      Caption         =   "&Sensor"
      ForeColor       =   &H00000000&
      Height          =   1095
      Index           =   3
      Left            =   4560
      Picture         =   CYBER12.FRX:0302
      RoundedCorners  =   0   'False
      TabIndex        =   5
      Top             =   960
      Width           =   1215
   End
   Begin SSCommand Command3D1 
      Caption         =   "&Masking"
      ForeColor       =   &H00000000&
      Height          =   1095
      Index           =   2
      Left            =   3120
      Picture         =   CYBER12.FRX:114C
      RoundedCorners  =   0   'False
      TabIndex        =   4
      Top             =   960
      Width           =   1215
   End
   Begin SSCommand Command3D1 
      Caption         =   "&Evasion"
      ForeColor       =   &H00000000&
      Height          =   1095
      Index           =   1
      Left            =   1680
      Picture         =   CYBER12.FRX:1F0C
      RoundedCorners  =   0   'False
      TabIndex        =   3
      Top             =   960
      Width           =   1215
   End
   Begin SSCommand Command3D1 
      Caption         =   "&Body"
      ForeColor       =   &H00000000&
      Height          =   1095
      Index           =   0
      Left            =   240
      Picture         =   CYBER12.FRX:2D56
      RoundedCorners  =   0   'False
      TabIndex        =   2
      Top             =   960
      Width           =   1215
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   735
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6030
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "More than one persona program has taken damage. Choose the one you like to repair:"
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
         Width           =   5775
      End
   End
End
Option Explicit

Sub Command3D1_Click (index As Integer)
  Rem Return number of persona program to repair
  retdata = index
  Form12.Hide
End Sub

