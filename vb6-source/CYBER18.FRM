VERSION 2.00
Begin Form Form18 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Real Time Decking"
   ClientHeight    =   3855
   ClientLeft      =   7185
   ClientTop       =   1365
   ClientWidth     =   3030
   Height          =   4260
   Icon            =   CYBER18.FRX:0000
   Left            =   7125
   LinkTopic       =   "Form18"
   ScaleHeight     =   3855
   ScaleWidth      =   3030
   Top             =   1020
   Width           =   3150
   Begin SpinButton Spin1 
      Delay           =   75
      Height          =   255
      Left            =   720
      Top             =   2880
      Width           =   255
   End
   Begin CommandButton NoButton 
      Caption         =   "&No Real Time"
      Height          =   375
      Left            =   1560
      TabIndex        =   3
      Top             =   3360
      Width           =   1335
   End
   Begin CommandButton OkayButton 
      Caption         =   "&Okay"
      Default         =   -1  'True
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   3360
      Width           =   1335
   End
   Begin TextBox SecText 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "3.1"
      Top             =   2880
      Width           =   615
   End
   Begin Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Consider this time as maximum thinking time, before you loose one action turn. As soon as you choose your action, ICE has its action turn (even with 65 sec)."
      Height          =   1215
      Left            =   120
      TabIndex        =   5
      Top             =   1560
      Width           =   2775
   End
   Begin Label Label2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "seconds"
      Height          =   255
      Left            =   1080
      TabIndex        =   4
      Top             =   2880
      Width           =   1455
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Now start real time decking! Input the number of real time seconds you will have for one complex action.  Be carefull! A low value may block your computer! 3.1 seconds may be appropriate."
      Height          =   1455
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   2775
   End
End
Option Explicit

Sub NoButton_Click ()
  retdata = 0
  Form18.Hide
End Sub

Sub OkayButton_Click ()
  Dim ret As Single

  ret = Val(SecText.Text)
  If ret > 65.5 Or ret < .1 Then
    MsgBox "Invalid value. Choose seconds between 0.1 and 65.5."
    GoTo EndOfOkay
  End If
  retdata = ret * 1000
  Form18.Hide
EndOfOkay:
End Sub

Sub Spin1_SpinDown ()
  Dim ret As Single
  
  ret = Val(SecText.Text) - 1
  If ret < 1 Then
    ret = 1
  End If
  SecText.Text = Format(ret)
  retdata = ret * 1000
End Sub

Sub Spin1_SpinUp ()
  Dim ret As Single

  ret = Val(SecText.Text) + 1
  If ret > 65.5 Then
    ret = 65.5
  End If
  SecText.Text = Format(ret)
  retdata = ret * 1000
End Sub

