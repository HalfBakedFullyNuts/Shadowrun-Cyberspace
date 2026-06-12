VERSION 2.00
Begin Form Form16 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Changing Persona Ratings"
   ClientHeight    =   3120
   ClientLeft      =   2925
   ClientTop       =   1155
   ClientWidth     =   5190
   Height          =   3525
   Icon            =   CYBER16.FRX:0000
   Left            =   2865
   LinkTopic       =   "Form16"
   ScaleHeight     =   3120
   ScaleWidth      =   5190
   Top             =   810
   Width           =   5310
   Begin CommandButton Command1 
      Caption         =   "&Okay"
      Height          =   375
      Left            =   3240
      TabIndex        =   10
      Top             =   2400
      Width           =   1575
   End
   Begin SpinButton Spin1 
      Height          =   255
      Index           =   3
      Left            =   4560
      Top             =   2040
      Width           =   255
   End
   Begin SpinButton Spin1 
      Height          =   255
      Index           =   2
      Left            =   3360
      Top             =   2040
      Width           =   255
   End
   Begin SpinButton Spin1 
      Height          =   255
      Index           =   0
      Left            =   960
      Top             =   2040
      Width           =   255
   End
   Begin SpinButton Spin1 
      Height          =   255
      Index           =   1
      Left            =   2160
      Top             =   2040
      Width           =   255
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   735
      Index           =   0
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5190
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Change the ratings of the Persona programs (due to Reality Filter?):"
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
         Width           =   4815
      End
   End
   Begin Label MaxSum 
      BackColor       =   &H00C0C0C0&
      Caption         =   "100"
      Height          =   255
      Left            =   2160
      TabIndex        =   14
      Top             =   2640
      Width           =   375
   End
   Begin Label RateSum 
      Caption         =   "100"
      Height          =   255
      Left            =   2160
      TabIndex        =   13
      Top             =   2400
      Width           =   375
   End
   Begin Label Label5 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0C0C0&
      Caption         =   "Maximum (3*MPCP)="
      Height          =   255
      Left            =   120
      TabIndex        =   12
      Top             =   2640
      Width           =   1815
   End
   Begin Label Label4 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sum of Ratings ="
      Height          =   255
      Left            =   360
      TabIndex        =   11
      Top             =   2400
      Width           =   1575
   End
   Begin Label Label3 
      Caption         =   "61/10"
      Height          =   255
      Index           =   3
      Left            =   3960
      TabIndex        =   9
      Top             =   2040
      Width           =   615
   End
   Begin Label Label3 
      Caption         =   "61/10"
      Height          =   255
      Index           =   2
      Left            =   2760
      TabIndex        =   8
      Top             =   2040
      Width           =   615
   End
   Begin Label Label3 
      Caption         =   "61/10"
      Height          =   255
      Index           =   1
      Left            =   1560
      TabIndex        =   7
      Top             =   2040
      Width           =   615
   End
   Begin Label Label3 
      Caption         =   "61/10"
      Height          =   255
      Index           =   0
      Left            =   360
      TabIndex        =   6
      Top             =   2040
      Width           =   615
   End
   Begin Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor"
      Height          =   255
      Index           =   3
      Left            =   3960
      TabIndex        =   5
      Top             =   840
      Width           =   855
   End
   Begin Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Masking"
      Height          =   255
      Index           =   2
      Left            =   2760
      TabIndex        =   4
      Top             =   840
      Width           =   855
   End
   Begin Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Evasion"
      Height          =   255
      Index           =   1
      Left            =   1560
      TabIndex        =   3
      Top             =   840
      Width           =   855
   End
   Begin Label Label2 
      Alignment       =   2  'Center
      BackColor       =   &H00C0C0C0&
      Caption         =   "Body"
      Height          =   255
      Index           =   0
      Left            =   360
      TabIndex        =   2
      Top             =   840
      Width           =   855
   End
   Begin Image Image4 
      Height          =   690
      Left            =   3960
      Picture         =   CYBER16.FRX:0302
      Top             =   1200
      Width           =   840
   End
   Begin Image Image3 
      Height          =   690
      Left            =   2760
      Picture         =   CYBER16.FRX:114C
      Top             =   1200
      Width           =   840
   End
   Begin Image Image2 
      Height          =   690
      Left            =   1560
      Picture         =   CYBER16.FRX:1F0C
      Top             =   1200
      Width           =   840
   End
   Begin Image Image1 
      Height          =   690
      Left            =   360
      Picture         =   CYBER16.FRX:2D56
      Top             =   1200
      Width           =   840
   End
End
Option Explicit

Dim persrate(4) As Integer
Dim origpers(4) As Integer

Sub Command1_Click ()
  Rem Okay Button
  Rem Copy changes back to the variables

  deck.chg(0) = deck.chg(0) + persrate(0) - deck.bod + deck.add(0)
  deck.chg(1) = deck.chg(1) + persrate(1) - deck.evasion + deck.add(1)
  deck.chg(2) = deck.chg(2) + persrate(2) - deck.masking + deck.add(2)
  deck.chg(3) = deck.chg(3) + persrate(3) - deck.sensor + deck.add(3)

  deck.bod = persrate(0) + deck.add(0)
  deck.evasion = persrate(1) + deck.add(1)
  deck.masking = persrate(2) + deck.add(2)
  deck.sensor = persrate(3) + deck.add(3)
  If deck.chg(0) + deck.chg(1) + deck.chg(2) + deck.chg(3) <> 0 Then dirtyflag = True
  'Debug.Print deck.oripp(0), deck.add(0), deck.chg(0), deck.dam(0), deck.bod
  Form16.Hide
End Sub

Sub Form_Activate ()
  persrate(0) = deck.bod - deck.add(0)
  persrate(1) = deck.evasion - deck.add(1)
  persrate(2) = deck.masking - deck.add(2)
  persrate(3) = deck.sensor - deck.add(3)
  origpers(0) = deck.oripp(0)
  origpers(1) = deck.oripp(1)
  origpers(2) = deck.oripp(2)
  origpers(3) = deck.oripp(3)
  Call UpdateSums
End Sub

Sub Spin1_SpinDown (index As Integer)

  persrate(index) = persrate(index) - 1
  If persrate(index) < 0 Then persrate(index) = 0
  If persrate(index) > origpers(index) Then persrate(index) = origpers(index)
  Call UpdateSums

End Sub

Sub Spin1_SpinUp (index As Integer)

  persrate(index) = persrate(index) + 1
  If persrate(index) < 0 Then persrate(index) = 0
  If persrate(index) > origpers(index) Then persrate(index) = origpers(index)
  Call UpdateSums

End Sub

Sub UpdateSums ()
  Dim sum%
  Dim i%

  sum = 0
  For i = 0 To 3
    label3(i).Caption = Trim$(Str$(persrate(i))) + "/" + Trim$(Str$(origpers(i)))
    sum = sum + persrate(i)
  Next i
  RateSum.Caption = Trim$(Str$(sum))
  MaxSum.Caption = Trim$(Str$(3 * (deck.mpcp)))

End Sub

