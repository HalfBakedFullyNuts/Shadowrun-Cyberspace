VERSION 2.00
Begin Form Form17 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Speed Read"
   ClientHeight    =   2175
   ClientLeft      =   4770
   ClientTop       =   1290
   ClientWidth     =   3120
   Height          =   2580
   Icon            =   CYBER17.FRX:0000
   Left            =   4710
   LinkTopic       =   "Form17"
   ScaleHeight     =   2175
   ScaleWidth      =   3120
   Top             =   945
   Width           =   3240
   Begin TextBox IncreasefactorText 
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   12
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   420
      Left            =   600
      TabIndex        =   4
      Text            =   "20"
      Top             =   600
      Width           =   495
   End
   Begin SpinButton Spin1 
      Height          =   390
      Left            =   1050
      Top             =   600
      Width           =   300
   End
   Begin CommandButton OkayButton 
      Caption         =   "&Okay"
      Default         =   -1  'True
      Height          =   465
      Left            =   1680
      TabIndex        =   3
      Top             =   1560
      Width           =   1215
   End
   Begin Label PercentLabel 
      BackColor       =   &H00C0C0C0&
      Caption         =   "100%"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   15
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   435
      Left            =   240
      TabIndex        =   2
      Top             =   1560
      Width           =   855
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Chance to oversee some piece of information is "
      Height          =   450
      Left            =   120
      TabIndex        =   1
      Top             =   1080
      Width           =   2895
   End
   Begin Label TurnsLabel 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Reading would take xx turn(s). Increase speed by factor (1=none) "
      Height          =   480
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2955
   End
End
Option Explicit

Sub CalcChances ()
  PercentLabel = Trim$(Format$(Fix(100 - 100 * Probability_ksucc(1, CLng(decker.intelligence), CLng(retdata)) + .5))) & "%"
End Sub

Sub Form_Activate ()
  retdata = 1
  IncreasefactorText.Text = Format(retdata)
  Call CalcChances
End Sub

Sub IncreasefactorText_Change ()
  retdata = Val(IncreasefactorText.Text)
  If retdata < 1 Then
    retdata = 1
  End If
  IncreasefactorText.Text = Format(retdata)
  Call CalcChances
End Sub

Sub OkayButton_Click ()
  retdata = Val(IncreasefactorText.Text)
  Form17.Hide
End Sub

Sub Spin1_SpinDown ()
  retdata = Val(IncreasefactorText.Text) - 1
  If retdata < 1 Then
    retdata = 1
  End If
  IncreasefactorText.Text = Format(retdata)
  Call CalcChances
End Sub

Sub Spin1_SpinUp ()
  retdata = Val(IncreasefactorText.Text) + 1
  If retdata < 1 Then
    retdata = 1
  End If
  IncreasefactorText.Text = Format(retdata)
  Call CalcChances
End Sub

