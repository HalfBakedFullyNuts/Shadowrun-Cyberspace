VERSION 2.00
Begin Form Form8 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Secret Information"
   ClientHeight    =   2505
   ClientLeft      =   7410
   ClientTop       =   4665
   ClientWidth     =   3960
   Height          =   2910
   Icon            =   CYBER08.FRX:0000
   Left            =   7350
   LinkTopic       =   "Form8"
   ScaleHeight     =   2505
   ScaleWidth      =   3960
   Top             =   4320
   Width           =   4080
   Begin CommandButton Clear 
      BackColor       =   &H00000000&
      Caption         =   "&Clear"
      Height          =   375
      Left            =   3120
      TabIndex        =   2
      Top             =   2040
      Width           =   735
   End
   Begin Label pad 
      BackColor       =   &H00808080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " "
      ForeColor       =   &H0000FFFF&
      Height          =   2055
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   3735
      WordWrap        =   -1  'True
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Gamemaster's Logfile"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3735
   End
End
Option Explicit

Sub Clear_Click ()
  pad.Caption = ""
End Sub

