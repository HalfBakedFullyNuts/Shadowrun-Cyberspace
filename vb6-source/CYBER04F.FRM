VERSION 2.00
Begin Form Form4 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About Cyberspace"
   ClientHeight    =   7155
   ClientLeft      =   6090
   ClientTop       =   1110
   ClientWidth     =   4800
   Height          =   7560
   Icon            =   CYBER04F.FRX:0000
   Left            =   6030
   LinkTopic       =   "Form4"
   ScaleHeight     =   7155
   ScaleWidth      =   4800
   Top             =   765
   Width           =   4920
   Begin CommandButton Command1 
      Caption         =   "Order supported CDROM"
      Height          =   705
      Left            =   2400
      TabIndex        =   2
      Top             =   3375
      Width           =   2340
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Mobile, SMS: ++49 170 8575192"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   8
      Left            =   360
      TabIndex        =   12
      Top             =   4560
      Width           =   4575
   End
   Begin Label Label3 
      BackColor       =   &H00000000&
      Caption         =   "Cannot load image."
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   13.5
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   1065
      TabIndex        =   11
      Top             =   1200
      Width           =   2775
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "FREEWARE"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   24
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      ForeColor       =   &H00C0C0C0&
      Height          =   555
      Index           =   7
      Left            =   120
      TabIndex        =   3
      Top             =   5040
      Width           =   4575
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "This Software is"
      ForeColor       =   &H00C0C0C0&
      Height          =   255
      Index           =   6
      Left            =   120
      TabIndex        =   5
      Top             =   4800
      Width           =   4455
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Tel.: 06151-933273 or internat. ++49 6151 933273"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   360
      TabIndex        =   10
      Top             =   4320
      Width           =   4575
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Copyright 1995, 1996, 1997, 1998, 1999, 2000 by"
      ForeColor       =   &H00C0C0C0&
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   9
      Top             =   3120
      Width           =   4455
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Germany"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   360
      TabIndex        =   8
      Top             =   4080
      Width           =   3135
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "64291 Darmstadt"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   360
      TabIndex        =   7
      Top             =   3840
      Width           =   3135
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Greinstr. 16"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   360
      TabIndex        =   6
      Top             =   3600
      Width           =   3135
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Stefan Markgraf"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   360
      TabIndex        =   4
      Top             =   3360
      Width           =   3135
   End
   Begin Image Image1 
      Height          =   15
      Left            =   0
      Top             =   120
      Width           =   15
   End
   Begin Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Shadowrun and Matrix are  registered trademarks of FASA Corporation. The Shadowrun rulebook is necessary to understand the concepts of this program."
      ForeColor       =   &H00808080&
      Height          =   855
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   6300
      Width           =   4215
   End
   Begin Label Label2 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Version 2.8a - Jan., 2000 for Shadowrun 2.01          Programmed by icetoaster@gmx.de         Homepage: www.geocities.com/TimesSquare/5245/"
      ForeColor       =   &H00808080&
      Height          =   675
      Index           =   0
      Left            =   135
      TabIndex        =   0
      Top             =   5640
      Width           =   4455
   End
End

Sub Command1_Click ()

  Form13.Show

End Sub

Sub Form_Load ()
  On Error Resume Next
  inifile$ = GetPathes()
  If Len(imagepath$) > 0 Then
    image1.Picture = LoadPicture(imagepath$ & "logo.bmp")
    label3.Caption = ""
    label3.Visible = False
  Else
    label3.Visible = True
  End If

End Sub

