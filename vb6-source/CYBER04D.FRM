VERSION 2.00
Begin Form Form4 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About Cyberspace"
   ClientHeight    =   7365
   ClientLeft      =   5685
   ClientTop       =   1695
   ClientWidth     =   4800
   Height          =   7770
   Icon            =   CYBER04D.FRX:0000
   Left            =   5625
   LinkTopic       =   "Form4"
   ScaleHeight     =   7365
   ScaleWidth      =   4800
   Top             =   1350
   Width           =   4920
   Begin CommandButton Command1 
      Caption         =   "Order the full version"
      Height          =   705
      Left            =   2400
      TabIndex        =   2
      Top             =   3375
      Width           =   2100
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "DEMO Version. Some features are disabled here (no LTG loading, poor man's sound, no uplinks,...)"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Index           =   7
      Left            =   120
      TabIndex        =   11
      Top             =   4560
      Width           =   4455
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "This program is part of  the Cyberspace package consisting of the Cyberspace/Matrixrun, Decker's Biomonitor, Cyberdeck Designer and the Matrix Construction Set.                                        Contact above person or search on the Internet for ftp.uni-erlangen.de:/pub/games/roleplay/shadowrun"
      ForeColor       =   &H00C0C0C0&
      Height          =   1215
      Index           =   8
      Left            =   120
      TabIndex        =   3
      Top             =   5040
      Width           =   4455
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
      Left            =   1080
      TabIndex        =   5
      Top             =   1200
      Width           =   2775
   End
   Begin Image Image1 
      Height          =   2895
      Left            =   0
      Top             =   120
      Width           =   4815
   End
   Begin Label Label1 
      BackColor       =   &H00000000&
      Caption         =   "Tel.: 0531-72671 or international ++49 531 72671"
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
      Caption         =   "Copyright 1995, 1996, 1997, 1998 by"
      ForeColor       =   &H00C0C0C0&
      Height          =   255
      Index           =   4
      Left            =   120
      TabIndex        =   9
      Top             =   3120
      Width           =   3375
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
      Caption         =   "D-38104 Braunschweig"
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
      Caption         =   "Griepenkerlstr. 10"
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
   Begin Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Shadowrun (TM) is a registered trademark of FASA Corporation. The Shadowrun rulebook is necessary to understand the concepts of this program."
      ForeColor       =   &H00808080&
      Height          =   855
      Index           =   1
      Left            =   120
      TabIndex        =   1
      Top             =   6600
      Width           =   4215
   End
   Begin Label Label2 
      BackColor       =   &H00000000&
      BackStyle       =   0  'Transparent
      Caption         =   "Version 2.7 - Feb., 1998 for Shadowrun 2.01"
      ForeColor       =   &H00808080&
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   6360
      Width           =   4455
   End
End

Sub Command1_Click ()

  form13.Show

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

