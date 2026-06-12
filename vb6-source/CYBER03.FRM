VERSION 2.00
Begin Form Form3 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Decker Statistics"
   ClientHeight    =   2865
   ClientLeft      =   5715
   ClientTop       =   1590
   ClientWidth     =   4470
   ForeColor       =   &H00FFFFFF&
   Height          =   3270
   Icon            =   CYBER03.FRX:0000
   Left            =   5655
   LinkTopic       =   "Form7"
   ScaleHeight     =   2865
   ScaleWidth      =   4470
   Top             =   1245
   Width           =   4590
   Begin CommandButton Command1 
      Caption         =   "&Close"
      Height          =   375
      Left            =   1440
      TabIndex        =   26
      Top             =   2400
      Width           =   1575
   End
   Begin SSPanel Panel3D1 
      ForeColor       =   &H00FF0000&
      Height          =   615
      Index           =   0
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   4470
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Decker name"
         FontBold        =   -1  'True
         FontItalic      =   -1  'True
         FontName        =   "Arial"
         FontSize        =   13.5
         FontStrikethru  =   0   'False
         FontUnderline   =   0   'False
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   120
         Width           =   4335
      End
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Modifier"
      ForeColor       =   &H000000FF&
      Height          =   255
      Index           =   7
      Left            =   2400
      TabIndex        =   28
      Top             =   1080
      Width           =   975
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   11
      Left            =   3600
      TabIndex        =   27
      Top             =   2040
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   10
      Left            =   3600
      TabIndex        =   0
      Top             =   1800
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   9
      Left            =   3600
      TabIndex        =   13
      Top             =   1560
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   8
      Left            =   3600
      TabIndex        =   14
      Top             =   1320
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   7
      Left            =   3600
      TabIndex        =   15
      Top             =   1080
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0D+0"
      Height          =   195
      Index           =   6
      Left            =   3600
      TabIndex        =   16
      Top             =   840
      Width           =   735
   End
   Begin Label Label6 
      BackColor       =   &H00C0C0C0&
      Height          =   1575
      Index           =   1
      Left            =   3480
      TabIndex        =   17
      Top             =   720
      Width           =   1215
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   5
      Left            =   1320
      TabIndex        =   18
      Top             =   2040
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   4
      Left            =   1320
      TabIndex        =   19
      Top             =   1800
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   3
      Left            =   1320
      TabIndex        =   20
      Top             =   1560
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   2
      Left            =   1320
      TabIndex        =   21
      Top             =   1320
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   1
      Left            =   1320
      TabIndex        =   22
      Top             =   1080
      Width           =   735
   End
   Begin Label Label3 
      Alignment       =   2  'Center
      BackColor       =   &H00808080&
      Caption         =   "0"
      Height          =   195
      Index           =   0
      Left            =   1320
      TabIndex        =   24
      Top             =   840
      Width           =   735
   End
   Begin Label Label6 
      BackColor       =   &H00C0C0C0&
      Height          =   1575
      Index           =   0
      Left            =   1200
      TabIndex        =   25
      Top             =   720
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Hacking-Pool"
      ForeColor       =   &H00C0C000&
      Height          =   195
      Index           =   11
      Left            =   2220
      TabIndex        =   23
      Top             =   2040
      Width           =   1155
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Team-Pool"
      ForeColor       =   &H00C0C000&
      Height          =   255
      Index           =   10
      Left            =   2400
      TabIndex        =   12
      Top             =   1800
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      BackColor       =   &H00000000&
      Caption         =   "Karma-Pool"
      ForeColor       =   &H00C0C000&
      Height          =   195
      Index           =   9
      Left            =   2400
      TabIndex        =   11
      Top             =   1560
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Skill"
      ForeColor       =   &H000000FF&
      Height          =   255
      Index           =   8
      Left            =   2400
      TabIndex        =   10
      Top             =   1320
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Initiative"
      ForeColor       =   &H000000FF&
      Height          =   255
      Index           =   6
      Left            =   2400
      TabIndex        =   9
      Top             =   840
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Willpower"
      ForeColor       =   &H0000C000&
      Height          =   195
      Index           =   5
      Left            =   195
      TabIndex        =   8
      Top             =   2040
      Width           =   900
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Intelligence"
      ForeColor       =   &H0000C000&
      Height          =   195
      Index           =   4
      Left            =   90
      TabIndex        =   7
      Top             =   1800
      Width           =   1005
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Charisma"
      ForeColor       =   &H0000C000&
      Height          =   255
      Index           =   3
      Left            =   120
      TabIndex        =   6
      Top             =   1560
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Strength"
      ForeColor       =   &H0000C000&
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   5
      Top             =   1320
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Quickness"
      ForeColor       =   &H0000C000&
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   4
      Top             =   1080
      Width           =   975
   End
   Begin Label Label2 
      Alignment       =   1  'Right Justify
      BackColor       =   &H00000000&
      Caption         =   "Body"
      ForeColor       =   &H0000C000&
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   3
      Top             =   840
      Width           =   975
   End
End
Option Explicit

Sub Command1_Click ()
  Form3.Hide
End Sub

