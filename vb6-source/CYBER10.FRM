VERSION 2.00
Begin Form Form10 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Interactive Learning Facility"
   ClientHeight    =   2490
   ClientLeft      =   4410
   ClientTop       =   1395
   ClientWidth     =   3960
   Height          =   2895
   Icon            =   CYBER10.FRX:0000
   Left            =   4350
   LinkTopic       =   "Form10"
   ScaleHeight     =   2490
   ScaleWidth      =   3960
   Top             =   1050
   Width           =   4080
   Begin CommandButton Clear 
      BackColor       =   &H00000000&
      Caption         =   "&Clear"
      Height          =   375
      Left            =   3120
      TabIndex        =   1
      Top             =   2040
      Width           =   735
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Suggestion Notes"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   3735
   End
   Begin Label pad 
      BackColor       =   &H00808080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      ForeColor       =   &H0000FFFF&
      Height          =   2055
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   3735
      WordWrap        =   -1  'True
   End
End
Option Explicit

Sub Clear_Click ()
  Pad.Caption = ""
End Sub

