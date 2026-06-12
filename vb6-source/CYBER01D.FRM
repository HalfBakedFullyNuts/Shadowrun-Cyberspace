VERSION 2.00
Begin Form Form1 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Cyberspace"
   ClientHeight    =   6585
   ClientLeft      =   3330
   ClientTop       =   2055
   ClientWidth     =   10080
   DrawWidth       =   2
   ForeColor       =   &H00000000&
   Height          =   7275
   Icon            =   CYBER01D.FRX:0000
   Left            =   3270
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6585
   ScaleWidth      =   10080
   Top             =   1425
   Width           =   10200
   Begin Timer Timer2 
      Enabled         =   0   'False
      Left            =   3000
      Top             =   3840
   End
   Begin CommonDialog CMDialog4 
      Left            =   2040
      Top             =   3720
   End
   Begin CommandButton RealTimeButton 
      Caption         =   "&Real Time"
      Height          =   375
      Left            =   3360
      TabIndex        =   104
      Top             =   3720
      Width           =   1575
   End
   Begin Timer Timer1 
      Left            =   2520
      Top             =   3720
   End
   Begin CommandButton AutoMap 
      Caption         =   "Auto &Map"
      Height          =   375
      Left            =   1680
      TabIndex        =   100
      Top             =   3360
      Width           =   1695
   End
   Begin SSCommand DeleteButton 
      Caption         =   "&Delete"
      Height          =   495
      Left            =   4680
      TabIndex        =   95
      Top             =   6000
      Width           =   1215
   End
   Begin Frame Frame3 
      BackColor       =   &H00C0C0C0&
      Height          =   2295
      Left            =   8280
      TabIndex        =   83
      Top             =   4200
      Width           =   1695
      Begin CommandButton RealityFilterButton 
         Caption         =   "RF"
         Height          =   270
         Left            =   1200
         TabIndex        =   103
         Top             =   345
         Width           =   315
      End
      Begin SSCommand Adjust3D1 
         Height          =   975
         Left            =   1215
         Picture         =   CYBER01D.FRX:0302
         RoundedCorners  =   0   'False
         TabIndex        =   102
         Top             =   705
         Width           =   300
      End
      Begin SSPanel Satellite_uplink 
         BackColor       =   &H0000FF00&
         BevelInner      =   2  'Raised
         BorderWidth     =   1
         Caption         =   "Satellite Uplink"
         ForeColor       =   &H00000000&
         Height          =   390
         Left            =   0
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         ShadowColor     =   1  'Black
         TabIndex        =   40
         Top             =   1800
         Width           =   1695
      End
      Begin Label DeckAttrib 
         Alignment       =   2  'Center
         BackColor       =   &H00808080&
         Caption         =   "00"
         Height          =   255
         Index           =   4
         Left            =   960
         TabIndex        =   82
         Top             =   1440
         Width           =   255
      End
      Begin Label DeckAttrib 
         Alignment       =   2  'Center
         BackColor       =   &H00808080&
         Caption         =   "00"
         Height          =   255
         Index           =   3
         Left            =   960
         TabIndex        =   84
         Top             =   1200
         Width           =   255
      End
      Begin Label DeckAttrib 
         Alignment       =   2  'Center
         BackColor       =   &H00808080&
         Caption         =   "00"
         Height          =   255
         Index           =   2
         Left            =   960
         TabIndex        =   92
         Top             =   960
         Width           =   255
      End
      Begin Label DeckAttrib 
         Alignment       =   2  'Center
         BackColor       =   &H00808080&
         Caption         =   "00"
         Height          =   255
         Index           =   1
         Left            =   960
         TabIndex        =   93
         Top             =   720
         Width           =   255
      End
      Begin Label DeckAttrib 
         Alignment       =   2  'Center
         BackColor       =   &H00808080&
         Caption         =   "00"
         Height          =   255
         Index           =   0
         Left            =   960
         TabIndex        =   94
         Top             =   360
         Width           =   255
      End
      Begin Label Label8 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0C0C0&
         Caption         =   "Sensor"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   91
         Top             =   1440
         Width           =   735
      End
      Begin Label Label8 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0C0C0&
         Caption         =   "Masking"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   90
         Top             =   1200
         Width           =   735
      End
      Begin Label Label8 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0C0C0&
         Caption         =   "Evasion"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   89
         Top             =   960
         Width           =   735
      End
      Begin Label Label8 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0C0C0&
         Caption         =   "Bod"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   88
         Top             =   720
         Width           =   735
      End
      Begin Label Label8 
         Alignment       =   1  'Right Justify
         BackColor       =   &H00C0C0C0&
         Caption         =   "MPCP"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   87
         Top             =   360
         Width           =   735
      End
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00004000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Deck Attributes"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   10
         Left            =   0
         TabIndex        =   85
         Top             =   0
         Width           =   1695
      End
   End
   Begin Frame Frame2 
      BackColor       =   &H00C0C0C0&
      Height          =   1575
      Left            =   6960
      TabIndex        =   46
      Top             =   2520
      Width           =   3015
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   29
         Left            =   2640
         TabIndex        =   80
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   28
         Left            =   2400
         TabIndex        =   79
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   27
         Left            =   2160
         TabIndex        =   78
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   26
         Left            =   1920
         TabIndex        =   77
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   25
         Left            =   1680
         TabIndex        =   76
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   24
         Left            =   1440
         TabIndex        =   75
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   23
         Left            =   1200
         TabIndex        =   74
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   22
         Left            =   960
         TabIndex        =   73
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   21
         Left            =   720
         TabIndex        =   72
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   20
         Left            =   480
         TabIndex        =   71
         Top             =   1200
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   19
         Left            =   2640
         TabIndex        =   70
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   18
         Left            =   2400
         TabIndex        =   69
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   17
         Left            =   2160
         TabIndex        =   68
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   16
         Left            =   1920
         TabIndex        =   67
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   15
         Left            =   1680
         TabIndex        =   66
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   14
         Left            =   1440
         TabIndex        =   65
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   13
         Left            =   1200
         TabIndex        =   64
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   12
         Left            =   960
         TabIndex        =   63
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   11
         Left            =   720
         TabIndex        =   62
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   10
         Left            =   480
         TabIndex        =   61
         Top             =   960
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   9
         Left            =   2640
         TabIndex        =   60
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   8
         Left            =   2400
         TabIndex        =   59
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   7
         Left            =   2160
         TabIndex        =   58
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "CheckStatus"
         Height          =   195
         Index           =   6
         Left            =   1920
         TabIndex        =   57
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   5
         Left            =   1680
         TabIndex        =   56
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   4
         Left            =   1440
         TabIndex        =   55
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   3
         Left            =   1200
         TabIndex        =   54
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   2
         Left            =   960
         TabIndex        =   53
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   1
         Left            =   720
         TabIndex        =   52
         Top             =   600
         Width           =   255
      End
      Begin SSCheck CheckStatus 
         Caption         =   "Check3D2"
         Height          =   195
         Index           =   0
         Left            =   480
         TabIndex        =   51
         Top             =   600
         Width           =   255
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "D"
         Height          =   195
         Index           =   6
         Left            =   2640
         TabIndex        =   21
         Top             =   360
         Width           =   150
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "S"
         Height          =   195
         Index           =   5
         Left            =   1680
         TabIndex        =   24
         Top             =   360
         Width           =   135
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "M"
         Height          =   195
         Index           =   4
         Left            =   960
         TabIndex        =   45
         Top             =   360
         Width           =   165
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "L"
         Height          =   195
         Index           =   3
         Left            =   480
         TabIndex        =   81
         Top             =   360
         Width           =   120
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Phys"
         Height          =   195
         Index           =   2
         Left            =   45
         TabIndex        =   50
         Top             =   1200
         Width           =   420
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Stun"
         Height          =   195
         Index           =   1
         Left            =   45
         TabIndex        =   49
         Top             =   960
         Width           =   405
      End
      Begin Label Label7 
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Deck"
         Height          =   195
         Index           =   0
         Left            =   30
         TabIndex        =   48
         Top             =   600
         Width           =   465
      End
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00004000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Condition Monitor"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   7
         Left            =   0
         TabIndex        =   47
         Top             =   0
         Width           =   3015
      End
   End
   Begin SSPanel Data_exists 
      BackColor       =   &H00FF0000&
      BevelInner      =   2  'Raised
      BorderWidth     =   1
      Caption         =   "Data exist"
      ForeColor       =   &H00FFFFFF&
      Height          =   375
      Left            =   3360
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      ShadowColor     =   1  'Black
      TabIndex        =   44
      Top             =   3360
      Width           =   1575
   End
   Begin SSPanel Persona_present 
      BackColor       =   &H00808080&
      BevelInner      =   2  'Raised
      BorderWidth     =   1
      Caption         =   "Persona detected"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   120
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      ShadowColor     =   1  'Black
      TabIndex        =   43
      Top             =   3720
      Visible         =   0   'False
      Width           =   1695
   End
   Begin SSPanel ICE_present 
      BackColor       =   &H00FFFF00&
      BevelInner      =   2  'Raised
      BorderWidth     =   1
      Caption         =   "no ICE in node"
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   120
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      ShadowColor     =   1  'Black
      TabIndex        =   42
      Top             =   3360
      Width           =   1575
   End
   Begin Frame Frame1 
      BackColor       =   &H00808080&
      Height          =   3255
      Left            =   120
      TabIndex        =   41
      Top             =   120
      Width           =   4815
      Begin PictureBox image1 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00808080&
         Height          =   3015
         Left            =   0
         ScaleHeight     =   2985
         ScaleWidth      =   4785
         TabIndex        =   97
         Top             =   240
         Width           =   4815
         Begin Image pictSource 
            Height          =   375
            Left            =   3720
            Top             =   0
            Visible         =   0   'False
            Width           =   255
         End
         Begin Label RangeLabel 
            Alignment       =   1  'Right Justify
            BackColor       =   &H00C0C0C0&
            BackStyle       =   0  'Transparent
            ForeColor       =   &H0000FFFF&
            Height          =   255
            Left            =   3480
            TabIndex        =   0
            Top             =   2640
            Width           =   1215
         End
      End
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00004000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Vidscreen Display/Range"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   13
         Top             =   0
         Width           =   4845
      End
   End
   Begin CommandButton JackOut 
      Caption         =   "&Jack out"
      Height          =   615
      Left            =   720
      TabIndex        =   38
      Top             =   5040
      Width           =   975
   End
   Begin SSCommand UnloadProg 
      Caption         =   "          &U"
      Height          =   495
      Left            =   4680
      Picture         =   CYBER01D.FRX:05F8
      TabIndex        =   4
      Top             =   5520
      Width           =   1215
   End
   Begin SSCommand LoadProg 
      Caption         =   "&L          "
      Height          =   495
      Left            =   4680
      Picture         =   CYBER01D.FRX:08FA
      TabIndex        =   37
      Top             =   5040
      Width           =   1215
   End
   Begin CommonDialog CMDialog1 
      CancelError     =   -1  'True
      DefaultExt      =   "dek"
      Filter          =   "Cyberdecks (*.dek)|*.dek|All files (*.*)|*.*"
      Left            =   600
      Top             =   3720
   End
   Begin CommonDialog CMDialog2 
      CancelError     =   -1  'True
      DefaultExt      =   "npc"
      Filter          =   "Player Statistics (*.npc)|*.npc|All files (*.*)|*.*"
      Left            =   1080
      Top             =   3720
   End
   Begin CommonDialog CMDialog3 
      CancelError     =   -1  'True
      DefaultExt      =   "ltg"
      Filter          =   "Matrix (*.ltg)|*.ltg|All files (*.*)|*.*"
      Left            =   1560
      Top             =   3720
   End
   Begin SSPanel Panel3D10 
      BorderWidth     =   1
      Caption         =   "Panel3D10"
      FloodType       =   1  'Left To Right
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   2400
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      TabIndex        =   34
      Top             =   6000
      Width           =   2295
      Begin SSPanel Active 
         BevelInner      =   1  'Inset
         BevelOuter      =   1  'Inset
         BorderWidth     =   1
         Caption         =   "Panel3D1"
         FloodType       =   1  'Left To Right
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   60
         RoundedCorners  =   0   'False
         TabIndex        =   35
         Top             =   60
         Width           =   1275
      End
      Begin Label Active_label 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Height          =   255
         Left            =   1440
         TabIndex        =   36
         Top             =   120
         Width           =   615
      End
   End
   Begin SSPanel Panel3D11 
      BorderWidth     =   1
      Caption         =   "Panel3D11"
      FloodType       =   1  'Left To Right
      ForeColor       =   &H00000000&
      Height          =   495
      Left            =   5880
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      TabIndex        =   31
      Top             =   6000
      Width           =   2295
      Begin SSPanel Storage 
         BevelInner      =   1  'Inset
         BevelOuter      =   1  'Inset
         BorderWidth     =   1
         Caption         =   "Panel3D6"
         FloodType       =   1  'Left To Right
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   60
         RoundedCorners  =   0   'False
         TabIndex        =   32
         Top             =   60
         Width           =   1275
      End
      Begin Label Storage_label 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Height          =   255
         Left            =   1440
         TabIndex        =   33
         Top             =   120
         Width           =   735
      End
   End
   Begin CommandButton Execute 
      BackColor       =   &H00C0C0C0&
      Caption         =   "E&xecute"
      Default         =   -1  'True
      Height          =   615
      Left            =   4680
      TabIndex        =   1
      Top             =   4440
      Width           =   1215
   End
   Begin ListBox List1 
      BackColor       =   &H00808080&
      Height          =   1590
      Left            =   2400
      TabIndex        =   30
      Top             =   4440
      Width           =   2295
   End
   Begin ListBox List2 
      BackColor       =   &H00808080&
      Height          =   1590
      Left            =   5880
      TabIndex        =   29
      Top             =   4440
      Width           =   2295
   End
   Begin SSPanel Panel3D12 
      BackColor       =   &H00000000&
      BevelOuter      =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   2055
      Left            =   6960
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      TabIndex        =   27
      Top             =   360
      Width           =   3015
      Begin CommandButton Clear 
         BackColor       =   &H00000000&
         Caption         =   "&Clear"
         Height          =   375
         Left            =   2160
         TabIndex        =   22
         Top             =   1680
         Width           =   735
      End
      Begin Label pad 
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H0000FFFF&
         Height          =   2055
         Left            =   0
         TabIndex        =   28
         Top             =   0
         Width           =   3015
         WordWrap        =   -1  'True
      End
   End
   Begin SSPanel Panel3D6 
      BevelOuter      =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   2055
      Left            =   5040
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      TabIndex        =   15
      Top             =   360
      Width           =   1815
      Begin SSCommand SysOps 
         BevelWidth      =   1
         Caption         =   "5 SysOps"
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   4
         Left            =   0
         RoundedCorners  =   0   'False
         TabIndex        =   39
         Top             =   1560
         Visible         =   0   'False
         Width           =   1815
      End
      Begin SSCommand SysOps 
         BevelWidth      =   1
         Caption         =   "4 SysOps"
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   3
         Left            =   0
         RoundedCorners  =   0   'False
         TabIndex        =   19
         Top             =   1200
         Visible         =   0   'False
         Width           =   1815
      End
      Begin SSCommand SysOps 
         BevelWidth      =   1
         Caption         =   "3 SysOps"
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   2
         Left            =   0
         RoundedCorners  =   0   'False
         TabIndex        =   18
         Top             =   840
         Visible         =   0   'False
         Width           =   1815
      End
      Begin SSCommand SysOps 
         BevelWidth      =   1
         Caption         =   "2 SysOps"
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   1
         Left            =   0
         RoundedCorners  =   0   'False
         TabIndex        =   17
         Top             =   480
         Visible         =   0   'False
         Width           =   1815
      End
      Begin SSCommand SysOps 
         BevelWidth      =   1
         Caption         =   "1 SysOps"
         ForeColor       =   &H00000000&
         Height          =   375
         Index           =   0
         Left            =   0
         RoundedCorners  =   0   'False
         TabIndex        =   16
         Top             =   120
         Visible         =   0   'False
         Width           =   1815
      End
   End
   Begin SSPanel Panel3D2 
      BevelOuter      =   0  'None
      BorderWidth     =   1
      ForeColor       =   &H00000000&
      Height          =   1335
      Left            =   5040
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      TabIndex        =   7
      Top             =   2760
      Width           =   1815
      Begin SSPanel Shutdown_warning 
         BackColor       =   &H0000FFFF&
         BevelInner      =   2  'Raised
         BorderWidth     =   1
         Caption         =   "Shutdown Warning"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   0
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         ShadowColor     =   1  'Black
         TabIndex        =   86
         Top             =   840
         Width           =   1815
      End
      Begin SSPanel Active_Alert 
         BackColor       =   &H000000FF&
         BevelInner      =   2  'Raised
         BorderWidth     =   1
         Caption         =   "Active Alert"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   0
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         ShadowColor     =   1  'Black
         TabIndex        =   9
         Top             =   120
         Width           =   1815
      End
      Begin SSPanel Passive_Alert 
         BackColor       =   &H000080FF&
         BevelInner      =   2  'Raised
         BorderWidth     =   1
         Caption         =   "Passive Alert"
         ForeColor       =   &H00000000&
         Height          =   375
         Left            =   0
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         ShadowColor     =   1  'Black
         TabIndex        =   8
         Top             =   480
         Width           =   1815
      End
   End
   Begin SSPanel Panel3D5 
      BevelOuter      =   0  'None
      ForeColor       =   &H00FFFFFF&
      Height          =   2295
      Left            =   120
      Outline         =   -1  'True
      RoundedCorners  =   0   'False
      TabIndex        =   6
      Top             =   4200
      Width           =   2175
      Begin SSCommand Wait3D1 
         Caption         =   "&Wait"
         Height          =   855
         Left            =   0
         RoundedCorners  =   0   'False
         TabIndex        =   101
         Top             =   1440
         Width           =   615
      End
      Begin SSPanel Exits3D1 
         BevelInner      =   1  'Inset
         BevelOuter      =   1  'Inset
         BevelWidth      =   2
         BorderWidth     =   2
         Caption         =   "Last"
         ForeColor       =   &H00000000&
         Height          =   855
         Index           =   2
         Left            =   1560
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         TabIndex        =   99
         Top             =   1440
         Width           =   615
      End
      Begin SSPanel Exits3D1 
         BevelInner      =   1  'Inset
         BevelOuter      =   1  'Inset
         BevelWidth      =   2
         BorderWidth     =   2
         Caption         =   "of"
         ForeColor       =   &H00000000&
         Height          =   855
         Index           =   1
         Left            =   1560
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         TabIndex        =   98
         Top             =   0
         Width           =   615
      End
      Begin SSPanel Exits3D1 
         BevelInner      =   1  'Inset
         BevelOuter      =   1  'Inset
         BevelWidth      =   2
         BorderWidth     =   2
         Caption         =   "Exit"
         ForeColor       =   &H00000000&
         Height          =   855
         Index           =   0
         Left            =   0
         Outline         =   -1  'True
         RoundedCorners  =   0   'False
         TabIndex        =   96
         Top             =   0
         Width           =   615
      End
      Begin SSCommand DecreaseLink 
         Height          =   615
         Left            =   0
         Picture         =   CYBER01D.FRX:0BFC
         RoundedCorners  =   0   'False
         TabIndex        =   23
         Top             =   840
         Width           =   615
      End
      Begin SSCommand IncreaseLink 
         Height          =   615
         Left            =   1560
         Picture         =   CYBER01D.FRX:0EFE
         RoundedCorners  =   0   'False
         TabIndex        =   12
         Top             =   840
         Width           =   615
      End
      Begin SSCommand Backward 
         Caption         =   "&Backward"
         Height          =   855
         Left            =   600
         Picture         =   CYBER01D.FRX:1200
         RoundedCorners  =   0   'False
         TabIndex        =   11
         Top             =   1440
         Width           =   975
      End
      Begin SSCommand Forward 
         Caption         =   "&Forward"
         Height          =   855
         Left            =   600
         Picture         =   CYBER01D.FRX:1502
         RoundedCorners  =   0   'False
         TabIndex        =   10
         Top             =   0
         Width           =   975
      End
   End
   Begin Label timelabel 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Login Time: 00:00"
      Height          =   225
      Left            =   1785
      TabIndex        =   105
      Top             =   3735
      Width           =   1590
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Perform"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   9
      Left            =   4680
      TabIndex        =   5
      Top             =   4200
      Width           =   1215
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Storage Memory"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   5880
      TabIndex        =   25
      Top             =   4200
      Width           =   2295
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Active Memory"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   2400
      TabIndex        =   26
      Top             =   4200
      Width           =   2295
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "System Operations"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   6
      Left            =   5040
      TabIndex        =   20
      Top             =   120
      Width           =   1815
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "History Logfile"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   6960
      TabIndex        =   14
      Top             =   120
      Width           =   3015
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "System Warnings"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   5040
      TabIndex        =   2
      Top             =   2520
      Width           =   1815
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackColor       =   &H00004000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Net Navigator"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   3
      Top             =   3960
      Width           =   2175
   End
   Begin Menu m_file 
      Caption         =   "&File"
      Begin Menu m_loaddeck 
         Caption         =   "Start &Cyberdeck..."
      End
      Begin Menu m_loaddecker 
         Caption         =   "Plug in &Decker..."
      End
      Begin Menu m_loadmatrix 
         Caption         =   "Choose &LTG..."
      End
      Begin Menu m_demoltg1 
         Caption         =   "Go to Demo LTG&1"
      End
      Begin Menu m_demoltg2 
         Caption         =   "Go to Demo LTG&2"
      End
      Begin Menu m_demoltg3 
         Caption         =   "Go to Demo LTG&3"
      End
      Begin Menu m_sep0 
         Caption         =   "-"
      End
      Begin Menu m_savedeck 
         Caption         =   "Save C&yberdeck Status..."
      End
      Begin Menu m_savedecker 
         Caption         =   "Save D&ecker Status..."
      End
      Begin Menu m_saveltg 
         Caption         =   "Save L&TG-Status..."
      End
      Begin Menu m_sep1 
         Caption         =   "-"
      End
      Begin Menu m_exit 
         Caption         =   "&Exit"
      End
   End
   Begin Menu m_deck 
      Caption         =   "&Analyze"
      Begin Menu m_deckstat 
         Caption         =   "&Cyberdeck..."
      End
      Begin Menu m_deckerstat 
         Caption         =   "&Decker..."
      End
      Begin Menu m_matrixstat 
         Caption         =   "&Matrix..."
      End
   End
   Begin Menu m_icedisplay 
      Caption         =   "&ICE Display"
      Begin Menu m_icedisp 
         Caption         =   "&Standard"
         Checked         =   -1  'True
         Index           =   0
      End
      Begin Menu m_icedisp 
         Caption         =   "&Advanced"
         Index           =   1
      End
      Begin Menu m_icedisp 
         Caption         =   "Sculpted &Reality"
         Index           =   2
      End
      Begin Menu m_sep2 
         Caption         =   "-"
      End
      Begin Menu m_privreal 
         Caption         =   "&Private Reality"
      End
   End
   Begin Menu m_sound 
      Caption         =   "&Sound"
      Begin Menu m_soundtoggle 
         Caption         =   "Sound o&ff"
         Checked         =   -1  'True
         Index           =   0
      End
      Begin Menu m_soundtoggle 
         Caption         =   "Sound o&n"
         Index           =   1
      End
   End
   Begin Menu m_misc 
      Caption         =   "&Miscellaneous"
      Begin Menu m_realityfilter 
         Caption         =   "&Activate Reality Filter"
      End
      Begin Menu m_chgpersona 
         Caption         =   "&Change Persona Ratings..."
      End
      Begin Menu m_icetime 
         Caption         =   "&ICE Clock..."
      End
      Begin Menu m_icebehavior 
         Caption         =   "ICE Deception &Behavior..."
         Enabled         =   0   'False
         Begin Menu m_icedecbeh 
            Caption         =   "&Only deceive one appropriate ICE/node"
            Index           =   0
         End
         Begin Menu m_icedecbeh 
            Caption         =   "&Deceive all ICE in node"
            Checked         =   -1  'True
            Index           =   1
         End
      End
      Begin Menu m_logfile 
         Caption         =   "&Logfile on/off..."
      End
      Begin Menu m_realtime 
         Caption         =   "&Real Time Decking..."
      End
      Begin Menu m_showmap 
         Caption         =   "Show Auto &Map..."
      End
      Begin Menu m_sortstorage 
         Caption         =   "&Sort Storage Memory by..."
         Begin Menu m_sortby 
            Caption         =   "&leave unsorted"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin Menu m_sortby 
            Caption         =   "&Names"
            Index           =   1
         End
         Begin Menu m_sortby 
            Caption         =   "N&ames reversed"
            Index           =   2
         End
         Begin Menu m_sortby 
            Caption         =   "&Size"
            Index           =   3
         End
         Begin Menu m_sortby 
            Caption         =   "S&ize reversed"
            Index           =   4
         End
      End
      Begin Menu m_hackpool 
         Caption         =   "Split &Hacking Pool..."
      End
      Begin Menu m_dices 
         Caption         =   "&Throw dices manually"
      End
      Begin Menu m_sep3 
         Caption         =   "-"
      End
      Begin Menu m_setdeck 
         Caption         =   "Set Default C&yberdeck..."
      End
      Begin Menu m_setdecker 
         Caption         =   "Set Default &Decker..."
      End
      Begin Menu m_setltg 
         Caption         =   "Set Default &Matrix..."
      End
   End
   Begin Menu m_help 
      Caption         =   "&Help"
      Begin Menu m_gamemaster 
         Caption         =   "Show &Gamemasters Log..."
      End
      Begin Menu m_learn 
         Caption         =   "&Learn Mode..."
      End
      Begin Menu m_starthelp 
         Caption         =   "Start &Help..."
      End
      Begin Menu m_sep4 
         Caption         =   "-"
      End
      Begin Menu m_orderthisprogram 
         Caption         =   "&Order this Program..."
      End
      Begin Menu m_about 
         Caption         =   "&About this Program..."
      End
   End
End
Option Explicit
Rem --- Define Constants here AND in cyber01.bas ---
Const MAXICENUM = 100
Const MAXSORTNUM = MAXICENUM + 1
Const MAXNODENUM = 100
Const MAXLINKSNUM = 30
Const MAXFILESNUM = 20
Const ALERTNONE = 0
Const ALERTPASSIVE = 1
Const ALERTACTIVE = 2
Const RANGEOBS = 2
Const RANGESEN = 1
Const RANGECON = 0
Const ICEHIT = 3     ' short phase where ICE tries to hit the decker (i.e. shoots at)
Const ICEYELL = 2
Const ICESUSP = 1
Const ICELOOK = 0
Const ICESLEZ = -1
Const ICESLEA = -2
Const ICEDECP = -3
Const ICEFROZ = -4
Const EMOBILE = 0
Const PMOBILE = 1
Const AMOBILE = 2
Const IMOBILE = 3
Const LUNSORTED = 0
Const LNAMES = 1
Const LNAMESR = 2
Const LSIZE = 3
Const LSIZER = 4

Rem --- Color Constants ---
Const BLACK = &H0&
Const RED = &HFF&
Const GREEN = &HFF00&
Const YELLOW = &HFFFF&
Const BLUE = &HFF0000
Const MAGENTA = &HFF00FF
Const CYAN = &HFFFF00
Const WHITE = &HFFFFFF
Const ORANGE = &HFFFF&    ' &H7FFF&  let orange be yellow because of few colors
Const DARK = &H808080

Rem --- Constants for MsgBox ---
Const MB_OK = 0
Const MB_OKCANCEL = 1
Const MB_ABORTRETRYIGNORE = 2
Const MB_YESNOCANCEL = 3
Const MB_YESNO = 4
Const MB_RETRYCANCEL = 5
Const MB_ICONSTOP = 16
Const MB_ICONQUESTION = 32
Const MB_ICONEXCLAMATION = 48
Const MB_ICONINFORMATION = 64
Const MB_DEFBUTTON1 = 0
Const MB_DEFBUTTON2 = 256
Const MB_DEFBUTTON3 = 512
Const MB_APPLMODAL = 0
Const MB_SYSTEMMODAL = 4096
Const IDOK = 1
Const IDCANCEL = 2
Const IDABORT = 3
Const IDRETRY = 4
Const IDIGNORE = 5
Const IDYES = 6
Const IDNO = 7

Rem --- Constants for Wave playing ---
Const SND_SYNC = &H0          ' Play sound and return then
Const SND_ASYNC = &H1         ' Play sound and return immediately
Const SND_NODEFAULT = &H2     ' Be silent when error occurs
Const SND_LOOP = &H8          ' Play sound repeatedly until "" is played (use with SND_ASYNC)
Const SND_NOSTOP = &H10       ' Don't play sound, if one is already played (don't put it into sound stack)

Const NX = 9#
Const NY = 8#
Const M_PI = 3.1415926

Sub AddDicestr (n As Long, r%)
  Rem Add n-times the dice result r% to the Dice string
  Dim i%

  If n > 0 Then
    If Len(dicestr$) > 0 Then dicestr$ = dicestr$ & ","
    dicestr$ = dicestr$ & Format(r)
    If n > 1000 Then
      NewPad ("Cheating!!! To much dices!")
      n = 1
    End If
    For i = 2 To n
      dicestr$ = dicestr$ & "," & Format(r)
    Next i
  End If

End Sub

Sub AddPad (s$)
  Rem add text to current line in Pad.Caption

  If Len(s$) > 0 Then pad.Caption = pad.Caption & s$
End Sub

Sub Addprogram (b$)
  Dim a$, p$
  Dim r%

  a$ = b$
  p$ = GetWord(a$, "-")
  r = Val(a$)
  If FitStorage(p$, 0, r) = False Then
    Rem load program anyway!
  End If

End Sub

Sub Adjust3D1_Click ()
  Form16.Show 1
  Call UpdateDeckStatus(decker, deck)
End Sub

Sub AttribDamage (deck As cyberdecktype, ByVal dam%, ByVal icenr%, ByVal attribnr%, ByVal mesg$)
  Dim i%, k%, m%

  If dam > 0 Then
    
    Select Case attribnr
      Case 0: Call SoundPlay("ACID", 3)
      Case 1: Call SoundPlay("BIND", 3)
      Case 2: Call SoundPlay("MARK", 3)
      Case 3: Call SoundPlay("JAMM", 3)
      Case 4: Call SoundPlay("BURN", 3)
    End Select
    
    NewPad (mesg$)
    
    If deck.add(attribnr) > 0 Then                  ' reduce additional attributes first
      If dam <= deck.add(attribnr) Then
        m = dam
        dam = 0
      Else
        m = deck.add(attribnr)
        dam = dam - deck.add(attribnr)
      End If
      For i = 1 To m
        Select Case attribnr
          Case 0: k = UseBod()
          Case 1: k = RedEva()
          Case 2: k = UseMask()
          Case 3: k = RedSens()
          Case 4: k = RedMPCP()
        End Select
      Next i
    End If
    
    If dam > 0 Then                  ' Damage reduces real attribute
      deck.dam(attribnr) = deck.dam(attribnr) + dam
      deck.restr(attribnr) = GetIceRating(icenr)    ' store Target number for Restore program
    End If
    Call RecalcAttrib(deck)   ' reduces exceeded damage and applies all else
  End If

End Sub

Sub AutoMap_Click ()
  
  Form15.Show
  RedrawPic1

End Sub

Sub Backward_Click ()
  Rem BACKWARD

  Call DeckersTurn(curnode, "BACKWARD")
  If decker.body <= 0 Or decker.damage_stun >= 10 Or decker.damage_phys >= 10 Then
    NewPad ("Plug in first!")
  Else
    If deck.range < RANGEOBS Then
      deck.range = deck.range + 1
      Exits3D1(0).Caption = "" ' Remove display of links
      Exits3D1(1).Caption = "" ' Remove display of links
      Exits3D1(2).Caption = "" ' Remove display of links
      RangeLabel.Caption = rangetypes(deck.range)
      If attacked = True Then   ' When decker has attacked ICE in node and makes backstep
        SetPasAlert
        SetPasAlert ' -> Active Alert
      End If
      Call ShowNode(curnode, False, False)
    Else
      MoveLastLink ' Backward in Observation -> Step Back
    End If
    timetics = 1
    CntIni (timetics)
  End If
End Sub

Function BlockedByIce (ByVal operation$) As Integer
  Rem Tests if way is blocked by some ICE
  Rem This routine needs GetICEofNode previously executed for iceofnode() and node().iceactive
  Rem operation$="SHOWFILES" --> undeceived "SCRAMBLE" counts as blocking
  Rem
  Dim ret%, i%, k%, icenr%, op%
  Dim icestr$, c$
  
  k = 0
  op = 0
  If operation$ = "SHOWFILES" Then op = 1

  For i = 0 To node(curnode).iceactive - 1
    icenr = iceofnode(i)
    icestr$ = GetICEType(icenr, c$)
    If (op <> 1 And icestr$ = "SCRAMBLE") Or (Left$(icestr$, 5) = "TRACE" And ice(icenr).tracetics <> 0) Then
      k = k + 1   ' Scramble or fleeing Trace ICE does not count as blocking
    ElseIf ice(icenr).satisfaction < ICELOOK Or ice(icenr).range <> deck.range Then
      k = k + 1   ' frozen, deceived, or sleazed ICE, or ICE at other range does not count as blocking
    Else
      k = k       ' not satisfied: blocks!
    End If
  Next i
  If k <> node(curnode).iceactive Then   ' number of satisfied ICE
    ret = True
  Else
    ret = False
  End If
  
  BlockedByIce = ret
End Function

Sub BubbleSort (ndice%)
  Rem Sorts numbers in dicearr and changes dicestr$
  Dim i%, j%, h%
  Dim a$
  
  For i = 0 To ndice - 1
    sortdicearr(i) = dicearr(i)
  Next i
  For i = 0 To ndice - 1
    For j = 0 To i - 1
      If (sortdicearr(i) < sortdicearr(j)) Then
        h = sortdicearr(i)
        sortdicearr(i) = sortdicearr(j)
        sortdicearr(j) = h
      End If
    Next j
  Next i

  dicestr$ = ""
  For i = 0 To ndice - 1
    Call AddDicestr(1, sortdicearr(i))
  Next i

End Sub

Sub CheckStatus_Click (Index As Integer, Value As Integer)
  Rem Click on Damage Status Checkboxes
  Dim i%, dtar%
  
  dtar = ModDeck(decker, deck)
  
  If Index < 10 Then
    If Value = True Then
      For i = Index - 1 To 0 Step -1
        If CheckStatus(i).Value = False Then
          CheckStatus(i).Value = True
        End If
      Next i
    Else
      For i = 9 To Index + 1 Step -1
        If CheckStatus(i).Value = True Then
          CheckStatus(i).Value = False
        End If
      Next i
    End If
    For i = 0 To 9
      If CheckStatus(i).Value = False Then Exit For
    Next i
    deck.damage = i

  ElseIf Index < 20 Then
    If Value = True Then
      For i = Index - 1 To 10 Step -1
        If CheckStatus(i).Value = False Then
          CheckStatus(i).Value = True
        End If
      Next i
    Else
      For i = 19 To Index + 1 Step -1
        If CheckStatus(i).Value = True Then
          CheckStatus(i).Value = False
        End If
      Next i
    End If
    For i = 10 To 19
      If CheckStatus(i).Value = False Then Exit For
    Next i
    decker.damage_stun = i - 10
  ElseIf Index < 30 Then
    If Value = True Then
      For i = Index - 1 To 20 Step -1
        If CheckStatus(i).Value = False Then
          CheckStatus(i).Value = True
        End If
      Next i
    Else
      For i = 29 To Index + 1 Step -1
        If CheckStatus(i).Value = True Then
          CheckStatus(i).Value = False
        End If
      Next i
    End If
    For i = 20 To 29
      If CheckStatus(i).Value = False Then Exit For
    Next i
    decker.damage_phys = i - 20
  End If
  dtar = ModDeck(decker, deck) - dtar
  decker.ini = decker.ini - dtar  ' reduce current Initiative due to damage

  If deck.damage >= 10 Then
    Rem  Cyberdeck is crashed
    curnode = 0
    deck.range = RANGEOBS
    node(nodenum).typ = "CRA"
    Call ShowNode(curnode, False, False)
  End If

  Debug.Print "Damage", deck.damage
End Sub

Sub ChgNode (n As Integer)
  Rem --- Initialize some variables when decker enters a new node ---

  attacked = False        ' Next node ICE not attacked until now
  
  deck.modsleaze = 0
  deck.moddecrypt = 0
  deck.modattack = 0
  deck.moddeception = 0
  deck.modload = 0
  deck.resleazetics = 0
  ' Combat utilities
  deck.usedprgs.attack = -1
  deck.usedprgs.blind = -1
  deck.usedprgs.hog = -1
  deck.usedprgs.poison = -1
  deck.usedprgs.restrict = -1
  deck.usedprgs.reveal = -1
  deck.usedprgs.slow = -1
  ' Defense utilities (most are degradable)
  deck.usedprgs.restore = -1
        
  ' Sensor utilities
  deck.usedprgs.analyze = -1
  deck.usedprgs.browse = -1
  deck.usedprgs.decrypt = -1
  deck.usedprgs.evaluate = -1
  deck.usedprgs.scanner = -1
  deck.usedprgs.sift = -1
  ' Masking utilities
  deck.usedprgs.deception = -1
  deck.usedprgs.relocate = -1
  deck.usedprgs.Sleaze = -1
  ' Operation utilities don't change

End Sub

Sub Clear_Click ()

  pad.Caption = ""

End Sub

Sub CntEmergency ()
  Rem Tests if more or equal than emergeperc ICE is damaged.
  Rem If true, then begin countdown for Shutdown (with 10 tics)

  If emergeperc > 0# And emergeperc <= 100# And emergetics >= 0 Then ' Shortcut for emergeperc = 101
    If icenum > 0 Then
      Debug.Print "CntEmerge icecrashed,%,soll, emergetics, shutdown"; icecrashed, (icecrashed * 100#) / icenum; emergeperc; emergetics; shutdowntics
      If (icecrashed * 100#) / icenum >= emergeperc Then
        If emergetics = 0 Then
          shutdowntics = 10
          LampSHUTDOWN (True)
        End If
        emergetics = emergetics - 1
      End If
    End If
  End If
    
End Sub

Sub CntFailedSysOps ()
  Rem Decrease "memory" for failed sysops for every node <> curnode
  Dim i%

  For i = 1 To nodenum
    If i <> curnode And node(i).failsysop > 0 Then
      node(i).failsysop = node(i).failsysop - 1
    End If
  Next i

End Sub

Sub CntIni (timetics As Integer)
  Rem --- This routine handles the major program loop ---
  Rem This routine calls DoIce as long as one ICE has higher
  Rem initiative as the decker or timetics are greater then
  Rem zero.
  Rem This routine returns when decker is on.
  Rem
  Rem This routine should only be called by OBJECT-routines.
  Rem
  Dim icenr As Integer
  Dim j As Integer
  Dim h As Integer

  If realtime = True Then
    Timer1.Enabled = False       ' Don't count time for ICE actions
  End If
  If icetime Then
    Call Timer2Start(1000)       ' wait one second for sound playing
    Call Timer2WaitForElapse
    ' Do While sndPlaySound(soundpath$ + "empty.wav", SND_NOSTOP) <> False
    '   DoEvents
    ' Loop
  End If

  ' Quick Sort with Index exchanging and copying of Ice().ini and decker.ini
  Call QuickSortICE(True)
  ' Now iceorder() contains the indices of ICE sorted by initiative in ascending order.
  ' sorticeini() contains the initiative numbers of the ICE's.
  ' iceorder()=icenum-1+1 is the decker.
  Do  ' loop for timetics
    If timetics > 0 Then
      decker.ini = decker.ini - 10
      timetics = timetics - 1
      QuickSortICE (True)
    End If
  
    If icenum > 0 Then
      Do
'        Debug.Print "Decker's Initiative:"; decker.ini, sorticeini(icenum)
        h = icenum - 1 + 1
        ' as long as one Ini > 0
        Do While sorticeini(h) > 0
          If sorticeini(h) < sorticeini(icenum) Then ' not lower than highest-10
            QuickSortICE (False)
            h = icenum - 1 + 1
          End If
          icenr = iceorder(h)
          If icenr = icenum - 1 + 1 Then         ' Is decker?
            If sorticeini(h) > decker.ini Then   ' if decker.Ini has changed due to damage?
              sorticeini(h) = decker.ini
              QuickSortICE (False)
              h = icenum - 1 + 1
              If iceorder(h) = icenum - 1 + 1 Then Exit Do ' give control to decker
            Else
              Exit Do                            ' give control to the decker
            End If
          End If
          If sorticeini(h) > ice(icenr).ini Then ' if Ini has changed due to damage?
            sorticeini(h) = ice(icenr).ini
            QuickSortICE (False)
            h = icenum - 1 + 1
            If iceorder(h) = icenum - 1 + 1 Then Exit Do ' give control to decker
          End If
          
          ' Yes, it's really ICE:
        '  Debug.Print ice(icenr).description & "-" & Format(ice(icenr).rating) & " Initiative:"; sorticeini(h)
          DoICE (icenr)
          ' avoid endless loop, when decker is bailed out
          If deck.damage >= 10 Or decker.damage_phys >= 10 Or decker.damage_stun >= 10 Then GoTo endcntnewini
          ice(icenr).succattacked = False
          ice(icenr).succslowed = False
          Call UpdateDeckStatus(decker, deck)
          ice(icenr).ini = ice(icenr).ini - 10    ' reduce Ini of done ICE
          sorticeini(h) = ice(icenr).ini
          h = h - 1
          If h < 0 Then Exit Do
        Loop
        If h < 0 Then
          ' Roll new Initiative for all, because all ICE and the decker has no action left
          Call NewIni
          h = icenum
        ElseIf sorticeini(h) <= 0 Then
          Call NewIni
          h = icenum
        End If
      Loop While icenr <> icenum - 1 + 1   ' as long as not the decker himself
    Else   ' no ICE at all
      If decker.ini <= 0 Then NewIni       ' because of countdown for some things (locked, failed,...)
    End If
    UpdateDecker
  Loop While timetics > 0
endcntnewini:
  timetics = 0
  deck.modload = 0
  If realtime = True Then
    Timer1.Interval = realtimeinterval
    Timer1.Enabled = True
  End If
End Sub

Sub CntLocked ()
  Dim i%
  Rem Countdown for locked SANs

  For i = 1 To nodenum
    If node(i).locked > 0 Then node(i).locked = node(i).locked - 1
    If node(i).locked <> 0 Then Debug.Print "Locked "; node(i).locked; " turns"
  Next i
End Sub

Sub CntShutDown ()
  
  If shutdowntics > 0 Then
    shutdowntics = shutdowntics - 1
    If shutdowntics <= 2 Then
      LampSHUTDOWN (True)
      NewPad ("System Shutdown is very close!")
    End If
    If shutdowntics = 0 Then
      NewPadGM ("Dump Shock because of System Shutdown.")
      shutdowntics = -1
      ExternMatrix (2)
    End If
  End If

End Sub

Sub CntSmoke (deck As cyberdecktype)

  If deck.usedprgs.smoke = True Then
    Call DegradeUtil(deck, "SMOKE")
  End If

End Sub

Sub CntSysIrq ()
  Rem Countdown for System Inquiry
  
  If sysirqtics > 0 Then
    sysirqtics = sysirqtics - 1
    If sysirqtics = 0 Then
      SetPasAlert
    End If
  End If

End Sub

Sub CntTrace (icenr%)
  Rem Countdown for End of Trace
  Rem This routine is only called from DoICE()
  Dim succ%
  Dim c$

  If icenr >= 0 Then
    If ice(icenr).tracetics <> 0 Then
      Debug.Print ice(icenr).code; " tracing with "; ice(icenr).active; " tics left:"; ice(icenr).tracetics
    End If
    If ice(icenr).tracetics <> 0 And ice(icenr).active <= alert Then
      If ice(icenr).tracetics > 0 Then
        ice(icenr).tracetics = ice(icenr).tracetics - 1
      End If
      If ice(icenr).tracetics <= 0 And deck.onuplink = 0 Then
        Select Case GetICEType(icenr, c$)
        Case "TRACE AND REPORT":
          If ice(icenr).tracetics = 0 Then
            NewPadGM (" Trace and Report has reported Decker's Location.")
            deck.istraced = True
            ice(icenr).tracetics = -3  ' ICE flees, but don't attack
          End If
        Case "TRACE AND DUMP":
          If ice(icenr).tracetics = 0 Then
            NewPadGM (" Trace and Dump has reported Decker's Location.")
            deck.istraced = True
            ice(icenr).tracetics = -2
            NewPad ("Dumped by ICE.")
            Call ExternMatrix(1)         ' Dump the Decker immediately
          End If
        Case "TRACE AND BURN":
          If ice(icenr).tracetics = 0 Then
            NewPadGM ("Trace and Burn has reported Decker's Location.")
            NewPadLrn ("An entry point attack is most likely done by the TRACE AND BURN ICE you failed to relocate. Oops: Your location is reported. Double oops: The initiated Blaster ICE may burn your chips.")
            deck.istraced = True
          End If
          NewPad (" Oops. You are under attack at your entry point!")
          ice(icenr).tracetics = -1  ' for GetICERating to recognize Trace and Burn's Blaster Attack
          Call IceAttacksPers(decker, deck, curnode, icenr)
        End Select
      Else
        If ice(icenr).tracetics = 0 And deck.onuplink <> 0 Then
          NewPadGM ("Trace has been stopped by satellite uplink.")
          ice(icenr).tracetics = -3   ' ICE flees, but cannot attack
        End If
      End If
    End If
  End If
End Sub

Sub CountDown ()
  Dim icenr%

  If curnode <> 0 Then
    CntSysIrq
    CntShutDown
    CntFailedSysOps
    CntEmergency
    ' Do the following in DoICE
    ' For icenr = 0 To icenum - 1
    '   CntTrace (icenr)
    ' Next icenr
  End If
  CntLocked
  roundssinceload = roundssinceload + 1
  Call UpdateRounds
End Sub

Function D6 (ndice%)
  Rem Rolls "ndice" 6-sided dices and returns result
  Dim i%, v%

  v = 0
  For i = 1 To ndice
    v = v + Int(Rnd(6) * 6 + 1)
  Next
  D6 = v

End Function

Function DeckerIni (decker As deckertype, deck As cyberdecktype) As Integer
  Rem Determine the Initiative of the Decker
  Dim h%, i%, k%, n%

  If m_dices.Checked = True Then
    n = 0
    Do
      If n > deck.dicereact Then
        MsgBox "Too much dices. Use " & Format(deck.dicereact) & ". Input again!", MB_ICONEXCLAMATION
        n = 0
      End If
      Form11.Caption = "Initiative (" & Format(deck.dicereact) & "D6)"
      Form11.Show 1
      k = 0
      For i = 0 To 5
        h = Val(Format$(Form11.Text1(i).Text))
        If h > 0 Then
          k = k + h * (i + 1)
          n = n + h
        End If
      Next i
    Loop While n > deck.dicereact
  Else
    k = D6(deck.dicereact)
  End If
  Call UpdateDecker
  Debug.Print "DeckerIni="; deck.dreaction + k
  DeckerIni = deck.dreaction + k   ' deck.dreaction includes damage modifiers
  
End Function

Sub DeckersTurn (ByVal nodenr%, ByVal Action$)
  Rem --- Do some things for next turn of the decker ---
  Dim icenr%

  decker.lefthacking = decker.hackingpool ' refresh Hacking pool
  deck.hangtough = False
  Select Case UCase$(Action$)
    Case "SEE SYSTEM":
              ' Do nothing
    Case "FORWARD", "BACKWARD":
              ' No Resleaze necessary
    Case Else:
      Call ReSleaze(decker, deck, nodenr) ' sets Satisfaction from ICESLEZ to ICESLEA, if successful
      icenr = GetICEofNode(nodenr, "None")
  End Select

End Sub

Sub DecreaseLink_Click ()
  Rem decrease link
  Dim lastlink%

  If (deck.range = RANGECON) Then
    node(curnode).curlink = node(curnode).curlink - 1
    If node(curnode).curlink < 1 Then node(curnode).curlink = node(curnode).nlinks
    lastlink = GetLastlink(curnode, deck.lastnode)
    Exits3D1(0) = "Exit #" & Format(node(curnode).curlink)
    Exits3D1(1) = "  of   " & Format(node(curnode).nlinks)
    Exits3D1(2) = "Last #" & Format(lastlink)
    End If

End Sub

Sub DegradeUtil (deck As cyberdecktype, p$)
  Rem Degrade an utility:
  Rem Armor (BOD), Cloak(MASK), Smoke(combat turn)  not refreshable
  Rem Medic(usage), Mirrors(combat turn), Shield(dam) refreshable
  Rem
  Rem deck.usedprgs is only true/false for degradable utilities
  Dim i%, new_r%
  Dim a$, b$, c$

  new_r = -1
  Select Case UCase$(p$)
  Case "ARMOR":
    If deck.usedprgs.armor Then
      If deck.add(0) > 0 Then
        deck.add(0) = deck.add(0) - 1
        If deck.add(0) = 0 Then NewPad ("Your armor disolves.")
      ElseIf deck.add(0) < 0 Then
        deck.add(0) = 0
      End If
      new_r = deck.add(0)
    End If

  Case "CLOAK":
    If deck.usedprgs.cloak Then
      If deck.add(2) > 0 Then
        deck.add(2) = deck.add(2) - 1
        If deck.add(2) = 0 Then NewPad ("Your cloak disolves.")
      ElseIf deck.add(2) < 0 Then
        deck.add(2) = 0
      End If
      new_r = deck.add(2)
    End If

  Case "MEDIC":
    If deck.usedprgs.medic Then
      deck.modmedic = deck.modmedic - 1
      If deck.modmedic = 0 Then NewPad ("The first aid pack is empty.")
      If deck.modmedic < 0 Then deck.modmedic = 0
      new_r = deck.modmedic
    End If

  Case "MIRRORS":
    If deck.usedprgs.mirrors Then
      If deck.add(1) > 0 Then
        deck.add(1) = deck.add(1) - 1
        If deck.add(1) = 0 Then NewPad ("Your mirrors stops operating.")
      ElseIf deck.add(1) < 0 Then
        deck.add(1) = 0
      End If
      new_r = deck.add(1)
    End If

  Case "SHIELD":
    If deck.usedprgs.shield Then
      deck.modshield = deck.modshield - 1
      If deck.modshield = 0 Then NewPad ("Your shield disolves.")
      If deck.modshield < 0 Then deck.modshield = 0
      new_r = deck.modshield
    End If

  Case "SMOKE":
    If deck.usedprgs.smoke Then
      deck.modsmoke = deck.modsmoke - 1
      If deck.modsmoke = 0 Then NewPad ("The smoke clears up.")
      If deck.modsmoke < 0 Then deck.modsmoke = 0
      new_r = deck.modsmoke
    End If

  Case Else:
    NewPad ("BUG: Program " & p$ & " does not degrade!")

  End Select

  Call RecalcAttrib(deck)
  If new_r >= 0 Then
    i = FindProg(List1, p$)
    If i >= 0 Then
      ' modify rating display in active mem
      a$ = List1.List(i)
      c$ = GetWord(a$, "-")
      b$ = GetWord(a$, "[")
      List1.List(i) = c$ & "-" & Format(new_r) & " [" & a$
    End If
  End If
  Call UpdateDeckStatus(decker, deck)

End Sub

Sub DeleteButton_Click ()
  Rem Delete File/Program from Storage Memory
  Dim a$, p$, s$
  Dim siz As Long

  Call DeckersTurn(curnode, "DELETE")
  If decker.body <= 0 Or decker.damage_stun >= 10 Or decker.damage_phys >= 10 Then
    NewPad ("Plug in first!")
  Else
    If List2.ListIndex >= 0 Then
      a$ = List2.List(List2.ListIndex)
      p$ = UCase$(GetWord(a$, "["))
      siz = Val(a$)
      deck.storageprogmem = deck.storageprogmem - siz
      List2.RemoveItem List2.ListIndex
      dirtyflag = True
      UpdateMemoryStatus
      Call UpdateDeckStatus(decker, deck)
    End If
  End If
  timetics = 1
  CntIni (timetics)

End Sub

Sub DelProg (decker As deckertype, deck As cyberdecktype, storage%)
  Rem Delete Program in active memory
  Rem Routine is used by Unload_Click, TAR PIT and TAR BABY
  Rem storage = 0  -> Unload
  Rem storage = 1  -> TAR BABY
  Rem storage = 2  -> TAR PIT
  Dim a$, l$, p$, pr$, s$
  Dim r%
  Dim siz As Long

  If List1.ListIndex >= 0 Then
    r = 0
    a$ = List1.List(List1.ListIndex)
    l$ = a$
    p$ = UCase$(GetWord(a$, "-"))
    r = Val(a$)
    s$ = GetWord(a$, "[")
    siz = CalcProgSize(p$, r)
    ' Debug.Print "Size calc: "; siz
    If siz = 0 Then
      a$ = l$
      pr$ = GetWord(a$, "[")
      siz = Val(a$)
      ' Debug.Print "Size get: "; siz
    Else
      a$ = l$
      l$ = GetWord(a$, "[")
      If 100 * deck.compressed >= siz And p$ <> "COMPRESSOR" Then
        l$ = l$ & "[" & Int(.5 * Format(siz) + .99) & "Mp]"
      Else
        l$ = l$ & "[" & Format(siz) & "Mp]"
      End If
    End If

    Debug.Print "Delete Program "; p$
    Select Case p$
    Case "ARMOR":
      deck.add(0) = 0 ' Unload Armor   (not refreshable)
      siz = CalcProgSize("ARMOR", deck.ratearmor)
      deck.ratearmor = 0

    Case "CLOAK":
      deck.add(2) = 0 ' Unload Cloak   (not refreshable)
      siz = CalcProgSize("CLOAK", deck.ratecloak)
      deck.ratecloak = 0
    
    Case "MEDIC":
      deck.modmedic = 0   ' Unload Medic (refreshable)
      deck.usedprgs.medic = -1
      siz = CalcProgSize("MEDIC", deck.ratemedic)
      deck.ratemedic = 0

    Case "MIRRORS":
      deck.add(1) = 0   ' Unload Mirrors (refreshable)
      deck.usedprgs.mirrors = -1
      siz = CalcProgSize("MIRRORS", deck.ratemirrors)
      deck.ratemirrors = 0
    
    Case "SHIELD":
      deck.usedprgs.shield = -1   ' Unload Shield (refreshable)
      siz = CalcProgSize("SHIELD", deck.rateshield)
      deck.rateshield = 0
    
    Case "SMOKE": ' unload Smoke (not refreshable)
      deck.modsmoke = 0
      siz = CalcProgSize("SMOKE", deck.ratesmoke)
      deck.ratesmoke = 0
    
    Case "SATLINK": ' Satellite Uplink running?
      If deck.onuplink <> 0 Then
        LampUPLINK (False)
        ExternMatrix (3)
      End If

    Case "AUTO EXECUTE":
      deck.usedprgs.auto_execute = 0

    Case Else:
      If storage <> 2 Then
        List2.AddItem l$ ' put used programs back to storage when not TAR PIT
      End If

    End Select
    
    Call RecalcAttrib(deck)   ' due to add() = 0
    List1.RemoveItem List1.ListIndex
    deck.activeprogmem = deck.activeprogmem - siz
    If storage = 2 Then
      If p$ = "ARMOR" Or p$ = "CLOAK" Or p$ = "MEDIC" Or p$ = "MIRRORS" Or p$ = "SHIELD" Or p$ = "SMOKE" Then
        ' TAR PIT deletes from storage mem!
        deck.storageprogmem = deck.storageprogmem - siz
        r = FindProg(List2, p$)
        List2.RemoveItem r
      End If
    End If
    UpdateMemoryStatus
    Call UpdateDeckStatus(decker, deck)
  
  End If

End Sub

Function DeviceColors (hDC As Integer) As Long
Const BITSPIXEL = 12
Const PLANES = 14
    Dim bpp As Long

    bpp = GetDeviceCaps(hDC, BITSPIXEL)
    If bpp >= 32 Then
      DeviceColors = &H80000000   ' Shit happens: VB doesn't support unsigned long (overflow preventation)
    Else
      DeviceColors = GetDeviceCaps(hDC, PLANES) * 2 ^ GetDeviceCaps(hDC, BITSPIXEL)
    End If
End Function

Sub DicestrToResult ()
  Rem Translates dicestr$="1,1,2,2,2,4,4,5,5,7,7,8" to dicearr(...)
  Dim i%
  Dim a$

  a$ = dicestr$
  For i = 0 To 100
    dicearr(i) = 0
  Next i
  i = 0
  While Len(a$) > 0 And i < 101
    dicearr(i) = Val(GetWord(a$, ","))
    i = i + 1
  Wend
End Sub

Sub DoICE (icenr%)
  Rem Handles ICE reaction on decker
  Rem
  Rem "GRAY Killer (M)"  ICE does "M"oderate damage
  Rem "BLACK Probe (SD)" ICE does "D"eadly "S"tun damage
  Rem
  Dim h%
  Dim a$, b$, c$, p$, ic$

  Rem --- ICE active and ICEs turn? ---
  timer2elapsed = True
  If ice(icenr).active <= alert Then
    b$ = GetICEType(icenr, c$)             ' b$=ICE type uppercase    c$ = ICEColor
    ' if in other node or other range or fleeing Trace-ICE
    If ice(icenr).nodenr <> curnode Or ice(icenr).range <> deck.range Then
      If ice(icenr).mobile <= alert Then
        Rem --- Move ICE when mobile ---
        Call MoveICE(icenr)
        If ice(icenr).nodenr = curnode And ice(icenr).range = deck.range Then
          ' minimize "ShowNode" calls
          Call ShowNode(curnode, False, False)
        End If
      End If
      ' trigger Active Alert, when successful attacked
      If (ice(icenr).succattacked = True Or ice(icenr).succslowed = True) And ice(icenr).damage < 10 And Not (IsICEfrozen(icenr)) Then
        Call SetPasAlert
        Call SetPasAlert
      End If
      CntTrace (icenr)   ' Count down for tracing, if ICE actually traces
      ice(icenr).modtar = 0
      Call SetICEsatisfaction(icenr, ICELOOK)
    Else
      
      Rem --- ICE in same node at same range ---
      If ice(icenr).succslowed = True Then Call SetICEsatisfaction(icenr, ICEYELL)
      If attacked = True Then Call SetICEsatisfaction(icenr, ICEYELL)
      
      ic$ = GetICEofNodeNrStr(icenr)
      h = GetAppropICE(curnode, deck.range, icenr)
      If icebehavior = DECEPT_APPROP And h <> icenr Then
        Debug.Print "Only appropriate ICE must be deceived..."
        Rem Adapt satisfaction to satisfaction of appropriate ICE, except frozen.
        If ice(h).satisfaction = ICEFROZ Then
          Call MakeICEsatisfaction(curnode, icenr, ICEDECP)
        Else
          Call MakeICEsatisfaction(curnode, icenr, ice(h).satisfaction)
        End If
      Else
NormalReaction:
        Call Timer2Start(icetimeinterval)   ' Start ICE clock
        ' This ICE reacts
        If ice(icenr).satisfaction = ICEFROZ And ice(icenr).range = deck.range And ice(icenr).nodenr = curnode Then
          NewPad ("*" & ic$ & " is frozen.")
          ' Call SoundPlay("FROZ", 3)    play sound only once
          Call ShowNode(curnode, False, True)
        ElseIf ice(icenr).satisfaction = ICEDECP Then
          NewPad ("*" & ic$ & " ignores you.")
          Call SoundPlay("DECP", 3)
        ElseIf ice(icenr).satisfaction = ICESLEA Then
          NewPad ("*" & ic$ & " does not see you.")
          Call SoundPlay("SLZA", 3)
          Call SetICEsatisfaction(icenr, ICESLEZ)
        ElseIf ice(icenr).satisfaction = ICESLEZ Then
          NewPad ("*" & ic$ & " is nervous.")
          Call SoundPlay("SLZE", 3)
          Call SetICEsatisfaction(icenr, ICESUSP)
        ElseIf ice(icenr).satisfaction = ICELOOK Then
          NewPad ("*" & ic$ & " wants your identification.")
          Call SoundPlay("LOOK", 3)
          Call SetICEsatisfaction(icenr, ICESUSP)
        ElseIf ice(icenr).satisfaction = ICESUSP Then
          NewPad ("*" & ic$ & " is suspicious.")
          Call SoundPlay("SUSP", 3)
          SetPasAlert
          Call TriggerICE1(icenr)                 ' Trigger new ICE?
          Call SetICEsatisfaction(icenr, ICEYELL)
        ElseIf ice(icenr).satisfaction >= ICEYELL Then
          Call TriggerICE1(icenr)                 ' Trigger new ICE?
          Call SetICEsatisfaction(icenr, ICEHIT)  ' Showing hitting ICE
        End If
        Call ShowNode(curnode, False, False)
        If ice(icenr).satisfaction = ICEHIT Then
          Call SetICEsatisfaction(icenr, ICEYELL)
        End If
      End If
      
      Select Case b$
        Case "BARRIER", "ACCESS", "PROBE":
          If ice(icenr).satisfaction = ICEYELL Then
            If ice(icenr).succslowed = False Then
              NewPad ("*" & ic$ & " yells!")
              Call SoundPlay("YELL", 3)
              SetPasAlert
              SetPasAlert
            End If
            If c$ = "GRAY" Or c$ = "BLACK" Then
              Call IceAttacksPers(decker, deck, curnode, icenr)
            End If
          End If

        Case "SCRAMBLE":
          If ice(icenr).satisfaction = ICEYELL Then
            If ice(icenr).succslowed = False Then
              NewPad ("*" & ic$ & " yells!")
              Call SoundPlay("YELL", 3)
              SetPasAlert
              SetPasAlert
            End If
            If ice(icenr).succattacked = False And ice(icenr).succslowed = False Then
              Rem Erase one File
              If node(curnode).nfiles > 0 Then
                node(curnode).nfiles = node(curnode).nfiles - 1
                If node(curnode).nfiles = 0 Then
                  LampDATA (False)' Data exists off when no file left
                  NewPad ("*Scramble erases last file.")
                Else
                  NewPad ("*Scramble erases one file.")
                End If
                Call SoundPlay("Erase File", 3)
              End If
            End If
          End If
     
        Case "KILLER", "BLASTER", "ACID", "BINDER", "MARKER", "JAMMER":
          If ice(icenr).satisfaction = ICEYELL Then
            Rem --- hit the decker! ---
            Call IceAttacksPers(decker, deck, curnode, icenr)
          End If

        Case "TAR BABY", "TAR PIT":
          If ice(icenr).satisfaction = ICEYELL Then
            If ice(icenr).succattacked = False And ice(icenr).succslowed = False Then
              Rem --- Delete the utility in active mem the decker used against it ---
              SetPasAlert
              SetPasAlert
              If List1.ListIndex >= 0 Then
                a$ = List1.List(List1.ListIndex)
              Else
                a$ = ""
              End If
              p$ = GetWord(a$, "-")
              If IsDefense(p$) = False And UCase$(p$) <> "AUTO EXECUTE" Then
                If b$ = "TAR BABY" Then
                  Call SoundPlay("TARB", 3)
                  Call DelProg(decker, deck, 1)
                  NewPad ("*Your " & p$ & " program crashed.")
                  NewPad ("*" & ic$ & " crashes too.")
                  NewPadGM ("Tar Baby steals " & p$ & " from active mem.")
                  NewPadLrn ("Only Tar Baby ICE shows this behavior.")
                Else ' TAR PIT
                  ' Delete the utility in active and storage mem the decker used against it ---
                  Call SoundPlay("TARP", 3)
                  Call DelProg(decker, deck, 2)
                  NewPad ("*Your " & p$ & " program crashed. Ups! It disappeared completely.")
                  NewPad ("*" & ic$ & " crashes too.")
                  NewPadGM ("Tar Pit steals " & p$ & " from active and storage mem.")
                  NewPadLrn ("Only Tar Pit ICE shows this behavior.")
                  dirtyflag = True
                End If
                Call DoIceDamage(icenr, 1, "D")  ' TAR BABY/PIT crashes taking the utility with it
              End If
            End If
          End If

        Case "TRACE AND REPORT", "TRACE AND DUMP", "TRACE AND BURN":
          If ice(icenr).tracetics <> 0 Then ' fleeing ICE tries to move
            MoveICE (icenr)
            If ice(icenr).nodenr <> curnode Or ice(icenr).range <> deck.range Then
              ' minimize "ShowNode" calls
              Call ShowNode(curnode, False, False)
            End If
            Call CntTrace(icenr)
          End If
          If ice(icenr).satisfaction = ICEYELL Then
            If ice(icenr).tracetics = 0 Then
              Rem --- TRACE tries to locate the deckers entry point in the matrix
              h = SuccNumber(GetIceRating(icenr), UseMask())
              If h > 0 Then
                ice(icenr).tracetics = Int(10# / h + .99)
                If ice(icenr).tracetics = 0 Then ice(icenr).tracetics = 1   ' at least one turn
                Call SoundPlay("BARK", 3)
                NewPad ("*An ICE-dog runs away from its " & ic$ & "-owner.")
                NewPadGM ("*Time for tracing is " & ice(icenr).tracetics & " (" & ice(icenr).description & ")")
                NewPadLrn ("This seems to be some sort of TRACE-Ice. Use the RELOCATE program against it or jack out quickly if you don't want your location to be reported.")
              End If
            End If
          End If

      End Select
      Call Timer2WaitForElapse   ' Wait for timer2 (ICE clock) to elapse
      Call ShowNode(curnode, False, False)
    End If ' ice in same node at same range
  End If   ' not active or ini to small
    
End Sub

Sub DoIceDamage (icenr%, succ%, basedam$)
  Rem Resolves Damage for ICE
  Rem - icenr is index for the ICE attacked (here curnode)
  Rem - succ is number of extra successes staging the damage
  Rem - basedam is base damage level of the ATTACK program (L/M/S/D or even light/moderate/serious/deadly)
  Rem - basedam = F means freeze attempt due to SLOW program
  Dim baselev%
  Dim dtar%
  Dim m%, k%

  If icenr >= 0 Then
  Select Case UCase$(Left$(basedam$, 1))
    Case "L": baselev = 0
    Case "M": baselev = 1
    Case "S": baselev = 2
    Case "D": baselev = 3
    Case "F": baselev = 0
  Case Else: baselev = 0
  End Select

  dtar = ModICE(icenr)
  ' New combat rules: each extra success stages damage by one
  If succ > 0 Then
    If Left$(UCase$(basedam$), 1) = "F" Then
      ' freeze ICE (Slow damage) counts positive
      ice(icenr).freezemod = ice(icenr).freezemod + succ
      Call SoundPlay("SLOW", 3)
    Else
      ' Normal Attack damage
      ice(icenr).damage = ice(icenr).damage + damlev(baselev) + succ - 1
      Call SoundPlay("HITD", 3)
    End If
  End If

  dtar = ModICE(icenr) - dtar
  ice(icenr).ini = ice(icenr).ini - dtar            ' reduce Initiative due to damage
  If ice(icenr).damage >= 10 Then
    Rem  ICE is crashed
    ice(icenr).active = 4
    icecrashed = CrashedICE()
    Call ShowNode(curnode, False, True)
    If GetICEofNode(curnode, "none") = -1 Then
      LampICE (False)  ' Deactivate label "ICE present"
    End If
    If alert < ALERTACTIVE And decker.hackingpool > 0 Then
      m = MsgBox("Allocate Dice from Hacking Pool to suppress an alert?", MB_ICONQUESTION + MB_YESNO)
      If m = IDYES Then
        decker.hackingpool = decker.hackingpool - 1  ' Yes
        decker.hackingallo = decker.hackingallo + 1
        k = D6(6 - node(curnode).colnr)
        If sysirqtics <= 0 Or k < sysirqtics Then sysirqtics = k
        NewPad ("Next system inquiry will reveal alert.")
        NewPadGM ("Next system inquiry in " & Format(sysirqtics) & " turns.")
      Else
        SetPasAlert                                  ' No
      End If
    End If
  End If
  End If   ' icenr < 0 makes no sense
End Sub

Sub DoPersDamage (decker As deckertype, deck As cyberdecktype, succ%, basedam$, damtype%, icenr%)
  Rem succ     are extra successes of the ICE, or (if damtype=-1) of the Persona
  Rem basedam  is the base damage L,M,S,D (default is L)
  Rem damtype = -1 (Stun damage which must be reduced as in non-matrix combat)
  Rem damtype = 0 (normal deck damage), 1=(direct stun damage), 2=(direct phys damage)
  Rem damtype = 3,4,5,6 (Acid, Binder, Marker, Jammer)
  Rem icenr   = is only needed for Acid,Binder, Marker, Jammer
  Rem
  Rem Most Fighting Sounds are played in ICEAttacksPers()
  Rem
  Dim baselev%
  Dim dtar%
  Dim dam%

  dam = 0
  Select Case UCase$(Left$(basedam$, 1))
    Case "L": baselev = 0
    Case "M": baselev = 1
    Case "S": baselev = 2
    Case "D": baselev = 3
    Case Else: baselev = 0
  End Select
  dtar = ModDeck(decker, deck)


  If succ >= 0 Then
    Rem --- determine damage ---
    Select Case damtype
      Case 0, 3, 4, 5, 6:  ' Killer, Blaster, Acid, Binder, Marker, Jammer
        dam = damlev(baselev) + succ - 1
        dam = GetShieldMod(deck, dam) - deck.hardening
        ' Shield: SR 2.175, Hardening: SR 2.172
      Case -1:
        ' Reduce e.g. 4M Stun damage: 2 extra successes per damage level needed
        ' succ are successes of the persona, not of the ICE!
        baselev = baselev - Int(succ / 2)
        dam = 0
        If baselev >= 0 Then dam = damlev(baselev)
      Case 1, 2:
        If succ >= 2 Then
          dam = damlev(baselev) + Int(succ / 2) - 1 - deck.hardening
          ' Shield useless against Black ICE, but Hardening works (SR 2.171)
        End If
    End Select

    Rem --- apply damage ---
    If dam > 0 Then
      Select Case damtype
        Case 0:
          Call SoundPlay("HITG", 3)
          deck.damage = deck.damage + dam
        Case -1, 1:
          decker.damage_stun = decker.damage_stun + dam
          Call SoundPlay("HITB", 3)
        Case 2:
          decker.damage_phys = decker.damage_phys + dam
          Call SoundPlay("HITP", 3)
        Case 3:
          Call AttribDamage(deck, dam, icenr, 0, "*Part of your matrix icon disolve.")
        Case 4:
          Call AttribDamage(deck, dam, icenr, 1, "*Your Evasion attribute is reduced.")
        Case 5:
          Call AttribDamage(deck, dam, icenr, 2, "*You become better visible.")
        Case 6:
          Call AttribDamage(deck, dam, icenr, 3, "*Your sight impairs.")
      End Select
    End If
    If decker.damage_stun > 10 Then
      decker.damage_phys = decker.damage_phys + decker.damage_stun - 10
      decker.damage_stun = 10
    End If
    dtar = ModDeck(decker, deck) - dtar
    decker.ini = decker.ini - dtar  ' reduce actual Initiative due to damage
    dam = deck.damage
    If deck.damage >= 10 Then
      Rem  Cyberdeck is crashed
      dam = 10
      curnode = 0
      deck.range = RANGEOBS
      node(nodenum).typ = "CRA"
      Call SoundPlay("CRAS", &H1B)   ' Endless loop
      Call ShowNode(curnode, False, False)
    End If
    Call UpdateDeckStatus(decker, deck)
  End If
End Sub

Sub DoPersona ()
  Rem Execute alien personas

End Sub

Sub DrawNode (nodenr%)
  Rem --- Draws a node in the picture ---
  Rem If visited = -2 (with Color & Rating)
  Rem If visited = -1 (with Color)
  Rem If visited >= 0 (without Color)

  Dim fcolor As Long
  Dim colin As Long
  Dim colout As Long
  Dim colstr As Long
  Dim cx#, cy#, sclx#, scly#
  Dim i%, npnts%

  If nodenr >= 0 And nodenr <= nodenum Then

    sclx = Form15.Picture1.ScaleWidth / NX
    scly = Form15.Picture1.ScaleHeight / NY
    cx = node(nodenr).xpos * sclx
    cy = node(nodenr).ypos * scly
    ' Debug.Print "xpos,ypos : cx,cy="; node(nodenr).xpos; node(nodenr).ypos; ":"; cx, cy

    fcolor = 0
    Select Case node(nodenr).colnr
      Case 1: fcolor = BLUE
      Case 2: fcolor = GREEN
      Case 3: fcolor = ORANGE
      Case 4: fcolor = RED
      Case 5: fcolor = MAGENTA
      Case 6: fcolor = DARK
    End Select
    If node(nodenr).visited >= 0 Then fcolor = WHITE

    npnts = Setpntdata(node(nodenr).typ)
    For i = 0 To npnts - 1
      pntdata(i).X = cx + pntdata(i).X * sclx * .0032
      pntdata(i).Y = cy + pntdata(i).Y * scly * .0032
    Next i
    ' CvtToPxl (npnts)
'    Debug.Print "pntdata(0).x,y="; pntdata(0).x; pntdata(0).y

    If nodenr <> curnode Then
      colin = fcolor
      colout = BLACK
      colstr = BLACK
    Else
      ' Draw node with inverse colors
      colin = BLACK
      colout = fcolor
      colstr = fcolor
    End If

    Form15.Picture1.FillColor = colin
    Form15.Picture1.FillStyle = 0
    Form15.Picture1.CurrentX = cx
    Form15.Picture1.CurrentY = cy
    Form15.Picture1.ForeColor = colout
    If npnts = 0 Then                           ' SM (Circle)
      Form15.Picture1.Circle (cx, cy), .375 * sclx, colout
    ElseIf npnts = 14 And curnode = nodenr Then ' Inverse CPU
      Call Polygon(Form15.Picture1.hDC, pntdata(0), npnts)
      ' Call MyPolygon(npnts, colout, colin)
      Form15.Picture1.FillColor = WHITE
      Form15.Picture1.Circle (cx, cy), .125 * sclx, WHITE
      Form15.Picture1.FillColor = colin
    ElseIf npnts = 2 Then                       ' LNK node
      ' do no filling
    Else                                        ' All other nodes
      Call Polygon(Form15.Picture1.hDC, pntdata(0), npnts)
      ' Call MyPolygon(npnts, colout, colin)
      Form15.Picture1.FillColor = WHITE
      Form15.Picture1.Circle (cx, cy), .125 * sclx, WHITE
      Form15.Picture1.FillColor = colin
      FloodFill Form15.Picture1.hDC, cx, cy, BLACK   ' BLACK is color of boundaries
    End If
    Form15.Picture1.CurrentX = cx - .1 * sclx
    Form15.Picture1.CurrentY = cy - .2 * scly
    Form15.Picture1.ForeColor = colstr
    If node(nodenr).visited = -2 Then
      Form15.Picture1.Print Format(node(nodenr).rating)
    Else
      Form15.Picture1.Print "?"
    End If
  End If

End Sub

Function ExecMaskTest (decker As deckertype, deck As cyberdecktype, prograte%, nodenr%, icenr%, ByVal addtarget%, used%) As Integer
  ' Returns -2 when ICE makes more successes than decker
  ' Returns -1 when execution fails, but ice also
  ' Returns >=0 net successes else

  Dim dsucc%    ' Decker's successes
  Dim isucc%    ' ICE's successes
  Dim ret%

  ' Special execution test S.176 for Masking Utilities
  If deck.usedprgs.auto_execute > 0 And node(nodenr).rating > deck.usedprgs.auto_execute Then
    addtarget = addtarget + node(nodenr).rating - deck.usedprgs.auto_execute
  End If
  If used = nodenr Or deck.usedprgs.auto_execute > 0 Then ' when already successfully executed, then threshold is lower (0 or 1???)
    dsucc = SuccTest(MaxDD(prograte), node(nodenr).rating + ModDeck(decker, deck) + addtarget, 0, "Masking Utility Execution Test")
  Else
    dsucc = SuccTest(MaxDD(prograte), node(nodenr).rating + ModDeck(decker, deck) + addtarget, node(nodenr).colnr, "Masking Utility Execution Test")
  End If
  isucc = SuccNumber(GetIceRating(icenr), UseMask() + ModICE(icenr))
  If dsucc < isucc Then
    ret = -2
  ElseIf dsucc - isucc < node(nodenr).colnr Then
    ret = -1
  Else
    ret = dsucc - isucc - node(nodenr).colnr    ' net number of succ >= colnr
  End If
  ExecMaskTest = ret
End Function

Sub Execute_Click ()
  Rem Execute Program

  Dim nsucc%, dead%
  Dim r%
  Dim i%, h%, icenr%
  Dim xtrasucc%
  Dim a$, p$, c$, b$, basedam$

  i = curnode ' shortcut
  Call DeckersTurn(curnode, "EXECUTE")
  timetics = 0
  If decker.body <= 0 Or decker.damage_stun >= 10 Or decker.damage_phys >= 10 Then
    NewPad ("Plug in first!")
    GoTo endofexecute
  End If

  If List1.ListIndex >= 0 Then
    Rem -- get utility chosen --
    a$ = List1.List(List1.ListIndex)
    basedam$ = Strbrackets(a$)
    p$ = UCase$(GetWord(a$, "-"))
    r = Val(a$)
    p$ = StrwoBrackets(p$)                      ' Utility program choosen
    
    Rem -- get ICE to deals with --
    If p$ = "ANALYZE" Then
      icenr = GetICEofNode(i, "ANALYZENODE")        ' because ANALYZE node shouldn't ask for ICE to deal with!
    Else
      icenr = GetICEofNode(i, p$)
    End If
    ' b$="KILLER", "ACID",...           c$ = "WHITE","GRAY","BLACK"
    b$ = GetICEType(icenr, c$)
    

    Rem -- execute utility --
    Select Case p$

Rem --- Combat utilities:
Rem     Attack, Blind, Hog, Poison, Restrict, Reveal, Slow

    Case "ATTACK":           ' attack ICE or persona
        Call PersHitsIce(decker, deck, r, i, icenr, basedam$)

    Case "BLIND": ' attack personas sensor
        NewPad ("Cannot see a persona!")

    Case "HOG":   ' virus against persona
        NewPad ("Cannot see a persona!")

    Case "POISON": 'attack personas bod
        NewPad ("Cannot see a persona!")

    Case "RESTRICT": ' attack personas evasion
        NewPad ("Cannot see a persona!")

    Case "REVEAL": ' attack personas masking
        NewPad ("Cannot see a persona!")

    Case "SLOW": ' reduce ICEs initiative
        If deck.range <= RANGESEN And icenr >= 0 Then
          If c$ = "WHITE" Then
            xtrasucc = SuccTest(MaxDD(r), node(i).rating + ModDeck(decker, deck), node(i).colnr + 1, "Slow Test")' White ICE has no defend ability
          ElseIf c$ = "GRAY" Or c$ = "BLACK" Then
            xtrasucc = SuccOppTest(MaxDD(r), node(i).rating + ModDeck(decker, deck), node(i).colnr + 1, GetIceRating(icenr), UseEva() + ModICE(icenr), "Slow Test")
          Else
            NewPad ("No ICE.")
          End If
          deck.moddeception = 1000
          deck.modsleaze = 1000
          deck.moddecrypt = 1000
          Call SetICEsatisfaction(icenr, ICEYELL)
          ice(icenr).succslowed = False
          attacked = True
          If xtrasucc <= 0 Then
            NewPad ("Slow missed!")
          Else  ' xtrasucc > 0 Then
            NewPad ("Slow successful!")
            ice(icenr).succslowed = True
            Call DoIceDamage(icenr, xtrasucc, "F")
          End If
        End If

Rem --- Defense Utilities (run in your deck, not in node)
Rem     Armor, Cloak, Medic, Mirrors, Restore, Shield, Smoke
    Case "ARMOR":
        If deck.usedprgs.armor = True Then
          NewPad ("Cannot refresh an Armor program.")
        Else
          NewPad ("Armor builds up.")
          deck.add(0) = r   ' Armor degenerates at every test against Body
          Call RecalcAttrib(deck)
          deck.usedprgs.armor = True
          Call UpdateDeckStatus(decker, deck)
        End If
    
    Case "CLOAK":
        If deck.usedprgs.cloak = True Then
          NewPad ("Cannot refresh a Cloak program.")
        Else
          NewPad ("You wear a disguising cloak now.")
          deck.add(2) = r  ' Cloak degenerates at every test against Masking
          Call RecalcAttrib(deck)
          deck.usedprgs.cloak = True
          Call UpdateDeckStatus(decker, deck)
        End If

    Case "MEDIC":
        If deck.damage = 0 Then
          NewPad ("No need to heal damage.")
        Else
          h = 4
          If deck.damage >= 3 Then h = 5
          If deck.damage >= 6 Then h = 6
          nsucc = SuccTest(deck.modmedic, h, 0, "Medic Test")   ' No Hacking pool use possible
          If nsucc > 0 Then
            NewPad (Format(nsucc) & " points of damage healed.")
            deck.damage = deck.damage - nsucc
            If deck.damage < 0 Then deck.damage = 0
            Call UpdateDeckStatus(decker, deck)
          Else
            NewPad ("No healing successes!")
          End If
        End If

    Case "MIRRORS":
        If deck.usedprgs.mirrors = True Then
          NewPad ("You must load a fresh copy.")
        Else
          NewPad ("Mirror operates.")
          deck.add(1) = r     ' Mirrors degenerates at every turn (in DoIce)!
          Call RecalcAttrib(deck)
          deck.usedprgs.mirrors = True
          Call UpdateDeckStatus(decker, deck)
        End If

    Case "RESTORE": ' restores ratings of persona program damage
        ' Hacking Pool Dice not allowed!
        Call RestoreProg(decker, deck, r)

    Case "SHIELD": ' reduces damage done to the deck
        If deck.usedprgs.shield = True Then
          NewPad ("You must load a fresh copy.")
        Else
          NewPad ("A shield protects your deck attributes.")
          deck.modshield = r
          deck.usedprgs.shield = True
        End If

    Case "SMOKE": ' make all success tests in a node more difficult
        If deck.usedprgs.smoke = True Then
          NewPad ("Cannot refresh a Smoke program.")
        Else
          NewPad ("Smoke makes operations difficult.")
          deck.modsmoke = r
          deck.usedprgs.smoke = True
        End If
    
Rem --- Sensor utilities:
Rem     Analyze, Browse, Decrypt, Evaluate, Scanner, Sift
    
    Case "ANALYZE":  ' only analyze nodes here
        Debug.Print "Execute Analyze"
        If deck.range <= RANGESEN Then
          ' MaxDD(R) against SysRate with more than colnr successes, Node Resistence Test against Evasion (S.174)
          ' Are 4 xtrasucc's necessary in a Red Node or 5? (assuming 5)
          If node(i).nodeanatarget < -900 Then
            NewPad ("You already know this node:")
            xtrasucc = 2
          Else
            If deck.usedprgs.analyze <> i Then
              xtrasucc = ExecUtilTest(decker, deck, r, i, node(i).nodeanatarget, deck.usedprgs.analyze)
              If xtrasucc < 0 Then NewPad ("Execution of Analyze failed.")
            Else
              xtrasucc = SuccOppTest(MaxDD(r), node(i).rating + node(i).nodeanatarget + ModDeck(decker, deck), node(i).colnr, node(i).rating, UseEva(), "Analyze Test")
              If xtrasucc < 0 Then NewPad ("Analyze stopped working.")
            End If
            deck.usedprgs.analyze = i
          End If
          If xtrasucc < 0 Then
            node(i).nodeanatarget = node(i).nodeanatarget + 2
            deck.usedprgs.analyze = -1
          ElseIf xtrasucc = 0 Then
            NewPad ("You just see a " & node(i).typ)
          ElseIf xtrasucc = 1 Then
            NewPad ("You see a " & node(i).typ & " " & node(i).color)
            node(i).visited = -1
          ElseIf xtrasucc >= 2 Then
            NewPad ("You see a " & node(i).typ & " " & node(i).color & "-" & Format(node(i).rating))
            node(i).visited = -2
            node(i).nodeanatarget = -1000
            If xtrasucc = 3 Then
              icenr = GetICEofNode(i, "highest")
              If icenr >= 0 Then
                NewPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
                ice(icenr).modana = -1000
              End If
            ElseIf xtrasucc >= 4 Then
              For h = 0 To node(curnode).iceactive - 1
                icenr = iceofnode(h)
                NewPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
                ice(icenr).modana = -1000
              Next h
              For h = 0 To node(curnode).icesleep - 1
                icenr = icesleepofnode(h)
                If ice(icenr).damage >= 10 Then
                  NewPad ("Destroyed ")
                ElseIf IsICEfrozen(icenr) Then
                  NewPad ("Frozen ")
                Else
                  NewPad ("Inactive ")
                End If
                AddPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
                ice(icenr).modana = -1000
              Next h
            End If
          End If
          Call RedrawPic1
        End If

    Case "BROWSE": ' scan all data files simulataneously
        If deck.range <= RANGESEN Then   ' A rulebook bug? Browse is indeed usable at Sensor range!
          If deck.usedprgs.browse <> i Then
            xtrasucc = ExecUtilTest(decker, deck, r, i, node(i).nodebrowsetarget, deck.usedprgs.browse)
            If xtrasucc < 0 Then NewPad ("Execution of Browse failed.")
          Else
            xtrasucc = SuccOppTest(MaxDD(r), node(i).rating + node(i).nodebrowsetarget + ModDeck(decker, deck), node(i).colnr, node(i).rating, UseEva(), "Browse Test")
            If xtrasucc < 0 Then NewPad ("Browse stopped working.")
          End If
          deck.usedprgs.browse = i
          If xtrasucc < 0 Then
            node(i).nodebrowsetarget = node(i).nodebrowsetarget + 2
            deck.usedprgs.browse = -1
          ElseIf xtrasucc = 0 Then
            NewPad ("You can't find the information yet.")
          ElseIf xtrasucc >= 1 Then
            NewPad ("You need " & Format(Int(10# / xtrasucc + .99)) & " turns to find the information (ask GM).")
            NewPad ("You see " & Format(node(i).nfiles) & " datafiles: ")
            For h = 1 To node(i).nfiles
              AddPad (Format(node(i).file(h).size) & "MP ")
            Next h
            node(i).nodebrowsetarget = 0
          End If

        End If
        
    Case "DECRYPT": ' defeat SCRAMBLE ICE
        If deck.range = RANGECON And icenr >= 0 Then
          If deck.usedprgs.decrypt <> i And Icesatisfaction(icenr) <> ICEYELL Then
            xtrasucc = ExecUtilTest(decker, deck, r, i, deck.moddecrypt, deck.usedprgs.decrypt)
            If xtrasucc < 0 Then NewPad ("Execution of Decrypt failed.")
          Else
            xtrasucc = 1
          End If
          If xtrasucc >= 0 Then
            deck.usedprgs.decrypt = i
            ' New complex action starts
            decker.lefthacking = decker.hackingpool
            If b$ = "SCRAMBLE" Then
              xtrasucc = SuccOppTest(MaxDD(r), node(i).rating + ModDeck(decker, deck), node(i).colnr + 1, GetIceRating(icenr), UseMask() + ModICE(icenr), "Decrypt Test")
            Else
              xtrasucc = SuccOppTest(MaxDD(r), 1000, node(i).colnr + 1, GetIceRating(icenr), UseMask() + ModICE(icenr), "Decrypt Test")
              NewPad ("Useless against this ICE-type?")
            End If
            If xtrasucc < 0 Then
              NewPad ("Decrypt failed!")
              deck.usedprgs.decrypt = -1
              If ice(icenr).satisfaction <= ICESUSP Then Call SetICEsatisfaction(icenr, ICESUSP)
            ElseIf xtrasucc = 0 Then
              NewPad ("Decrypt stalemate!")
              deck.usedprgs.decrypt = i
              deck.moddecrypt = deck.moddecrypt + 2
            ElseIf xtrasucc >= 1 Then
              NewPad ("Decrypt successful!")
              deck.usedprgs.decrypt = i
              deck.moddecrypt = 0
              Call SetICEsatisfaction(icenr, ICEDECP)
              Call ShowNode(i, False, True)
            End If
          End If
        End If

    Case "EVALUATE":   ' Scan Datastores for information of value
        If deck.range <= RANGESEN Then   ' A rulebook bug? Evaluate is indeed usable at Sensor range!
          If node(i).nfiles = 0 Then
            NewPad ("No datafiles in node.")
          Else
            xtrasucc = ExecUtilTest(decker, deck, r, i, node(i).nodeevaltarget, deck.usedprgs.evaluate)
            deck.usedprgs.evaluate = i
            If xtrasucc = 0 Then
              NewPad ("You see " & Format(node(i).nfiles) & " datafiles")
              node(i).nodeevaltarget = node(i).nodeevaltarget + 2
            ElseIf xtrasucc = 1 Then
              NewPad ("You see " & Format(node(i).nfiles) & " datafiles: ")
              For h = 1 To node(i).nfiles
                NewPad (node(i).file(h).name & " " & Format(node(i).file(h).size) & "MP ")
              Next h
              NewPad ("Cannot determine their values.")
            ElseIf xtrasucc >= 2 Then
              NewPad ("You see " & Format(node(i).nfiles) & " datafiles: ")
              For h = 1 To node(i).nfiles
                NewPad (node(i).file(h).name & " " & Format(node(i).file(h).size) & "MP/" & Format(node(i).file(h).Value) & " ")
              Next h
            Else
              NewPad ("Execution of Evaluate failed. Difficulties increase.")
              node(i).nodeevaltarget = node(i).nodeevaltarget + 2
              deck.usedprgs.evaluate = -1
            End If
          End If
        End If

    Case "SCANNER": ' detect other personas using SLEAZE
        NewPad ("No persona present!")

    Case "SIFT":    ' Speed read a data file
        NewPad ("Choose READ file SysOp in Datastore.")
    
Rem --- Masking utilities:
Rem     Deception, Relocate, Sleaze

    Case "DECEPTION":
        Rem --- ExecTest for Masking Utilities is different ---
        If deck.range <= RANGESEN And icenr >= 0 Then
          
          Rem Deception usable against Access, Probe, Scramble, Gray
          If attacked = False And Icesatisfaction(icenr) <> ICEYELL And c$ <> "BLACK" And (b$ = "ACCESS" Or b$ = "PROBE" Or b$ = "SCRAMBLE" Or c$ = "GRAY") Then
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, deck.moddeception, deck.usedprgs.deception)
          Else ' Deception not possible for other ICE
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, 1000, -1)
            NewPad ("Useless against this ICE-type?")
            xtrasucc = -1
          End If
          
          deck.modsleaze = 1000
          If xtrasucc <= -2 Then
            NewPad ("Deception failed!")
            deck.moddeception = 1000
            deck.usedprgs.deception = -1
            If ice(icenr).satisfaction <= ICESUSP Then Call SetICEsatisfaction(icenr, ICEYELL)
          ElseIf xtrasucc >= 0 Then  ' net number of succ >= colnr
            NewPad ("Deception successful!")
            deck.moddeception = -2 ' ICE is completely decepted
            Call SetICEsatisfaction(icenr, ICEDECP)
            deck.usedprgs.deception = i
            Call ShowNode(i, False, True)
          Else
            NewPad ("Deception stalemate!")
            ' each new test increases target number by +2 (S.176)
            deck.moddeception = deck.moddeception + 2
            deck.usedprgs.deception = i
          End If
        End If
    
    Case "RELOCATE": ' defeat TRACE-ICE
        If deck.range <= RANGESEN And icenr >= 0 Then
          deck.usedprgs.relocate = i
          
          If b$ = "TRACE AND REPORT" Or b$ = "TRACE AND DUMP" Or b$ = "TRACE AND BURN" Then
            ' Special execution test S.176 for Masking Utilities
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, ice(icenr).modtrace, deck.usedprgs.relocate)
          ElseIf b$ = "PROBE" Then ' PROBE gets +2 on Sleaze programs (Probe not mentioned in SR2)
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, ice(icenr).modtrace + 2, deck.usedprgs.relocate)
          Else ' don't tell the decker that his program does not work at all against other types
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, 1000, -1)
            NewPad ("Useless against this ICE-type?")
          End If
          
          If xtrasucc >= 0 And ice(icenr).tracetics > 0 Then ' net number of succ >= colnr
            NewPad ("Relocate successful!")
            NewPadGM ("Relocate in endless loop.")
            ice(icenr).tracetics = -3  ' ICE flees, but cannot attack/report
          Else
            NewPad ("Relocate failed!")
            ' each new test increases target number by +2 (S.176)
            ice(icenr).modtrace = ice(icenr).modtrace + 2
          End If
        End If

    Case "SLEAZE":
        If deck.range <= RANGESEN And icenr >= 0 Then
          ' Sleaze has no AREA effect, not against more than one target
          If Icesatisfaction(icenr) <= ICELOOK And attacked = False And b$ = "PROBE" Then ' PROBE gets +2 on Sleaze programs (Probe not mentioned in SR2)
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, deck.modsleaze + 2, deck.usedprgs.Sleaze)
          ElseIf Icesatisfaction(icenr) <= ICELOOK And attacked = False And (b$ = "ACCESS" Or b$ = "BARRIER" Or c$ = "GRAY" Or c$ = "BLACK") Then
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, deck.modsleaze, deck.usedprgs.Sleaze)
          Else ' don't tell the decker that his program does not work at all against other types
            xtrasucc = ExecMaskTest(decker, deck, r, i, icenr, 1000, -1)
            NewPad ("Useless against this ICE-type?")
            xtrasucc = -1
          End If
          
          If Icesatisfaction(icenr) >= ICESUSP Then
            NewPad ("Too late for sleazing.")
          Else
          If xtrasucc <= -2 Then
            NewPad ("Sleaze failed!")
            deck.modsleaze = 1000
            deck.usedprgs.Sleaze = -1
          ElseIf xtrasucc >= 0 Then  ' net number of succ >= colnr
            NewPad ("Sleaze successful!")
            Call SetICEsatisfaction(icenr, ICESLEA)
            deck.modsleaze = deck.modsleaze + 1 ' Resleaze with +1 per turn?
            deck.usedprgs.Sleaze = i
            Call ShowNode(i, False, True)
          Else
            NewPad ("Sleaze stalemate!")
            ' each new test increases target number by +2 (S.176)
            deck.modsleaze = deck.modsleaze + 2
            deck.usedprgs.Sleaze = i
          End If
          End If
        End If

Rem --- Operation utilities:
Rem     Auto Execute, Compressor, Controller

    Case "AUTO EXECUTE":
        If deck.usedprgs.auto_execute = 0 Then
          NewPad ("Auto Execute on.")
          deck.usedprgs.auto_execute = r
        Else
          NewPad ("Auto Execute off.")
          deck.usedprgs.auto_execute = 0
        End If

    Case "COMPRESSOR": ' Reduce size in storage mem
        NewPad ("Already using it...")

    Case "CONTROLLER" ' controls dumb frames
        NewPad ("Dumb frames not implemented yet!")

    End Select
    timetics = 1
  End If

endofexecute:
  CntIni (timetics)

End Sub

Function ExecUtilTest (decker As deckertype, deck As cyberdecktype, r%, nodenr%, ByVal addtarget%, used%) As Integer
  Rem Execution Test for normal utilities except masking based
  Dim dsucc%
  Dim osucc%
  Dim ret%

  ' Execution test S.174 for Utilities
  If addtarget < -900 Then
    ret = 4  ' mainly for analysing targets which already are analyzed successful
  Else
    If deck.usedprgs.auto_execute > 0 And node(nodenr).rating > deck.usedprgs.auto_execute Then
      addtarget = addtarget + node(nodenr).rating - deck.usedprgs.auto_execute
    End If
    If used <> nodenr And deck.usedprgs.auto_execute = 0 Then ' when program has been executed successfully, then no test necessary
      dsucc = SuccTest(MaxDD(r), node(nodenr).rating + ModDeck(decker, deck) + addtarget, node(nodenr).colnr, "Execution Test")
      osucc = SuccNumber(node(nodenr).rating, UseEva())
      If dsucc < osucc Then
        ret = -2
      ElseIf dsucc - osucc < node(nodenr).colnr Then  ' < or <=  ???
        ret = -1
      Else
        ret = dsucc - osucc - node(nodenr).colnr
      End If
    Else
      ' utility already runs
      ret = 1
    End If
  End If
  Debug.Print "ExecUtilTest xtra="; ret; "succ="; dsucc; ":"; osucc; " against "; node(nodenr).rating + ModDeck(decker, deck) + addtarget; ":"; deck.evasion
  ExecUtilTest = ret

End Function

Sub ExternMatrix (ByVal Value As Integer)
  Rem Go to external Matrix
  Rem
  Rem value = 0 -> JackOutButton pressed
  Rem       = 1 -> Trace And Dump
  Rem       = 2 -> Shutdown
  Rem       = 3 -> Satellite Uplink program deleted
  Rem Jack Out
  Dim succ%, icenr%, h%
  Dim b$, c$

  icenr = GetICEofNode(curnode, "JACKOUT")
  b$ = GetICEType(icenr, c$)
  Debug.Print "In ExternMatrix with "; Value; " ice "; b$
  If icenr < 0 Then icenr = 0  ' to prevent core dump in elseif line
  Select Case Value
    Case 0:  ' JackOut Button
      If c$ = "BLACK" Then
        ' Jacking Out while fighting with BLACK ICE
        ' (satisfaction=ICEYELL and range is already tested in GetICEofNode)
        succ = SuccTest(decker.willpower, GetIceRating(icenr) + ModDeck(decker, deck), 1, "Jacking out in presence of Black ICE")
        If succ > 0 Then
          succ = SuccNumber(decker.body, 4)
          Call DoPersDamage(decker, deck, succ, "M", -1, -1) ' resist 4M stun damage
          NewPad ("Jack out.")
          curnode = 0   ' external matrix
        Else
          NewPad ("Can't get out!! Hanging tough.")
          deck.hangtough = True
        End If
      ElseIf c$ = "GRAY" Then
        succ = SuccNumber(decker.willpower, 4 + ModDeck(decker, deck))
        If succ = 0 Then
          Call SoundPlay("PUKE", 3)
          NewPad (" Oops. Dump shock (+2) for 30 seconds. You puke on your deck.")
        Else
          Call SoundPlay("DUMP", 3)
          NewPad (" Oops. Dump Shock (+2) for " & Format(Int(30# / succ)) & " seconds.")
        End If
        curnode = 0
      Else
        NewPad ("Jack out.")
        curnode = 0
      End If


    Case 1, 2, 3:  ' Trace and Dump or Shutdown or Satuplink deleted
      succ = SuccNumber(decker.willpower, 4 + ModDeck(decker, deck))
      If succ = 0 Then
        Call SoundPlay("PUKE", 3)
        NewPad (" Oops. Dump shock (+2) for 30 seconds. You puke on your deck.")
      Else
        Call SoundPlay("DUMP", 3)
        NewPad (" Oops. Dump Shock (+2) for " & Format(Int(30# / succ)) & " seconds.")
      End If
      curnode = 0
  End Select
  
  If curnode = 0 Then
    deck.range = RANGEOBS
    RangeLabel.Caption = ""
    Exits3D1(0).Caption = ""
    Exits3D1(1).Caption = ""
    Exits3D1(2).Caption = ""
    Call ShowNode(curnode, False, False)
  End If
  
  Rem --- Show overflow damage ---
  If decker.damage_phys >= 10 Then NewPad ("PHYSICAL DAMAGE:" & Format(decker.damage_phys))

  If deck.hangtough <> True Then ' Only jack out when not hanging tough!
    
    Rem --- Show GM, that the Decker's address is reported ---
    If deck.istraced = True Or decker.damage_phys >= 10 Or decker.damage_stun >= 10 Then
      MsgBox "Tell your GM that you have finished the run and what you like to do now. Then let him/her press Okay.", MB_ICONSTOP
      Call SoundPlay("TRAC", 3)
      Call m_gamemaster_click
      NewPad ("The high response team is catching you!!!")
    End If

    If dirtyflag = True Then
      NewPadGM ("Decker should save his deck, because something has changed!")
      MsgBox "You should save your deck, because something has changed (Data files?).", MB_ICONEXCLAMATION
      m_savedeck_Click
    End If
  
    Rem --- reset tracetics to zero when JackOut (cut off tracing ICE) ---
    For icenr = 0 To icenum - 1
      ice(icenr).tracetics = 0
    Next icenr

    Rem --- istraced reseten ---
    deck.istraced = False
  End If
  
  decker.body = 0
  decker.name = ""
  decker.reaction = 0
  decker.reactdice = 0
  timetics = 1
  Call CntIni(timetics)


End Sub

Function FindICE (ByVal nodenr%, ret%, ByVal icestr$) As Integer
  Rem Search particular ICEType in iceofnode()
  Rem Output:
  Rem  ret = index of ICE in ice()
  Rem  Returns # of ICEs that fit the description icestr$
  Rem
  Dim i%, cnt%

  cnt = 0
  For i = 0 To node(nodenr).iceactive - 1
    If UCase$(StrwoBrackets(ice(iceofnode(i)).description)) = icestr$ Then
      ret = iceofnode(i)
      cnt = cnt + 1
    End If
  Next i

  FindICE = cnt
End Function

Function FitStorage (prog$, rating%, addrate%) As Integer
  Rem Tests if program fits storage in new rating and
  Rem calculates the size taken compressor into account.
  Rem addrate may be negative.
  Rem rating may be 0, then program is added to the storage list.
  Rem if prog$ = "" --> Only updating.

  Dim a$, p$, s$
  Dim i%, r%, size%, ret%

  ret = True
  If Len(prog$) > 0 Then
    If rating + addrate <= 0 Then
      Rem rating + addrate = 0  ---> Erase Program
      
      If List2.ListIndex >= 0 Then
        a$ = List2.List(List2.ListIndex)
        p$ = GetWord(a$, "-")
        If p$ = "Compressor" Then
          deck.compressed = 0
        End If
        List2.RemoveItem List2.ListIndex
      End If
  
    ElseIf rating = 0 Then
      Rem rating = 0 (and addrate > 0) ---> Add new Program
    
      size = CalcProgSize(prog$, rating + addrate)
      If UCase$(prog$) = "ANALYSE" Then prog$ = "Analyze"
      a$ = prog$ & "-" & Format(rating + addrate) & " [" & Format(size) & "Mp]"
      List2.AddItem a$

    Else
      Rem ---> Change rating of program
    
      size = CalcProgSize(prog$, rating + addrate)
      If List2.ListIndex >= 0 Then
        size = CalcProgSize(prog$, rating + addrate)
        If prog$ = "Compressor" Then
          deck.compressed = rating + addrate
        End If
        size = CalcProgSize(prog$, rating + addrate)
        a$ = prog$ & "-" & Format(rating + addrate) & " [" & Format(size) & "Mp]"
        List2.List(List2.ListIndex) = a$
      End If
    End If
  End If
  
  
  deck.storageprogmem = 0
  For i = 0 To List2.ListCount - 1
    a$ = List2.List(i)
    p$ = GetWord(a$, "-")
    r = Val(a$)
    size = CalcProgSize(p$, r)
    If p$ = "Compressor" Then
      deck.compressed = r
      s$ = Format(size)
    Else
      If deck.compressed > 0 And size <= 100 * deck.compressed Then
        s$ = Format(Int(size / 2 + .6))
      ElseIf deck.compressed > 0 Then
        NewPad ("Compressor unable to compress size of " & p$ & "-" & Format(r) & " program.")
        s$ = Format(size)
      Else
        s$ = Format(size)
      End If
    End If
    deck.storageprogmem = deck.storageprogmem + Val(s$)
    a$ = p$ & "-" & Format(r) & " [" & s$ & "Mp]"
    List2.List(i) = a$
    If deck.storageprogmem > deck.storagemem Then
      NewPad ("Storage memory exhausted by " & a$ & ".")
      ret = False
    End If
  Next i
  UpdateMemoryStatus
  FitStorage = ret

End Function

Sub Form_Load ()
  Dim i As Integer, xres As Integer, yres As Integer
  Dim crcnum As Long
  Dim fi As Integer
  Dim a As String, b As String
  Dim windir As String
  Dim version As Long
  
  logfiletrue = False
  logfilename = ""
  realtime = False
  realtimeinterval = 0
  icetime = True
  icetimeinterval = 500
  matreadonly = False
  LampACTIVE (False)
  LampPASSIVE (False)
  LampSHUTDOWN (False)
  LampUPLINK (False)
  LampICE (False)
  LampDATA (False)
  datapath$ = ""
  padclearlen = 7
  padwidth = 33
  crcnum = 125901
  icebehavior = DECEPT_ALL
  storage.FloodPercent = 0
  active.FloodPercent = 0
  nodenum = 0
  node(0).typ = "MAT"
  curnode = 0
  deck.range = RANGEOBS ' Observation
  modalert = 1#
  rangetypes(RANGECON) = "Contact"
  rangetypes(RANGESEN) = "Sensor"
  rangetypes(RANGEOBS) = "Observation"
  decker.damage_stun = 0
  decker.damage_phys = 0
  deck.damage = 0
  isdemo = True
  failedload = 0

  icetypes(0) = "Access"
  icetypes(1) = "Barrier"
  icetypes(2) = "Scramble"
  icetypes(3) = "Probe"
  icetypes(4) = "Killer"
  icetypes(5) = "Blaster"
  icetypes(6) = "Acid"
  icetypes(7) = "Binder"
  icetypes(8) = "Jammer"
  icetypes(9) = "Marker"
  icetypes(10) = "Tar Baby"
  icetypes(11) = "Tar Pit"
  icetypes(12) = "Trace and Report"
  icetypes(13) = "Trace and Dump"
  icetypes(14) = "Trace and Burn"
  
  For i = 0 To 29
    If CheckStatus(i).Value = True Then CheckStatus(i).Value = False
  Next i
  damlev(0) = 1
  damlev(1) = 3
  damlev(2) = 6
  damlev(3) = 10

  tw(0) = 0
  tw(1) = 0
  tw(2) = 1
  tw(3) = 2
  tw(4) = 3
  tw(5) = 4
  tw(6) = 5
  tw(7) = 5
  tw(8) = 6
  tw(9) = 7
  tw(10) = 8
  tw(11) = 9
  tw(12) = 10
  tw(13) = 10
  tw(14) = 11
  tw(15) = 12
  tw(16) = 13
  tw(17) = 14
  tw(18) = 15
  wt(0) = 1
  wt(1) = 2
  wt(2) = 3
  wt(3) = 4
  wt(4) = 5
  wt(5) = 7
  wt(6) = 8
  wt(7) = 9
  wt(8) = 10
  wt(9) = 11
  wt(10) = 13
  wt(11) = 14
  wt(12) = 15
  wt(13) = 16
  wt(14) = 17
  wt(15) = 19
  
  inifile$ = GetPathes()

  'Debug.Print TranslateCRC(Form4.Label1(7).Caption)
  'Stop
  a$ = Form4.Label1(7).Caption
  ' If TranslateCRC(a$) <> crcnum Then Form_Unload (0)

  xres = image1.Width \ Screen.TwipsPerPixelX
  yres = image1.Height \ Screen.TwipsPerPixelY
  If xres > 330 Or yres > 210 Then
    MsgBox "Your display seems to use a large font for Windows. Since standard widgets depend on the font size, the program's display may look weird. Select a normal font (In Win95 use the display manager, in Win3x refer to the manual of your graphic card or use a program called SetRes.)", 64
  End If
  If DeviceColors((hDC)) < 256 And DeviceColors((hDC)) > 0 Then
    MsgBox "Your display currently provides less than 256 colors. The image display would be poor. If you know that your video card *could* provide more colors (e.g. when you own a SVGA capable card), you may consult the manual of your video card and install a different video driver.", MB_ICONINFORMATION
  End If
  If TestPathes(inifile$) = False Then End
  SetPathes (inifile$)
  If waveOutGetNumDevs() <> 0 And isdemo = True And soundpath$ <> "(none)" Then
    m_soundtoggle(0).Checked = False
    m_soundtoggle(1).Checked = True
    playsound = 1
  End If
  
  Randomize
  
  ' Load Default Deck
  a$ = ReadDataIni(inifile$, "Cyberspace Program", "DefaultDeck")
  If Len(a$) > 0 Then
    On Error Resume Next
    LoadDeckWrap (a$)
  Else
    i = WritePrivateProfileString("Cyberspace Program", "DefaultDeck", "", inifile$)
  End If
  ' Load Default Decker
  a$ = ReadDataIni(inifile$, "Cyberspace Program", "DefaultDecker")
  If Len(a$) > 0 Then
    On Error Resume Next
    LoadDecker (a$)
  Else
    i = WritePrivateProfileString("Cyberspace Program", "DefaultDecker", "", inifile$)
  End If
  ' Load Default LTG
  a$ = ReadDataIni(inifile$, "Cyberspace Program", "DefaultLTG")
  If Len(a$) > 0 And isdemo = False Then
    On Error Resume Next
    LoadMatrix (a$)
  Else
    i = WritePrivateProfileString("Cyberspace Program", "DefaultLTG", "", inifile$)
  End If
  
End Sub

Sub Form_Unload (Cancel As Integer)
  Rem --- Exit the program and ask for changes ---
  Dim m%
  
  If deck.istraced = True Then
    MsgBox "Tell your GM that you have finished the run and what you like to do now. Then let him/her press Okay.", MB_ICONSTOP
    Call SoundPlay("TRAC", 3)
  End If

  If dirtyflag = True Then
    m = MsgBox("The cyberdeck has changed (Data?). Save changes?", MB_ICONQUESTION + MB_YESNOCANCEL)
    If m = IDYES Then
      m_savedeck_Click
    ElseIf m = IDCANCEL Then
      GoTo Endformunload
    End If
  End If
  If decker.damage_phys <> 0 Or decker.damage_stun <> 0 Then
    MsgBox "Stun damage: " + Format$(decker.damage_stun) + " Physical damage: " + Format$(decker.damage_phys)
  End If

  End
Endformunload:
End Sub

Sub Forward_Click ()
  Rem FORWARD
  Dim i%, icenr%, lastlink%

  timetics = 1
  Call DeckersTurn(curnode, "FORWARD")
  If decker.body <= 0 Or decker.damage_stun >= 10 Or decker.damage_phys >= 10 Then
    NewPad ("Plug in first!")
  ElseIf deck.mpcp > 0 And deck.damage < 10 Then
    If BlockedByIce("Forward") Then
      NewPad ("*ICE blocks your way.")
    Else
      If deck.range = RANGECON Then
        MoveLink ' Forward at Contact range -> Move
      Else
        If deck.range = RANGESEN And node(curnode).locked > 0 Then
          NewPad ("Node is locked.")
        Else
          ' Was Observation or Sensor
          deck.range = deck.range - 1
          RangeLabel.Caption = rangetypes(deck.range)
          Call ShowNode(curnode, True, True)
          
          ' Now Sensor or Contact
          If deck.range = RANGECON Then
            ' Show previously analyzed ICE
            datashowed = False
            For i = 0 To node(curnode).iceactive - 1
              icenr = iceofnode(i)
              If ice(icenr).modana = -1 Then
                NewPad ("You see a " & ice(icenr).code & " " & ice(icenr).description)
              ElseIf ice(icenr).modana < -900 Then
                NewPad ("You see a " & ice(icenr).code & " " & ice(icenr).description & "-" & Format(ice(icenr).rating))
              End If
            Next i
          
            ' Show Exits
            lastlink = GetLastlink(curnode, deck.lastnode)
            Exits3D1(0) = "Exit #" & Format(node(curnode).curlink)
            Exits3D1(1) = "  of   " & Format(node(curnode).nlinks)
            Exits3D1(2) = "Last #" & Format(lastlink)
          End If
          
          ' New Initiative for all ICE at deckers range (if any)
          Call ICERangeIni ' Calls GetICEofNode and calculates new Ini
          If node(curnode).iceactive > 0 Then
            decker.ini = DeckerIni(decker, deck)
            NewPad ("Decker Initiative:" & Format(decker.ini))
            For i = 0 To node(curnode).iceactive - 1
              Debug.Print "Ice"; i + 1, "Ini="; ice(iceofnode(i)).ini
            Next i
            timetics = 0   ' handle ICE, if it came first
          Else
            Debug.Print "No new Initiative!"
          End If
        
        End If
      End If
    End If
  End If
  CntIni (timetics)
End Sub

Function GetAppropICE (nodenr As Integer, range As Integer, icenr As Integer) As Integer
  Rem --- Searches appropriate ICE to deceive for this node and range ---
  Rem --- used by DoICE()
  Rem
  Rem
  Rem Rules Priority of ICE:
  Rem   1. Barrier (Sleaze)
  Rem   2. Probe
  Rem   3. Access
  Rem   4. Gray ICE (Trace...)
  Rem        (each ICE can be deceived, then all are deceived)
  Rem   5. Gray ICE (Acid|Binder|Jammer|Marker|Tar Baby|Tar Pit)
  Rem   6. Gray ICE (Killer|Blaster)
  Rem   7. Black Killer
  Rem
  
  Dim i%, curprio%

  If attacked = False Then
    curprio = GetAppropICE_prio(icenr)
    i = GetICEofNode(nodenr, "Priority")
  
    For i = 0 To node(nodenr).iceactive - 1
      If GetAppropICE_prio(iceofnode(i)) < curprio Then
        icenr = iceofnode(i)
        Exit For
      End If
    Next i
  End If
  GetAppropICE = icenr
End Function

Function GetAppropICE_prio (icenr As Integer) As Integer
  Rem Returns Priority of ICE
  Dim b$, c$
  Dim p%

  b$ = GetICEType(icenr, c$)
  Select Case b$
  Case "BARRIER": p = 1
  Case "PROBE": p = 2
  Case "ACCESS": p = 3
  Case "TRACE AND REPORT", "TRACE AND DUMP", "TRACE AND BURN": p = 4
  Case "ACID", "BINDER", "MARKER", "JAMMER", "TAR BABY", "TAR PIT": p = 5
  Case "BLASTER": p = 6
  Case "BLASTER": p = 6
                  If c$ = "BLACK" Then p = 7
  End Select
  GetAppropICE_prio = p
End Function

Function GetCPURate (nodenr%)
  Rem returns CPU-Rate of current Cluster
  Rem Kludge: Returns rate of first CPU found.
  Rem --- THIS MUST BE CHANGED IN THE FUTURE ---
  Dim cpurate%, i%

  cpurate = 0
  For i = 1 To nodenum - 1
    If UCase$(node(i).typ) = "CPU" Then
      cpurate = node(i).rating
      Exit For
    End If
  Next i
  
  GetCPURate = cpurate

End Function

Function GetDamMod (n%) As Integer
  Dim m%

  If n >= damlev(3) Then
    m = 1000
  ElseIf n >= damlev(2) Then
    m = 3
  ElseIf n >= damlev(1) Then
    m = 2
  ElseIf n >= damlev(0) Then
    m = 1
  Else
    m = 0
  End If
  GetDamMod = m

End Function

Function GetICEofNode (ByVal nodenr%, ByVal Action$) As Integer
  Rem Returns index number of ICE to deal with in this node
  Rem Input:
  Rem   nodenr = node number to ask for
  Rem   action = name of program/action to deal with the ICE.
  Rem Output:
  Rem   node(nodenr).iceactive = count of all ices found in this node.
  Rem   iceofnode(0 to iceactive-1) = indices of all active ICEs found in this node.
  Rem   sleepiceofnode(0 to icesleep-1) = sleeping ICEs of the node
  Rem   Return = ICE most urgently to deal with
  Rem
  Rem Description:
  Rem  This function finds all ICE present in this node and returns their indices.
  Rem  It tries to find that ICE-index which fits best to the action the decker
  Rem  wants to make. For example:
  Rem  action$="Decrypt","Transfer File" -> tries to find Scramble
  Rem  action$="Relocate" -> returns Trace-Ice index
  Rem  action$="Attack","Slow" -> returns single ICE or ask for multiple
  Rem  action$="Sleaze","Deception"  -> returns single ICE or ask for which
  Rem  action$="Resleaze" -> returns single ICE or ask for which
  Rem  action$="Analyze" -> returns single ICE or ask for which
  Rem  action$="JackOut" -> returns highest black ICE, if possible, or gray or Trace and Dump
  Rem  action$="None","ANALYZENODE" -> only count active and sleeping ICE in iceofnode() and icesleepofnode()
  Rem  action$="Highest" -> returns ICE with highest rating
  Rem  action$="ShowIce" -> returns highest ICE and list of all ICEs at same range as the decker
  Rem  If there are more than one ICE to deal with the same action$, then
  Rem  display a dialog.
  Rem
  Dim i%, icenr%, cnt1%, cnt2%, ret%, blkrate%, grayrate%
  Dim a$, b$

  a$ = UCase$(Trim$(StrwoBrackets(Action$)))
  ret = -1

  node(nodenr).icesleep = 0
  node(nodenr).iceactive = 0
  cnt1 = 0
  cnt2 = 0
  
  Rem -- Count active and sleeping ICE --
  Select Case a$
    Case "DECRYPT", "TRANSFER FILE", "RELOCATE", "SLEAZE", "DECEPTION", "RESLEAZE", "JACKOUT", "ATTACK", "SLOW", "SHOWICE":
      ' Count only ICE at same range as the decker
      For i = 0 To icenum - 1
        If ice(i).nodenr = nodenr And ice(i).range = deck.range Then
          If ice(i).active > alert Then
            icesleepofnode(cnt2) = i
            cnt2 = cnt2 + 1
          Else
            iceofnode(cnt1) = i
            cnt1 = cnt1 + 1
          End If
        End If
      Next i

    Case Else:
      For i = 0 To icenum - 1
        If ice(i).nodenr = nodenr And ice(i).range < RANGEOBS Then
          If ice(i).active > alert Then
            icesleepofnode(cnt2) = i
            cnt2 = cnt2 + 1
          Else
            iceofnode(cnt1) = i
            cnt1 = cnt1 + 1
          End If
        End If
      Next i
  End Select

  node(nodenr).iceactive = cnt1
  node(nodenr).icesleep = cnt2
'  Debug.Print cnt1; " ICE is node active. "; cnt2; " ICE are sleeping"
'  For i = 0 To cnt1 - 1
'    Debug.Print ice(iceofnode(i)).description & "-" & ice(iceofnode(i)).rating
'  Next i

  Rem -- How *many* suitable ICE fit this action? --
  Select Case a$
    Case "DECRYPT", "TRANSFER FILE":
      cnt2 = FindICE(nodenr, ret, "SCRAMBLE")
      If cnt2 = 1 Then ret = iceofnode(0)
    
    Case "RELOCATE":
      cnt2 = FindICE(nodenr, ret, "TRACE AND REPORT")
      cnt2 = cnt2 + FindICE(nodenr, ret, "TRACE AND DUMP")
      cnt2 = cnt2 + FindICE(nodenr, ret, "TRACE AND BURN")
      If cnt2 = 1 Then ret = iceofnode(0)
    
    Case "ATTACK", "SLOW":
      cnt2 = node(nodenr).iceactive
      If cnt2 = 1 Then ret = iceofnode(0)
      If cnt2 = 0 Then cnt2 = -1

    Case "ANALYZE":
      cnt2 = node(nodenr).iceactive
      If cnt2 = 1 Then ret = iceofnode(0)
    
    Case "SLEAZE", "DECEPTION": ' Sleaze/Deception only against one target (at same range)
      cnt2 = node(nodenr).iceactive
      If cnt2 = 1 Then ret = iceofnode(0)

    Case "RESLEAZE":
      cnt2 = 0
      ret = -1
      For i = 0 To cnt1 - 1
        icenr = iceofnode(i)
        If ice(icenr).satisfaction = ICESLEA Or ice(icenr).satisfaction = ICESLEZ Then
          cnt2 = cnt2 + 1
          ret = icenr
        End If
      Next i
      If cnt2 = 0 Then cnt2 = -1

    Case "JACKOUT":  ' How many angry Black ICE and same range?
      cnt2 = 0
      ret = -1
      blkrate = -1
      grayrate = -1
      For i = 0 To cnt1 - 1
        If ice(iceofnode(i)).range = deck.range And ice(iceofnode(i)).satisfaction = ICEYELL Then
          If UCase$(ice(iceofnode(i)).code) = "BLACK" Then
            cnt2 = cnt2 + 1
            If GetIceRating(iceofnode(i)) > blkrate Then
              blkrate = GetIceRating(iceofnode(i))
              ret = iceofnode(i)
            End If
          ElseIf UCase$(ice(iceofnode(i)).code) = "GRAY" Then
            cnt2 = cnt2 + 1
            If GetIceRating(iceofnode(i)) > grayrate And blkrate = -1 Then
              grayrate = GetIceRating(iceofnode(i))
              ret = iceofnode(i)
            End If
          End If
        End If
      Next i
      
      ' Check if JACKOUT due to Trace and Dump
      For i = 0 To icenum - 1
        If ice(i).tracetics = -2 Then
          cnt2 = 1
          ret = i
          Exit For
        End If
      Next i
      If cnt2 = 0 Then cnt2 = -1
      If cnt2 > 1 Then cnt2 = 1   ' only return highest
    
    Case "HIGHEST", "SHOWICE":  ' returns ICE with the highest rating
      cnt1 = -1
      ret = -1
      For i = 0 To node(nodenr).iceactive - 1
        If GetIceRating(iceofnode(i)) > cnt1 Then
          cnt1 = GetIceRating(iceofnode(i))  ' rating
          ret = iceofnode(i)                 ' set ICEs index
        End If
      Next i
      cnt2 = -1
    
    Case Else: ' Returns icenr of single ICE, -1 = no ICE, -2= multiple ICEs
      If cnt1 = 1 Then
        ret = iceofnode(0)
      ElseIf cnt1 > 1 Then
        ret = -2
      Else
        ret = -1
      End If
      cnt2 = -1
  End Select
      
  Rem -- When uncertain which ICE to choose, ask the user (dialog) --
  Debug.Print Format(cnt2) & " ICE found for action="; Action$
  
  If (cnt2 = 0 Or cnt2 >= 2) And node(nodenr).iceactive > 0 Then ' no or too much suitable ICE found
    If a$ = "ATTACK" Or a$ = "SLOW" Then
      Form14.Command1.Visible = True   ' Button "Attack all ICE simultaneously"
    Else
      Form14.Command1.Visible = False  ' disable Button
    End If
    Form14.icelist.Clear
    For i = 0 To node(nodenr).iceactive - 1
      b$ = GetRoughICEdescription(iceofnode(i))
      Form14.icelist.AddItem b$
    Next i
    retdata = 0    ' choose 1st ICE per default
    Form14.Caption = Action$
    Form14.Show 1
    If retdata >= 0 Then ret = iceofnode(retdata) Else ret = retdata
  Else
    If node(nodenr).iceactive <= 0 Then ret = -1
  End If
  
  'If ret >= 0 Then
  '  Debug.Print "GetICEofNode: icenr="; ret; " "; ice(ret).description; "-"; Format(ice(ret).rating)
  'Else
  '  Debug.Print "ICEpres: icenr="; ret
  'End If
  GetICEofNode = ret
End Function

Function GetICEofNodeNr (icenr%) As Integer
  Rem Returns an index for iceofnode() which points to icenr.
  Rem This function needs GetICEofNode previously executed.
  Dim i%, ret%

  ret = -1
  For i = 0 To node(curnode).iceactive - 1
    If iceofnode(i) = icenr Then
      ret = i
      Exit For
    End If
  Next i

  GetICEofNodeNr = ret
End Function

Function GetICEofNodeNrStr (icenr%) As String
  Rem Returns String describing the ICE based on previous Analyze Results
  Dim h%
  Dim a$, b$, c$

  If node(curnode).iceactive > 1 Then
    If ice(icenr).modana = -1000 Then
      b$ = GetICEType(icenr, c$)
      If c$ = "BLACK" Then
        a$ = "Black ICE"
      Else
        a$ = ice(icenr).description & " ICE"
      End If
    Else
      h = GetICEofNodeNr(icenr) + 1
      If h = 0 Then
        a$ = "ICE"
      Else
        a$ = "ICE" & Format(h)
      End If
    End If
  Else
    a$ = "ICE"
  End If

  GetICEofNodeNrStr = a$

End Function

Function GetIceRating (icenr%) As Integer
  Dim b$, c$

  b$ = GetICEType(icenr, c$)
  If c$ = "WHITE" Then
    GetIceRating = Int(modalert * ice(icenr).rating)   ' rounded down
  Else
    ' Following condition can only occur for the Blaster 0.5 attack at entry point
    ' because tracetics will be -1 for that ICE
    If b$ = "TRACE AND BURN" And ice(icenr).tracetics = -1 And deck.onuplink <> 0 Then
      GetIceRating = Int(.5 * ice(icenr).rating + .95)
    Else
      GetIceRating = Int(modalert * ice(icenr).rating) ' GRAY + BLACK * 1.5 ???
    End If
  End If

End Function

Function GetICEType (ByVal icenr%, c$) As String
  Rem Output:
  Rem  c$ = Color of ICE (WHITE/GRAY/BLACK)
  Rem  returns  ICEtype (KILLER/ACID/SCRAMBLE) without brackets
  Rem
  Dim a$, b$

  b$ = ""
  c$ = ""
  If icenr >= 0 Then
    a$ = UCase$(ice(icenr).description)
    b$ = StrwoBrackets(a$)                    ' ICEType (KILLER,...)
    c$ = UCase$(ice(icenr).code)              ' ICEColor (WHITE,...)
  Else
    b$ = ""
    c$ = ""
  End If
  GetICEType = b$

End Function

Function GetLastlink (n%, lastnode%)
  Rem Returns index of link which leads to last node
  Dim i%, m%

  m = -1
  For i = 1 To node(n).nlinks
    If node(n).link(i) = lastnode Then m = i
  Next i
  If m < 0 Then m = 1
  GetLastlink = m

End Function

Function GetRoughICEdescription (icenr%) As String
  Rem Returns a rough description of the ICE
  Dim a$
  
  a$ = GetICEofNodeNrStr(icenr)
  If UCase$(Left$(a$, 3)) = "ICE" Then  ' no successful Analyze
    Select Case UCase$(StrwoBrackets(ice(icenr).description))
      Case "ACCESS", "BARRIER":
        a$ = "guarding/blocking ICE "
      Case "SCRAMBLE":
        a$ = "Data protecting ICE"
      Case "ACID", "BINDER", "JAMMER", "MARKER", "KILLER", "BLASTER":
        a$ = "dangerous looking ICE"
      Case "TAR BABY", "TAR PIT":
        a$ = "trap like looking ICE"
      Case "PROBE", "TRACE AND REPORT", "TRACE AND DUMP", "TRACE AND BURN":
        a$ = "snuffing ICE"
      Case Else:
        a$ = "unknown ICE"
    End Select
  End If

  GetRoughICEdescription = a$
End Function

Function GetShieldMod (deck As cyberdecktype, ByVal dam%)
  Rem Returns new value for damage after shield is applied
  Dim h%, w%

  If dam > 0 Then
    If deck.usedprgs.shield = True Then
      h = dam - deck.modshield
      If h < 0 Then h = 0
      Call DegradeUtil(deck, "SHIELD")
    Else
      h = dam
    End If
  End If

  GetShieldMod = h
End Function

Sub ICE_present_Click ()
  Rem Click on "ICE present"
  
  ICEClick
End Sub

Sub IceAttacksPers (decker As deckertype, deck As cyberdecktype, nodenr%, icenr%)
  Rem Ice tries to hit the decker...
  Dim isucc%, itarget%, h%
  Dim dsucc%, dtarget%, ddices%
  Dim modburn%  ' add target for decker to defend against Trace and Burn
  Dim a$, c$, p$, basedam$, ic$
  Dim damtype%   ' 0 deck damage, 1 decker stun, 2 decker physical

  a$ = UCase$(ice(icenr).description)
  basedam$ = UCase$(Strbrackets(a$))
  p$ = UCase$(StrwoBrackets(a$))
  c$ = UCase$(ice(icenr).code)
  ic$ = GetICEofNodeNrStr(icenr)

  If c$ = "BLACK" Then
    damtype = 2   ' Black ICE makes physical damage by default
    If Left$(basedam$, 1) = "S" Then
      damtype = 1 ' Stun damage
    End If
    ' e.g. Black Probe (PhysS) or (PS) gives serious physical damage
    If Len(basedam$) > 1 Then basedam$ = Right$(basedam$, 1)
  Else
    Select Case p$
      Case "ACID": damtype = 3
      Case "BINDER": damtype = 4
      Case "MARKER": damtype = 5
      Case "JAMMER": damtype = 6
      Case Else: damtype = 0
    End Select
  End If
  
  modburn = 0
  If p$ = "TRACE AND BURN" Then
    modburn = 2 ' +2 target modifier for attacks against Trace and Burn Blaster attack at entry point
  End If
  If (p$ = "TRACE AND BURN" Or p$ = "BLASTER") And Len(basedam$) = 0 Then
    basedam$ = "M"
  End If
  If c$ = "BLACK" Then
    itarget = decker.body + ModICE(icenr)
  Else
    itarget = UseBod() + ModICE(icenr)
  End If
  isucc = SuccNumber(GetIceRating(icenr), itarget)
  Debug.Print c$; " "; a$; "-"; GetIceRating(icenr); " makes "; isucc; " successes against target "; itarget
  If modburn = 0 Then NewPad ("*" & ic$ & " hits...") Else NewPad (" Entry point attacked...")
  If isucc > 0 Then
    Select Case damtype
      Case 0: ddices = MaxDD(deck.mpcp)
              dtarget = node(nodenr).rating + ModDeck(decker, deck) + modburn
      Case 1: ddices = decker.willpower
              dtarget = GetIceRating(icenr) + ModDeck(decker, deck) + modburn
              AddPad (" stun...")
      Case 2: ddices = decker.body
              dtarget = GetIceRating(icenr) + ModDeck(decker, deck) + modburn
              AddPad (" physical...")
      Case 3, 4, 5, 6: ' ACID, BINDER, MARKER, JAMMER
              ddices = UseEva()
              dtarget = GetIceRating(icenr) + ModDeck(decker, deck)  ' Target ICERate?? or SysRate
    End Select
    If modburn = 0 Then a$ = "Avoid " & ic$ & " hit" Else a$ = "Avoid Attack at entry point"
    If deck.hangtough = True Then ddices = 0 ' hanging tough: No resistence roll!
    dsucc = SuccTest(ddices, dtarget, 1, a$)
    'Debug.Print "ddices="; ddices; " dtarget="; dtarget; " dsucc="; dsucc
    isucc = isucc - dsucc
    If isucc <= 0 Then
      Select Case damtype
        Case 0: Call SoundPlay("ARMG", 3)
        Case 1, 2: Call SoundPlay("ARMB", 3)
        Case 3: Call SoundPlay("ACIA", 3)
        Case 4: Call SoundPlay("BINA", 3)
        Case 5: Call SoundPlay("MARA", 3)
        Case 6: Call SoundPlay("JAMA", 3)
      End Select
      AddPad (" damage avoided!")
    Else
      Rem --- really do damage ---
      Call DoPersDamage(decker, deck, isucc, basedam$, damtype, icenr)
      If (p$ = "BLASTER" Or p$ = "TRACE AND BURN") And deck.damage >= 10 Then
        Rem --- try to burn MPCP chips!
        isucc = SuccNumber(GetIceRating(icenr), deck.mpcp) - deck.hardening
        If isucc > 0 Then
          If isucc > deck.oripp(4) Then isucc = deck.oripp(4)
          Call SoundPlay("BLST", 3)
          deck.oripp(4) = deck.oripp(4) - isucc
          Call RecalcAttrib(deck)
          Call UpdateDeckStatus(decker, deck)
          NewPad ("*MPCP permanently reduced by " & Format(isucc) & " points! MPCP IS NOW " & Format(deck.mpcp))
          NewPad ("Save your deck NOW!")
          NewPadGM ("Trace and Burn burned MPCP down to " & Format(deck.mpcp) & "!")
          dirtyflag = True
        Else
          Call SoundPlay("BLSA", 3) ' Blaster Attack avoided
        End If
      End If
      
    End If
  Else
    Select Case damtype
      Case 0: Call SoundPlay("SHTG", 3)
      Case 1: Call SoundPlay("SHTB", 3)
      Case 2: Call SoundPlay("SHTP", 3)
      Case 3: Call SoundPlay("ACIA", 3)
      Case 4: Call SoundPlay("BINA", 3)
      Case 5: Call SoundPlay("MARA", 3)
      Case 6: Call SoundPlay("JAMA", 3)
    End Select
    Rem --- ICE attack missed ---
    If modburn = 0 Then AddPad (" missed.") Else AddPad (" missed.")
  End If

End Sub

Sub ICEClick ()
  Rem Click on "ICE present"
  Dim a$, p$, basedam$, c$
  Dim r%
  Dim i%, h%, icenr%
  Dim nsucc%, xtrasucc%

  Call DeckersTurn(curnode, "ICEPRESENT")
  i = curnode
  If List1.ListIndex >= 0 Then
    a$ = List1.List(List1.ListIndex)
    p$ = UCase$(Left$(a$, InStr(a$, "-") - 1))
    r = Val(Mid$(a$, InStr(a$, "-") + 1))
    basedam$ = Strbrackets(p$)
    p$ = StrwoBrackets(p$)
    icenr = GetICEofNode(curnode, p$)
    If icenr >= 0 Then
      Debug.Print "ICEpres: icenr="; icenr; " "; ice(icenr).description; "-"; Format(ice(icenr).rating)
      Select Case p$
        Case "ANALYZE":
          ' 1st: Execution test (S.176)
          If ice(icenr).modana < -900 Then
            NewPad ("You already know this ICE:")
            NewPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
          Else
            h = 0
            If node(i).nodeanatarget >= -900 Then h = node(i).nodeanatarget
            If deck.usedprgs.analyze <> i Then
              ' Make 1st Execution test
              xtrasucc = ExecUtilTest(decker, deck, r, i, h, deck.usedprgs.analyze)
              If xtrasucc < 0 Then
                NewPad ("Execution of Analyze failed.")
                timetics = 1
              Else
                NewPad ("Execution of Analyze successful...")
                deck.usedprgs.analyze = i
                timetics = 1
              End If
              Call CntIni(timetics)
              ' 2nd: (another complex action)
              decker.lefthacking = decker.hackingpool ' refresh hacking pool
            Else
              xtrasucc = 1
            End If
            
            If xtrasucc >= 0 Then
              ' 2nd: (another complex action)
              ' Is there a threshold in the second test? (assuming yes: 1)
              nsucc = SuccOppTest(MaxDD(r), node(i).rating + ModDeck(decker, deck) + h, 1, GetIceRating(icenr), UseEva() + ModICE(icenr), "ICE Analyze Test")
              If nsucc = 0 Then
                NewPad (ice(icenr).code & " ICE ")
                node(i).nodeanatarget = node(i).nodeanatarget + 2
              ElseIf nsucc = 1 Then
                NewPad (ice(icenr).code & " ICE " & ice(icenr).description)
                node(i).nodeanatarget = node(i).nodeanatarget + 2
                ice(icenr).modana = -1
              ElseIf nsucc = 2 Then
                NewPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
                ice(icenr).modana = -1000
              ElseIf nsucc >= 3 Then
                For i = 0 To node(curnode).iceactive - 1
                  icenr = iceofnode(i)
                  NewPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
                  ice(icenr).modana = -1000
                Next i
                For i = 0 To node(curnode).icesleep - 1
                  icenr = icesleepofnode(i)
                  If ice(icenr).damage >= 10 Then
                    NewPad ("Destroyed ")
                  ElseIf IsICEfrozen(icenr) Then
                    NewPad ("Frozen ")
                  Else
                    NewPad ("Inactive ")
                  End If
                  AddPad (ice(icenr).code & " ICE " & ice(icenr).description & "-" & ice(icenr).rating)
                  ice(icenr).modana = -1000
                Next i
      
              Else
                NewPad ("No clear Analyze results.")
              End If
              timetics = 1
            End If
          End If

        Case "ATTACK":
          Call PersHitsIce(decker, deck, r, i, icenr, basedam$)
          UpdateDecker
          timetics = 1
          
        Case "SLOW": ' reduce ICEs initiative
          If deck.range <= RANGESEN And icenr >= 0 Then
            a$ = GetICEType(icenr, c$)
            If c$ = "WHITE" Then
              xtrasucc = SuccTest(MaxDD(r), node(i).rating + ModDeck(decker, deck), node(i).colnr + 1, "Slow Test")' White ICE has no defend ability
            ElseIf c$ = "GRAY" Or c$ = "BLACK" Then
              xtrasucc = SuccOppTest(MaxDD(r), node(i).rating + ModDeck(decker, deck), node(i).colnr + 1, GetIceRating(icenr), UseEva() + ModICE(icenr), "Slow Test")
            Else
              NewPad ("No ICE.")
            End If
            deck.moddeception = 1000
            deck.modsleaze = 1000
            deck.moddecrypt = 1000
            Call SetICEsatisfaction(icenr, ICEYELL)
            ice(icenr).succslowed = False
            attacked = True
            If xtrasucc <= 0 Then
              NewPad ("Slow missed!")
            Else  ' xtrasucc > 0 Then
              NewPad ("Slow successful!")
              ice(icenr).succslowed = True
              Call DoIceDamage(icenr, xtrasucc, "F")
            End If
          End If
          UpdateDecker
          timetics = 1
    
      End Select
    End If
  Else
    timetics = 0
  End If
  CntIni (timetics)

End Sub

Function Icefooled (icenr%) As Integer
  Dim i%, ret%

  If icenr = -1 Then      ' no ICE in node
    ret = True
  ElseIf icenr = -2 Then  ' multiple ICE in node
    ret = True
    For i = 0 To node(curnode).iceactive - 1
      If ice(i).satisfaction >= ICESUSP Or (ice(icenr).satisfaction = ICELOOK And deck.usedprgs.Sleaze <> curnode) Then
        ret = False
      End If
    Next i
  ElseIf ice(icenr).satisfaction < ICELOOK Or (ice(icenr).satisfaction = ICELOOK And deck.usedprgs.Sleaze = curnode) Then
    ret = True
  Else
    ret = False
  End If
  Icefooled = ret
End Function

Sub ICEIni (ByVal icenr%)
  Rem Determine the Initiative of ICE
  Rem Input:
  Rem  icenr = index of ICE,
  Rem  if icenr = -2 then determine Initiative for all ICE
  Rem
  Rem Blue    (no ICE)
  Rem Green   5+Rating + 1D6 - DamageModifier - FreezeModifier
  Rem Orange  7+Rating + 1D6 - DamageModifier - FreezeModifier
  Rem Red     9+Rating + 1D6 - DamageModifier - FreezeModifier
  Dim iniv%, k1%, k2%, frz%
  Dim ic$

  If icenr >= 0 Then
    k1 = icenr
    k2 = icenr
  ElseIf icenr = -2 Then
    k1 = 0
    k2 = icenum - 1
  Else
    k1 = 0
    k2 = -1
  End If
  
  iniv = -1     ' no ICE at all
  For icenr = k1 To k2
    If ice(icenr).active <= alert Then  ' ICE active?
      iniv = ice(icenr).rating + node(ice(icenr).nodenr).colnr * 2 + 1 + D6(1) - ModICE(icenr) - ice(icenr).freezemod
      If iniv <= 0 And ice(icenr).freezemod > 0 Then
        frz = ice(icenr).freezemod
        ice(icenr).freezemod = 100 ' be sure it never awakes!
        ice(icenr).satisfaction = ICEFROZ  ' set ICE as frozen
        If ice(icenr).nodenr = curnode And ice(icenr).range = deck.range Then
          ic$ = GetICEofNodeNrStr(icenr)
          Debug.Print "In ICEIni"
          NewPad ("*" & ic$ & " is frozen.")
          If frz <> 100 Then
            Call SoundPlay("FROZ", 3)
          End If
          Call ShowNode(curnode, False, True)
        End If
      End If
    Else
      iniv = -1   ' ICE not active
    End If
    ice(icenr).ini = iniv
  Next icenr

End Sub

Function ICEpictidx (icenr%, icedisplay%) As String
  Rem --- gives string part for loading advanced or sculpted reality ICE ---
  Dim i%
  Dim a$, c$, s$, hexa$

  hexa$ = "0123456789ABCDEFG"
  s$ = ""
  If icedisplay = 2 Or (icedisplay = 1 And ice(icenr).modana = -1000) Then
    a$ = GetICEType(icenr, c$)
    For i = 0 To 14
      If a$ = UCase$(icetypes(i)) Then
        s$ = Mid$(hexa$, i + 1, 1)
        Exit For
      End If
    Next i
    If c$ = "BLACK" Then
      If a$ = "PROBE" Then
        s$ = "F"        ' Black Probe  "F"
      ElseIf a$ = "KILLER" Then
        s$ = "G"   ' Black Killer "G"
      End If
    End If
    If icedisplay = 2 Then
      s$ = "r" + s$
    End If
  End If
  ICEpictidx = s$

End Function

Sub ICERangeIni ()
  Rem Determine new Initiative for all ICE at deckers range
  Dim ret%, i%

  ret = GetICEofNode(curnode, "ShowICE")
  If ret >= 0 Then
    For i = 0 To node(curnode).iceactive - 1
      ICEIni (iceofnode(i))
    Next i
  End If
End Sub

Function Icesatisfaction (icenr%) As Integer
  Rem Returns satisfaction value of single ICE or
  Rem if icenr = -2 then satisfaction status of all ICE (highest satisfaction)
  Dim h%, i%, ret%

  If icenr >= 0 Then
    ret = ice(icenr).satisfaction
  Else  ' icenr = -2 (>1 ICE) or -1 (no ICE at all)
    ret = ICEFROZ
    For i = 0 To node(curnode).iceactive - 1
      h = iceofnode(i)
      If ice(h).satisfaction > ret Then
        ret = ice(h).satisfaction
      End If
    Next i
  End If

  Icesatisfaction = ret
End Function

Sub Image1_Click ()

  ICEClick
End Sub

Sub IncreaseLink_Click ()
  Rem increase link
  Dim lastlink%

  If (deck.range = RANGECON) Then
    node(curnode).curlink = node(curnode).curlink + 1
    If node(curnode).curlink > node(curnode).nlinks Then node(curnode).curlink = 1
    lastlink = GetLastlink(curnode, deck.lastnode)
    Exits3D1(0) = "Exit #" & Format(node(curnode).curlink)
    Exits3D1(1) = "  of   " & Format(node(curnode).nlinks)
    Exits3D1(2) = "Last #" & Format(lastlink)
  End If

End Sub

Function IsDefense (p$)
  Rem Tests if program is a defense utility which runs in the deck and not in the node
  Dim a$

  a$ = UCase$(StrwoBrackets(p$))
  If a$ = "ARMOR" Or a$ = "CLOAK" Or a$ = "MEDIC" Or a$ = "MIRRORS" Or a$ = "RESTORE" Or a$ = "SHIELD" Or a$ = "SMOKE" Then
    IsDefense = True
  Else
    IsDefense = False
  End If

End Function

Function IsICEfrozen (icenr%) As Integer
  Dim ret%

  ret = False
  If ice(icenr).ini < 0 And ice(icenr).freezemod >= 100 Then
    ret = True
  End If
  IsICEfrozen = ret
End Function

Function IsSomeICEatRange (nodenr%, range%) As Integer
  Rem Tests if some ICE is at the same range as the decker.
  Rem This function relies on the previously executed GetICEofNode function
  Dim i%, ret%

  ret = False
  For i = 0 To node(nodenr).iceactive - 1
    If ice(iceofnode(i)).range = range Then
      ret = True
      Exit For
    End If
  Next i

  IsSomeICEatRange = ret
End Function

Sub Jack ()

End Sub

Sub JackOut_Click ()
  
  Call ExternMatrix(0)
End Sub

Sub LampACTIVE (Value As Integer)
  If Value Then
    Active_Alert.BackColor = RED
  Else
    Active_Alert.BackColor = LAMPGRAY
  End If
End Sub

Sub LampDATA (Value As Integer)
  If Value Then
    Data_exists.BackColor = BLUE
  Else
    Data_exists.BackColor = LAMPGRAY
  End If
End Sub

Sub LampICE (Value As Integer)
  If Value Then
    ICE_present.BackColor = CYAN
  Else
    ICE_present.BackColor = LAMPGRAY
  End If
End Sub

Sub LampPASSIVE (Value As Integer)
  If Value Then
    Passive_Alert.BackColor = &H80FF&
  Else
    Passive_Alert.BackColor = LAMPGRAY
  End If
End Sub

Sub LampPERSONA (Value As Integer)
  If Value Then
    Passive_Alert.BackColor = YELLOW
  Else
    Passive_Alert.BackColor = LAMPGRAY
  End If

End Sub

Sub LampSHUTDOWN (Value As Integer)
  If Value <> 0 Then
    Shutdown_Warning.BackColor = YELLOW
  Else
    Shutdown_Warning.BackColor = LAMPGRAY
  End If
End Sub

Sub LampUPLINK (Value As Integer)
  If Value Then
    Satellite_Uplink.BackColor = GREEN
  Else
    Satellite_Uplink.BackColor = LAMPGRAY
  End If
End Sub

Sub LoadDecker (d$)
  Dim a$
  Dim i%

  ' Call SoundPlay("PLUG", 3)
  If waveOutGetNumDevs() <> 0 And soundpath$ <> "(none)" Then i = sndPlaySound(soundpath$ + "sndplug.wav", 3)
  decker.name = ReadDataIni(d$, "Character", "Name")
  decker.body = Val(ReadDataIni(d$, "Attributes", "Body"))
  decker.strength = Val(ReadDataIni(d$, "Attributes", "Strength"))
  decker.quickness = Val(ReadDataIni(d$, "Attributes", "Quickness"))
  decker.intelligence = Val(ReadDataIni(d$, "Attributes", "Intelligence"))
  decker.willpower = Val(ReadDataIni(d$, "Attributes", "Willpower"))
  decker.charisma = Val(ReadDataIni(d$, "Attributes", "Charisma"))
  decker.damage_stun = Val(ReadDataIni(d$, "Attributes", "Stun Damage"))
  decker.damage_phys = Val(ReadDataIni(d$, "Attributes", "Phys Damage"))
  Call ShowDamageStatus(decker, deck)

  a$ = ReadDataIni(d$, "Attributes", "Reaction")
  decker.reaction = Val(a$)
  decker.reactdice = Val(Mid$(a$, InStr(a$, "+") + 1, 1))
  decker.hackingorig = Val(ReadDataIni(d$, "Dice Pools", "Hacking"))
  decker.hackingpool = decker.hackingorig
  decker.hackingallo = 0                 ' allocated hacking pool to suppress alerts
  decker.karma = Val(ReadDataIni(d$, "Dice Pools", "Karma"))
  decker.team = Val(ReadDataIni(d$, "Dice Pools", "Team"))

  skilltype = "Decking"
  i = Val(ReadDataIni(d$, "Skills", "Computer/Software/Decking"))
  If i = 0 Then
    skilltype = "Software"
    i = Val(ReadDataIni(d$, "Skills", "Computer/Software"))
    If i = 0 Then
      skilltype = "Computer"
      i = Val(ReadDataIni(d$, "Skills", "Computer"))
      If i = 0 Then
        skilltype = "None"
      End If
    End If
  End If
  decker.computer = i
  UpdateReaction
  decker.lefthacking = decker.hackingpool
  decker.spendhacking = decker.hackingpool
  Randomize
  If deck.mpcp > 0 Then
    image1.Picture = LoadPicture()
    image1.Picture = LoadPicture(imagepath$ + "mat.bmp")
  End If
  Call UpdateDecker
  decker.ini = DeckerIni(decker, deck)

End Sub

Sub LoadDeckWrap (Filename$)
    Dim i As Integer
    Dim no As Integer

    ' Call SoundPlay("BOOT", 3)
    If waveOutGetNumDevs() <> 0 And soundpath$ <> "(none)" Then i = sndPlaySound(soundpath$ + "sndboot.wav", 3)
    image1.Picture = LoadPicture()   ' clear it
    image1.Picture = LoadPicture(imagepath$ + "deckboot.bmp")
    List1.Clear
    List2.Clear
    no = LoadDeck(Filename$)
    For i = 0 To no - 1
      Addprogram (proglist$(i))
    Next i
    Form1.Caption = deck.model + " Emulator"
    m_realityfilter.Checked = False
    m_icedisp_Click (deck.displaymode)
    Form2.Label4.Caption = deck.model
    Form2.CDeckAttrib(0) = Format(deck.oripp(4)) ' original MPCP
    Form2.CDeckAttrib(1) = Format(deck.oripp(0))
    Form2.CDeckAttrib(2) = Format(deck.oripp(1))
    Form2.CDeckAttrib(3) = Format(deck.oripp(2))
    Form2.CDeckAttrib(4) = Format(deck.oripp(3))
    Form2.CDeckAttrib(5).Caption = Format(deck.load) & "/" & Format(deck.io)
    Form2.CDeckAttrib(6).Caption = Format(deck.hardening)
    Form2.CDeckAttrib(7).Caption = Format(deck.activemem) & "/" & Format(deck.storagemem)
    Form2.CDeckAttrib(8).Caption = Format(deck.response)
    Form2.CDeckAttrib(9).Caption = "None"
    If deck.satuplink <> 0 Then
      Form2.CDeckAttrib(9).Caption = "Yes"
    Else
      Form2.CDeckAttrib(9).Caption = "No"
    End If
    LampUPLINK (False)
    If deck.purecyber <> 0 Then
      Form2.CDeckAttrib(10).Caption = "Yes"
    Else
      Form2.CDeckAttrib(10).Caption = "No"
    End If
    If deck.realfilter <> 0 Then
      Form2.CDeckAttrib(11).Caption = "Yes"
    Else
      Form2.CDeckAttrib(11).Caption = "No"
    End If
    UpdateReaction
    Call UpdateDeckStatus(decker, deck)
    UpdateMemoryStatus
    If decker.body > 0 Then
      image1.Picture = LoadPicture()   ' clear it
      image1.Picture = LoadPicture(imagepath$ + "mat.bmp")
    End If

End Sub

Sub LoadProg_Click ()
  Rem LOAD Button
  Dim a$, l$, p$
  Dim r%, i%
  Dim siz As Long
  
  Call DeckersTurn(curnode, "LOAD")
  timetics = 1
  If decker.body <= 0 Or decker.damage_stun >= 10 Or decker.damage_phys >= 10 Then
    NewPad ("Plug in first!")
  Else
    If List2.ListIndex >= 0 Then
      a$ = List2.List(List2.ListIndex)
      l$ = a$
      p$ = UCase$(GetWord(a$, "-"))
      r = Val(a$)
      If deck.compressed > 0 And FindProg(List1, "COMPRESSOR") = -1 And p$ <> "COMPRESSOR" Then
        NewPad ("You must load Compressor first.")
      Else

        If (p$ = "ARMOR" And deck.usedprgs.armor = True) Or (p$ = "CLOAK" And deck.usedprgs.cloak = True) Or (p$ = "SMOKE" And deck.usedprgs.smoke = True) Then
          NewPad ("Cannot reuse this program.")
        Else
          siz = CalcProgSize(p$, r)
          Debug.Print "Size calc: "; siz
          If siz = 0 Then
            a$ = l$
            p$ = GetWord(a$, "[")
            siz = Val(a$)
            Debug.Print "Size get: "; siz
            If 50 * deck.compressed >= siz And p$ <> "COMPRESSOR" Then
              l$ = p$ & "[" & Format(2 * siz) & "Mp]"
            Else
              l$ = p$ & "[" & Format(siz) & "Mp]"
            End If
          Else
            a$ = l$
            l$ = GetWord(a$, "[")
            l$ = l$ & "[" & Format(siz) & "Mp]"
          End If
        
          timetics = Fix(siz / deck.load + .99)
          If (deck.activeprogmem + siz) <= deck.activemem Then
            NewPad ("Loading takes " & Format(timetics) & " turns")
            deck.activeprogmem = deck.activeprogmem + siz
            UpdateMemoryStatus
            List1.AddItem l$
            If p$ = "ARMOR" Then
              deck.ratearmor = r
            ElseIf p$ = "CLOAK" Then
              deck.ratecloak = r
            ElseIf p$ = "MEDIC" Then
              deck.ratemedic = r
            ElseIf p$ = "MIRRORS" Then
              deck.ratemirrors = r
            ElseIf p$ = "SMOKE" Then
              deck.ratesmoke = r
            ElseIf p$ = "SHIELD" Then
              deck.rateshield = r
            Else
              List2.RemoveItem List2.ListIndex
            End If
          Else
            timetics = 1
            NewPad ("Not enough active memory!")
          End If
        End If
      End If
    End If
  End If
  CntIni (timetics)
End Sub

Sub m_about_Click ()
  Rem "Help ABOUT"

  Form4.Show

End Sub

Sub m_chgpersona_Click ()
  Form16.Show 1
  Call UpdateDeckStatus(decker, deck)

End Sub

Sub m_deckerstat_Click ()
  Rem "Statistics Decker"

  Form3.Show

End Sub

Sub m_deckstat_Click ()
  Rem "Statistics Cyberdeck"

  Form2.Show

End Sub

Sub m_demoltg1_Click ()
  Call SolidLTG1
End Sub

Sub m_demoltg2_Click ()
  Call SolidLTG2
End Sub

Sub m_demoltg3_Click ()
  Call SolidLTG3
End Sub

Sub m_dices_Click ()
    If m_dices.Checked = True Then
      m_dices.Checked = False
    Else
      m_dices.Checked = True
    End If
End Sub

Sub m_exit_Click ()

  curnode = 0
  ExternMatrix (0)      ' save warnings and trace test
  Form_Unload (0)

End Sub

Sub m_gamemaster_click ()
  Form8.Show

End Sub

Sub m_hackpool_Click ()

  Form9.Show 1

End Sub

Sub m_icedecbeh_Click (Index As Integer)
    If Index = 0 Then
        icebehavior = DECEPT_APPROP
        NewPad ("ICE behavior mode: Must deceive appropriate only.")
        m_icedecbeh(0).Checked = True
        m_icedecbeh(1).Checked = False
    Else
        icebehavior = DECEPT_ALL
        NewPad ("ICE behavior mode: Must deceive all.")
        m_icedecbeh(0).Checked = False
        m_icedecbeh(1).Checked = True
    End If

End Sub

Sub m_icedisp_Click (Index As Integer)
  Rem --- ICE Display Menu ---

  m_icedisp(0).Checked = False
  m_icedisp(1).Checked = False
  m_icedisp(2).Checked = False
  m_icedisp(Index).Checked = True
  deck.displaymode = Index
  icedisplay = Index
  
End Sub

Sub m_icetime_Click ()
  Timer2.Enabled = False
  Timer2.Interval = 0
  icetime = False
  Form19.Show 1
  If retdata > 0 Then
    NewPad ("ICE time on with " + Format(retdata / 1000#, "0.0") + " seconds.")
    icetime = True
    m_icetime.Checked = True
    icetimeinterval = retdata
    Timer2.Enabled = True
  Else
    NewPad ("Fastest ICE reaction time.")
    m_icetime.Checked = False
  End If
  timer2elapsed = True
  icetimeinterval = retdata
End Sub

Sub m_learn_Click ()
    If Form10.Visible = False Then
      Form10.Show
    Else
      Form10.Hide
    End If
End Sub

Sub m_loaddeck_Click ()
  Rem "File Load Cyberdeck"
  Dim i As Integer
  Dim no As Integer

  On Error Resume Next
  CMDialog1.InitDir = datapath$
  CMDialog1.DialogTitle = " Load Cyberdeck Description"
  CMDialog1.Action = 1
  If Err = 0 Then
    LoadDeckWrap (CMDialog1.Filename)
  End If

End Sub

Sub m_loaddecker_Click ()
  Rem "File Load Decker"

  On Error Resume Next
  CMDialog2.InitDir = datapath$
  CMDialog2.DialogTitle = " Load Decker's Biofunctions"
  CMDialog2.Action = 1

  If Err = 0 Then
    LoadDecker (CMDialog2.Filename)
  End If

End Sub

Sub m_loadmatrix_Click ()
  Rem "File Load Matrix"

  On Error Resume Next
  CMDialog3.InitDir = datapath$
  CMDialog3.DialogTitle = " Load Matrix"
  CMDialog3.Action = 1
  On Error GoTo 0
  If Err = 0 Then
    LoadMatrix (CMDialog3.Filename)
  End If

End Sub

Sub m_logfile_Click ()
  If logfiletrue Then
    NewPad ("Logfile off.")
    m_logfile.Checked = False
    logfiletrue = False
    logfilename = ""
  Else
    On Error Resume Next
    CMDialog4.InitDir = datapath$
    CMDialog4.DialogTitle = " Choose Logfile..."
    CMDialog4.Filter = "Logfile (*.txt)|*.txt|All files (*.*)|*.*"
    CMDialog4.CancelError = True
    CMDialog4.Action = 1
    If Err = 0 Then
      logfiletrue = True
      logfilename = CMDialog4.Filename
      NewPad ("Logfile on.")
      m_logfile.Checked = True
    Else
      m_logfile.Checked = False
      logfiletrue = False
      logfilename = ""
    End If
  End If

End Sub

Sub m_matrixstat_Click ()
  
  Form8.Show
  NewPadGM (MatrixStatistic())
End Sub

Sub m_orderthisprogram_Click ()
    Form13.Show
End Sub

Sub m_privreal_Click ()
  Rem Changes the IMAGEPATH so that the user can use
  Rem different images on the fly
  Dim a$
  Dim i%

  On Error Resume Next
  CMDialog4.InitDir = imagepath$
  CMDialog4.DialogTitle = " Choose a new path for alternate ICE/node images... (Select CPU0.BMP)"
  CMDialog4.Filter = "Images (*.bmp)|*.bmp|All files (*.*)|*.*"
  CMDialog4.Action = 1
  If Err = 0 Then
    a = CMDialog4.Filename
    For i = Len(a) To 1 Step -1
      If Mid$(a, i, 1) = "\" Then
        a = Left(a, i)
        Exit For
      End If
    Next i
    If imagepath <> a Then
      NewPad ("Changed reality images.")
      imagepath = a
    End If
    i = TestPathes(inifile$)
  End If

  
End Sub

Sub m_realityfilter_click ()
  
  If deck.realfilteruse <> 0 Then
    deck.realfilteruse = 0
    Call RecalcAttrib(deck)
    m_realityfilter.Checked = False
    NewPad ("Reality filter off.")
  Else
    If deck.realfilter <> 0 Then
      deck.realfilteruse = 1
      Call RecalcAttrib(deck)
      m_realityfilter.Checked = True
      NewPad ("Reality filter on.")
      If deck.bod + deck.evasion + deck.masking + deck.sensor - deck.add(0) - deck.add(1) - deck.add(2) - deck.add(3) > 3 * (deck.mpcp) Then
        NewPad ("Rating of Persona programs higher than effective MPCP supports.")
        Form16.Show 1
      End If
    Else
      NewPad ("No reality filter present.")
    End If
  End If
  Call UpdateDeckStatus(decker, deck)
End Sub

Sub m_realtime_Click ()
  
  Timer1.Enabled = False
  Timer1.Interval = 0
  realtime = False
  Form18.Show 1
  If retdata > 0 Then
    NewPad ("Real time decking on with " + Format(retdata / 1000#, "0.0") + " seconds.")
    realtime = True
    m_realtime.Checked = True
    Timer1.Interval = retdata
    Timer1.Enabled = True
  Else
    NewPad ("Real time decking disabled.")
    m_realtime.Checked = False
  End If
  realtimeinterval = retdata
End Sub

Sub m_savedeck_Click ()
  Rem "File Save Cyberdeck"
  Dim i%, k%
  Dim a$, b$
  Dim pr0%, pr1%, pr2%, pr3%, ret%

  If dirtyflag = False Then
    ret = MsgBox("Cyberdeck unchanged. Save anyway?", MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2)
    If ret = IDNO Then GoTo endsave
  End If

  On Error Resume Next
  CMDialog1.DialogTitle = " Save Cyberdeck Description"
  CMDialog1.Action = 2

  If Err = 0 Then
    k = 0
    ReDim proglist$(List1.ListCount + List2.ListCount)
    For i = 0 To List1.ListCount - 1    ' Put active mem into array
      a$ = List1.List(i)
      b$ = UCase$(GetWord(a$, "-"))
      ' do not save degradable program from active mem
      If (b$ <> "ARMOR" And b$ <> "CLOAK" And b$ <> "SMOKE" And b$ <> "SHIELD" And b$ <> "MIRRORS" And b$ <> "MEDIC") Then
        proglist$(k) = List1.List(i)
        k = k + 1
      End If
    Next i
    For i = 0 To List2.ListCount - 1    ' Put storage mem into array
      proglist$(k) = List2.List(i)
      k = k + 1
    Next i
    Call SaveDeck(Format$(CMDialog1.Filename), k)
    ReDim proglist$(2)
  End If
endsave:


End Sub

Sub m_savedecker_Click ()
  Rem "File Save Decker"
  Dim ret%

  If decker.damage_stun = 0 And decker.damage_phys = 0 Then
    ret = MsgBox("Decker not stunned nor wounded. Save anyway?", MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)
    If ret = IDNO Then GoTo endsavedecker
  End If

  On Error Resume Next
  CMDialog2.DialogTitle = " Save Decker's Biofunctions"
  CMDialog2.Action = 2

  If Err = 0 Then
    Call SaveDecker(Format$(CMDialog2.Filename))
  End If
endsavedecker:



End Sub

Sub m_saveltg_Click ()
  Rem "File Save LTG"
  Dim ret%

  On Error Resume Next
  If matreadonly = True Then
    ret = MsgBox("Local Matrix is defined as read only. Do you really like to save it?", MB_ICONQUESTION + MB_RETRYCANCEL + MB_DEFBUTTON2)
    If ret = IDCANCEL Then GoTo endsaveltgclick
  End If
    
  CMDialog3.DialogTitle = " Save Matrix"
  CMDialog3.Action = 2

  If Err = 0 Then
    entrynode = curnode
    Call SaveLTG(Format$(CMDialog3.Filename), False)
  End If
endsaveltgclick:

End Sub

Sub m_setdeck_Click ()
  Dim i%

  i = MsgBox("Choose a default cyberdeck. Choose NO for not starting any cyberdeck on startup.", MB_ICONQUESTION + MB_YESNO)
  If i = IDYES Then
    On Error Resume Next
    CMDialog1.InitDir = datapath$
    CMDialog1.DialogTitle = " Choose Cyberdeck Description"
    CMDialog1.Action = 1
    If Err = 0 Then
      i = WritePrivateProfileString("Cyberspace Program", "DefaultDeck", CMDialog1.Filename, inifile$)
    Else
      i = WritePrivateProfileString("Cyberspace Program", "DefaultDeck", "", inifile$)
    End If
  Else
    i = WritePrivateProfileString("Cyberspace Program", "DefaultDeck", "", inifile$)
  End If
End Sub

Sub m_setdecker_Click ()
  Dim i%

  i = MsgBox("Choose a default decker. Choose NO for not loading any decker on startup.", MB_ICONQUESTION + MB_YESNO)
  If i = IDYES Then
    On Error Resume Next
    CMDialog2.InitDir = datapath$
    CMDialog2.DialogTitle = " Choose Decker Description"
    CMDialog2.Action = 1
    If Err = 0 Then
      i = WritePrivateProfileString("Cyberspace Program", "DefaultDecker", CMDialog2.Filename, inifile$)
    Else
      i = WritePrivateProfileString("Cyberspace Program", "DefaultDecker", "", inifile$)
    End If
  Else
    i = WritePrivateProfileString("Cyberspace Program", "DefaultDecker", "", inifile$)
  End If

End Sub

Sub m_setltg_Click ()
  Dim i%

  i = MsgBox("Choose a default LTG. Choose NO for not loading any Matrix on startup.", MB_ICONQUESTION + MB_YESNO)
  If i = IDYES Then
    On Error Resume Next
    CMDialog3.InitDir = datapath$
    CMDialog3.DialogTitle = " Choose Default Matrix"
    CMDialog3.Action = 1
    If Err = 0 Then
      i = WritePrivateProfileString("Cyberspace Program", "DefaultLTG", CMDialog3.Filename, inifile$)
    Else
      i = WritePrivateProfileString("Cyberspace Program", "DefaultLTG", "", inifile$)
    End If
  Else
    i = WritePrivateProfileString("Cyberspace Program", "DefaultLTG", "", inifile$)
  End If


End Sub

Sub m_showmap_Click ()
  
  Form15.Show
  RedrawPic1
End Sub

Sub m_sortby_Click (Index As Integer)
  Dim i As Integer

  If Index >= 0 And Index <= 4 Then
    sortstorage = Index
    For i = 0 To 4
      m_sortby(i).Checked = False
    Next i
    m_sortby(Index).Checked = True
    Call SortListBy(List2, Index)
  End If
End Sub

Sub m_soundtoggle_Click (Index As Integer)
  
  m_soundtoggle(0).Checked = False
  m_soundtoggle(1).Checked = False
  m_soundtoggle(Index).Checked = True
  playsound = Index

End Sub

Sub m_starthelp_Click ()
  Dim ret%
  Dim dwdata As Variant

  ret = WinHelp(Form1.hWnd, progpath$ & "cyber.hlp" & Chr$(0), &H3, dwdata)
End Sub

Sub MakeICEsatisfaction (nodenr As Integer, icenr As Integer, satisf As Integer)
  Rem --- Makes all ICE, except icenr at least suspious or yelling,
  Rem --- or reset all ICE to be deceived.
  Dim dummy As Integer
  Dim i As Integer
  Dim flag As Integer

  flag = False
  dummy = GetICEofNode(nodenr, "none")   ' update iceofnode()
  For i = 0 To node(nodenr).iceactive - 1
    If iceofnode(i) <> icenr Then
      dummy = ice(iceofnode(i)).satisfaction
      If satisf >= ICESUSP And dummy > ICEFROZ And dummy < satisf Then
        ice(iceofnode(i)).satisfaction = satisf
        flag = True
      ElseIf satisf <= ICELOOK And dummy > ICEFROZ Then
        ice(iceofnode(i)).satisfaction = satisf
        flag = True
      End If
    End If
  Next i
End Sub

Function MaxDD (r%) As Integer
    Rem Determine number dices + hacking pool used for a test
    Rem Use maximal 2*r dices, but maximal r+lefthacking, but maximal r+spendhacking
    Dim add%

    ' Debug.Print "MaxDD sh/lh/r="; decker.spendhacking; decker.lefthacking; r
    add = decker.spendhacking
    If decker.spendhacking > decker.lefthacking Then add = decker.lefthacking
    If add > r Then add = r
    decker.lefthacking = decker.lefthacking - add
    MaxDD = r + add
    ' Debug.Print "lh/add="; decker.lefthacking; add
End Function

Function ModAnalyze (n%) As Integer
  Rem Returns Modifier for Analyze of ICE or Node:
  Rem x, -1, -2 ---> x,+2, -1000
  Dim ret%

  ret = n
  If n = -1 Then ret = 2
  If n = -2 Then ret = -1000
  ModAnalyze = ret

End Function

Function ModDeck (decker As deckertype, deck As cyberdecktype) As Integer
  ModDeck = GetDamMod(deck.damage) + GetDamMod(decker.damage_stun) + GetDamMod(decker.damage_phys) + deck.modload + deck.modsmoke
End Function

Function ModICE (icenr%) As Integer
  ModICE = GetDamMod(ice(icenr).damage) + deck.modsmoke
End Function

Sub MoveICE (icenr%)
  Rem Moves ICE to another node or changes range.
  Rem ICE is already detected being active, when calling this routine.
  Rem
  Rem Algorithm:
  Rem * Frozen ICE or satisfied ICE or successfully attacked ICE do not move at all
  Rem * If ICE is in same node as the decker, change its range to RANGECON or RANGESEN,
  Rem   whatever is closer to the decker
  Rem * If ICE (not Trace) is in different node,
  Rem   + go one step closer to contact range.
  Rem   + If already at contact range, choose next node.
  Rem     - if system alert (passive or active) and ICE is only one node away
  Rem       from Deckers node, choose deckers node.
  Rem     - if in SAN, then bounce back to lastnode to avoid that the ICE leave the Cluster
  Rem     - else choose next node randomly, but avoid the last node.
  Rem * Already tracing ICE moves to the CPU
  Rem
  Rem Remark: The only way for ICE to leave its Cluster is to follow a decker though the SAN
  Rem         into another Cluster.
  Rem
  Dim i%, h%, k%, ret%
  Dim ic$

  If IsICEfrozen(icenr) Or ice(icenr).satisfaction < 0 Or ice(icenr).mobile > alert Or ice(icenr).succattacked Or ice(icenr).succslowed Then
    Exit Sub
  End If
  ic$ = GetICEofNodeNrStr(icenr)
  h = ice(icenr).nodenr
  
  If ice(icenr).tracetics <> 0 Then  ' tracing TRACE ICE flees from decker
    Select Case ice(icenr).range
      Case RANGEOBS:
        ice(icenr).range = RANGESEN
      
      Case RANGESEN:
        If node(h).locked <= 0 Then
          ice(icenr).range = RANGECON
        Else
          If curnode = h Then
            NewPad ("*Fleeing " & ic$ & " cannot enter locked node.")
          End If
        End If
      
      Case RANGECON:
        If UCase$(node(h).typ) = "CPU" Then
          ret = h                       ' TRACE already in CPU
        Else
          ret = -1
          For i = 1 To node(h).nlinks   ' TRACE searches CPU
            If UCase$(node(node(h).link(i)).typ) = "CPU" Then
              ret = node(h).link(i)
              If curnode = h And deck.range = RANGECON Then
                NewPad ("*" & ic$ & " flees through Exit " & Format(i) & ".")
              End If
              Exit For
            End If
          Next i
          If ret = -1 Then
            ret = RandomWalk(h)         ' Walk randomly when CPU not found (print leaving message there)
          End If
          
        End If
    End Select
  Else
    ' Non tracing ICE
    If curnode = ice(icenr).nodenr Then
      ' ICE in same node as the decker
      If ice(icenr).range = RANGECON And ice(icenr).satisfaction < ICELOOK Then
        ret = RandomWalk(icenr)
      Else
        If deck.range <> ice(icenr).range Then
          Select Case deck.range
            Case RANGECON:
              If node(h).locked <= 0 Then
                ice(icenr).range = ice(icenr).range - 1   ' ICE was at least in Sensor range
                If ice(icenr).range = RANGECON Then
                  NewPad ("*" & ic$ & " enters the node.")
                Else
                  NewPad ("*" & ic$ & " approaches node in sensor range.")
                End If
              Else
                If ice(icenr).range = RANGEOBS Then
                  ice(icenr).range = ice(icenr).range - 1
                  NewPad ("*" & ic$ & " approaches node in sensor range.")
                  ShowDetects (h)
                Else
                  NewPad ("*" & ic$ & " cannot enter locked node.")
                  ShowDetects (h)
                End If
              End If
              ret = ice(icenr).nodenr
      
            Case RANGESEN:
              If node(h).locked <= 0 Then
                If ice(icenr).range = RANGECON Then
                  NewPad ("*" & ic$ & " leaves the node and approaches.")
                Else  ' ICE at Observation range
                  NewPad ("*" & ic$ & " at distance enters your range.")
                End If
                ice(icenr).range = RANGESEN
              Else
                If ice(icenr).range = RANGECON Then
                  NewPad ("*" & ic$ & " cannot leave locked node.")
                Else
                  ice(icenr).range = RANGESEN
                  NewPad ("*" & ic$ & " at distance enters your range.")
                  ShowDetects (h)
                End If
              End If
              ret = ice(icenr).nodenr
            
            Case RANGEOBS:
              If ice(icenr).range = RANGESEN And node(h).locked <= 0 Then
                ice(icenr).range = ice(icenr).range - 1
                NewPad ("*Some " & ic$ & " disappears inside the node in front of you.")
              Else
                If ice(icenr).range = RANGESEN Then
                  NewPad ("*" & ic$ & " cannot enter locked node.")
                  ShowDetects (h)
                ElseIf ice(icenr).range = RANGEOBS Then
                  NewPad ("*" & ic$ & " at distance approaches sensor range.")
                  ShowDetects (h)
                  ice(icenr).range = ice(icenr).range - 1
                End If
              End If
              ret = ice(icenr).nodenr
    
          End Select
        End If
      End If
    Else
      ' ICE in different node as decker:
      ' not at contact range: come closer when node is not locked
      If ice(icenr).range > RANGECON Then
        If node(h).locked <= 0 Then
          ice(icenr).range = ice(icenr).range - 1
        End If
        ret = ice(icenr).nodenr
      Else
        ' at contact range
        ret = -1
        If alert >= ALERTACTIVE And ice(icenr).satisfaction >= ICELOOK Then
          ' under alert: Is decker in linked node? -> go for it
          For i = 1 To node(h).nlinks
            If node(h).link(i) = curnode And curnode > 0 And curnode < nodenum Then
              ret = node(h).link(i)
              ice(icenr).range = RANGEOBS
              Exit For
            End If
          Next i
        End If
        If ret = -1 Then
          ' Choose next node randomly, but avoid going back to the last node if not in SAN
          ret = RandomWalk(icenr)
        End If
        ice(icenr).lastnode = ice(icenr).nodenr
        If curnode = ret Then
          NewPad ("*New ICE approaches this node.")
          Call SetICEsatisfaction(icenr, ICELOOK)
          k = GetICEofNode(curnode, "none")
        End If
      End If
    End If
  End If
  Debug.Print ice(icenr).description & "-" & Format(ice(icenr).rating) & ":" & Format(ice(icenr).nodenr) & "->" & ret & " " & rangetypes(ice(icenr).range)
  ice(icenr).nodenr = ret
End Sub

Sub MoveLastLink ()
  Rem STEP BACK
  Dim i%

  
  If decker.body > 0 And deck.mpcp > 0 And deck.damage < 10 And decker.damage_stun < 10 And decker.damage_phys < 10 Then
    If attacked = True And node(curnode).iceactive > 0 Then
      SetPasAlert ' Active Alert when Decker moves to next
      SetPasAlert ' node while attacking (shouldn't occure)
    End If
    If (deck.range >= RANGESEN) Then
      ChgNode (curnode)
      Exits3D1(0).Caption = ""
      Exits3D1(1).Caption = ""
      Exits3D1(2).Caption = ""
      i = curnode
      curnode = deck.lastnode
      deck.lastnode = i
      i = GetICEofNode(curnode, "none")
      If node(curnode).iceactive = 0 And node(curnode).perpresent = 0 And node(curnode).locked = 0 Then
        deck.range = RANGECON  ' if free node then Contact range
      Else
        deck.range = RANGESEN  ' if ICE or PERSONA then only Sensor range
      End If
      
      RangeLabel.Caption = rangetypes(deck.range)
      If UCase$(node(curnode).typ) = "MAT" And onsatellite = True And deck.lastnode = entrynode Then
        deck.onuplink = 0     ' deactivate UPLINK when you leave satellite through entrynode
        LampUPLINK (False)
      End If
      
      Call ShowNode(curnode, True, False)

    End If
  End If

End Sub

Sub MoveLink ()
  Rem Move to next node
  Dim h As Integer

  If decker.body > 0 And deck.mpcp > 0 And deck.damage < 10 And decker.damage_stun < 10 And decker.damage_phys < 10 Then
    If attacked = True And node(curnode).iceactive > 0 Then
      SetPasAlert ' Active Alert when Decker moves to next
      SetPasAlert ' node while attacking (shouldn't occure)
    End If
  
    If BlockedByIce("Move") = True Then
      NewPad ("*ICE blocks your way.")
    Else
      If (deck.range = RANGECON) Or ((node(curnode).curlink = 1) And (curnode <> 1)) Then
        ChgNode (curnode)
        Exits3D1(0).Caption = ""
        Exits3D1(1).Caption = ""
        Exits3D1(2).Caption = ""
        deck.lastnode = curnode
        deck.range = RANGEOBS
        h = node(curnode).link(node(curnode).curlink)
        If UCase$(node(h).typ) = "MAT" And onsatellite = True And deck.lastnode = entrynode Then
          deck.onuplink = 0     ' deactivate UPLINK when you leave satellite through entrynode
          LampUPLINK (False)
        End If
        If UCase$(node(h).typ) = "LNK" Then
          h = MoveLNK(h)
          ' Save current LTG and Load New LTG
        End If
        curnode = h
        RangeLabel.Caption = rangetypes(deck.range)
        Call ShowNode(curnode, True, False)
      End If
    End If
  End If

End Sub

Function MoveLNK (nodenr As Integer) As Integer
  Rem --- When decker comes to node LNK, he connects to a new LTG, ---
  Rem --- which is loaded automatically ---
  Dim lastltg As String, loadltg As String
  Dim a As String
  Dim n As Integer
  Dim rounds As Long
  Dim i As Integer

  If matreadonly = False Then
    MsgBox "You leave the current grid. Automatic saving and loading new LTG.", MB_ICONINFORMATION + MB_OK
    Call SaveLTG(ltgfile$, False)
  Else
    MsgBox "You leave the current grid. Loading new LTG.", MB_ICONINFORMATION + MB_OK
  End If
  lastltg$ = ltgfile$
  a$ = node(nodenr).mesg
  loadltg$ = ExtractPath(ltgfile$) & GetWord(a$, " ")
  n = Val(a$)   ' Enter next matrix in this node
  rounds = roundssinceload
  Debug.Print "Loading: ", loadltg$, "Entry=", n
  Call LoadMatrix(loadltg$)
  If nodenum < 1 Then
    MsgBox "Problems loading the linked LTG. Returning to the old...", MB_ICONINFORMATION + MB_OK
    Call LoadMatrix(lastltg$)
    n = deck.lastnode
  End If
  Debug.Print "Shutdowntics ="; shutdowntics, rounds
  If shutdowntics > 0 Then
    shutdowntics = shutdowntics - rounds
    If shutdowntics <= 0 Then
      NewPad ("Matrix Grid behind this link seems to be down!")
      Call LoadMatrix(lastltg$)
      n = deck.lastnode
    End If
  End If
  If n >= 0 And n <= nodenum Then ' avoid problems with inconsistency
    entrynode = n
  End If
  nodenr = entrynode
  deck.lastnode = -1
  For i = 1 To node(n).nlinks
    If UCase$(node(node(n).link(i)).typ) = "LNK" Then
      deck.lastnode = node(n).link(i)
    End If
  Next i
  MoveLNK = nodenr
End Function

Sub NewIni ()
  Rem --- Roll new initiative and count down ---
  Dim h As Integer

  decker.ini = DeckerIni(decker, deck)
  ICEIni (-2)
  Call QuickSortICE(True)
  Call CntSmoke(deck)
  Call CountDown
  h = RedEva()
End Sub

Sub NewPadLrn (s$)
  Rem Output Learn message (no need to scroll)

  If Len(Form10.pad.Caption) > 0 Then
    If Len(s$) > 0 Then
      Form10.pad.Caption = Form10.pad.Caption & Chr$(10) & Chr$(13) & s$
    End If
  Else
    Form10.pad.Caption = s$
  End If

End Sub

Sub PersHitsIce (decker As deckertype, deck As cyberdecktype, r%, nodenr%, icenr%, basedam$)
  Dim c$
  Dim nsucc%, osucc%, xtrasucc%, ice1%, ice2%, i%

  Debug.Print "PersHitsICE icenr="; icenr; " active="; node(nodenr).iceactive
  If icenr = -1 Or node(nodenr).iceactive = 0 Then GoTo endpershitsice  ' no ICE?
  If icenr = -2 Then   ' fight against all ICE simultaneously
    ice1 = 0
    ice2 = node(nodenr).iceactive - 1
  Else
    ice1 = -1
    For i = 0 To node(nodenr).iceactive - 1
      If iceofnode(i) = icenr Then ice1 = i
    Next i
    If ice1 = -1 Then
      NewPad ("**Error: No ICE to attack.")
      GoTo endpershitsice
    End If
    ice2 = ice1
  End If
  Debug.Print "ice1,ice2="; ice1; ice2
  For i = ice1 To ice2
    icenr = iceofnode(i)
    If ice(icenr).range = deck.range Then
      nsucc = 1
      If deck.usedprgs.attack <> nodenr Then ' execution test, when ATTACK is not running
        nsucc = ExecUtilTest(decker, deck, r, nodenr, deck.modattack, deck.usedprgs.attack)
        If nsucc < 0 Then
          NewPad ("Execution... failed. Difficulties increase.")
          deck.modattack = deck.modattack + 2
          nsucc = -1
        Else
          ' attack is running
          NewPad ("Execution of Attack successful...")
          deck.usedprgs.attack = nodenr
        End If
      End If
      
      If nsucc >= 0 Then  ' when ATTACK is running
        nsucc = SuccTest(MaxDD(r), node(nodenr).rating + ModDeck(decker, deck), node(nodenr).colnr, "Attack Utility")
        c$ = UCase$(ice(icenr).code)
        If c$ = "WHITE" Or IsICEfrozen(icenr) Then ' Access, Barrier, Probe, Scramble
          osucc = 0
        ElseIf c$ = "GRAY" Or c$ = "BLACK" Then
          ' Gray: Acid, Binder, Jammer, Marker, Blaster, Killer, Tar Baby, Tar Pit, Trace & Report, Trace & Dump, Trace & Burn
          ' Black: (Probe)
          osucc = SuccNumber(GetIceRating(icenr), node(nodenr).rating)
        Else
          NewPad ("Unimplemented ICE color.")
        End If
        xtrasucc = nsucc - osucc - node(nodenr).colnr
    
        deck.moddeception = 1000
        deck.modsleaze = 1000
        deck.moddecrypt = 1000
        attacked = True
      
        Call SetICEsatisfaction(icenr, ICEYELL)
        If xtrasucc < 0 Then
          Call SoundPlay("SHTD", 3)
          NewPad ("Attack missed!")
          ice(icenr).succattacked = False
        Else  ' xtrasucc >= 0 Then
          NewPad ("Attack successful!")
          ice(icenr).succattacked = True
          Call DoIceDamage(icenr, xtrasucc, basedam$)
        End If
      End If
    
    End If ' not at same range
  Next i

endpershitsice:
End Sub

Function PosStr (a$, s$) As Integer
    Dim i%

    Rem Returns position of s$ in a$ or last position
    i = 1
    For i = 1 To Len(a$)
      If Mid$(a$, i, 1) = s Then Exit For
    Next i
    PosStr = i
End Function

Sub QSortICE (ByVal l As Integer, ByVal r As Integer)
  Rem  Quicksort Algorithm for sorting ICE's and decker's INI
  Dim last As Integer
  Dim i As Integer
  
  If (l >= r) Then GoTo endqsortice
  
  Call SwapICE(l, (l + r) \ 2)
  last = l
  For i = l + 1 To r
    If sorticeini(i) < sorticeini(l) Then
      last = last + 1
      Call SwapICE(last, i)
    End If
  Next i
  Call SwapICE(l, last)
  Call QSortICE(l, last - 1)
  Call QSortICE(last + 1, r)

endqsortice:
End Sub

Sub QuickSortICE (ByVal full As Integer)
  Rem --- Quicksort ICEini and decker.ini ---
  Dim icenr As Integer
  If full = True Then
    For icenr = 0 To icenum - 1
      iceorder(icenr) = icenr
      sorticeini(icenr) = ice(icenr).ini
    Next icenr
    ' Decker is icenr -> icenum
    iceorder(icenum) = icenum
    sorticeini(icenum) = decker.ini
  End If

  Call QSortICE(0, icenum - 1 + 1)

  'Debug.Print "----"
  'For icenr = 0 To icenum - 1 + 1
  '  Debug.Print "Qicenr="; iceorder(icenr); " Ini="; sorticeini(icenr)
  'Next icenr

End Sub

Function RandomWalk (icenr%) As Integer
  Rem Choose next node to which ICE moves randomly,
  Rem but avoid going back to last node (if possible).
  Rem Remain in SAN, when this is the birth node of the ICE
  Rem If in SAN: bounce back to lastnode to avoid leaving
  Rem current Cluster.
  Rem Avoid going to node 0 (external matrix).
  Rem Calling this function assumes that the ICE is decepted or sleazed and it is
  Rem at Contact range.
  Rem
  Rem Input: icenr = index of ICE
  Rem Output: returns number of next node
  Rem         If decker is at same range and node, print where ICE moves to.
  Rem
  Dim k%, l%, i%, nodenr%, ret%
  Dim a$

  k = 0
  nodenr = ice(icenr).nodenr
  If UCase$(node(nodenr).typ) = "SAN" And ice(icenr).lastnode <> -1 Then
    ret = ice(icenr).lastnode
  Else
    For i = 1 To node(nodenr).nlinks
      l = node(nodenr).link(i)
      ' if direction not to lastnode, nor to external matrix, nor to LNK then increase
      If l <> ice(icenr).lastnode And (l >= 1 And l <= nodenum) And UCase$(node(l).typ) <> "LNK" Then k = k + 1
    Next i
    If k = 0 Then                      ' No way out, except lastnode?
      If node(nodenr).nlinks > 0 Then
        ret = node(nodenr).link(1)     ' -> choose 1st link
      Else
        ret = ice(icenr).nodenr        ' -> no link at all: remain in this node
      End If
    Else
      k = Int((k + 0) * Rnd(1) + 1)    ' randomly
      ret = 0
      For i = 1 To k
        ret = ret + 1
        ' if direction to lastnode, or to external matrix, or to LNK then increase
        l = node(nodenr).link(i)
        If l = ice(icenr).lastnode Or l < 1 Or l > nodenum Or UCase$(node(l).typ) = "LNK" Then ret = ret + 1
      Next i
      ret = node(nodenr).link(ret)
    End If
  End If

  Rem If decker there, print out message where ICE moves to
  If curnode = nodenr And deck.range = RANGECON Then
    For i = 1 To node(nodenr).nlinks
      If node(nodenr).link(i) = ret Then
        a$ = GetRoughICEdescription(icenr)
        NewPad ("*" & a$ & " leaves node through exit " & Format(i) & ".")
        Exit For
      End If
    Next i
  End If
  If ice(icenr).nodenr <> ret Then ice(icenr).range = RANGEOBS
  
  RandomWalk = ret

End Function

Sub RealityFilterButton_Click ()
  Call m_realityfilter_click
End Sub

Sub RealTimeButton_Click ()
  m_realtime_Click
End Sub

Function RedEva () As Integer
    Rem MIRRORS' evasion reduces by 1 at every turn
    Rem (not at every usage)
    
    RedEva = deck.evasion
    deck.add(1) = deck.add(1) - 1
    If deck.add(1) < 0 Then deck.add(1) = 0
    Call UpdateDeckStatus(decker, deck)
End Function

Function RedMPCP () As Integer

  Debug.Print "THIS SHOULD NEVER HAPPEN: RedMPCP()"
  RedMPCP = 0
End Function

Sub RedrawPic1 ()
  Rem --- AutoRedraw the complete LTG ---
  Rem This routine may be used by the Cyberspace and Mated program
  Dim nodenr%, k%, i%
  Dim sclx#, scly#, cx#, cy#
           
  Rem -- Erase previously printed exit numbers --
  nodenr = deck.lastnode
  If nodenr > 0 And nodenr <= nodenum Then
    For k = 1 To node(nodenr).nlinks
      i = node(nodenr).link(k)
      If i > 0 And nodenr > 0 And (node(i).visited <> 0 Or node(nodenr).visited <> 0) Then
        sclx = Form15.Picture1.ScaleWidth / NX
        scly = Form15.Picture1.ScaleHeight / NY
        cx = .5 * sclx * (node(nodenr).xpos + node(i).xpos)
        cy = .5 * scly * (node(nodenr).ypos + node(i).ypos)
        Form15.Picture1.CurrentX = cx - .1 * sclx
        Form15.Picture1.CurrentY = cy - .2 * scly
        Form15.Picture1.ForeColor = WHITE
        Form15.Picture1.Print Format(k)
      End If
    Next k
  End If

  Rem -- Draw the links (if one of the two node was already visited) --
  For nodenr = 1 To nodenum
    For k = 1 To node(nodenr).nlinks
      i = node(nodenr).link(k)
      ' Don't draw link to external matrix
      If i > 0 And nodenr > 0 And (node(i).visited <> 0 Or node(nodenr).visited <> 0) Then
        sclx = Form15.Picture1.ScaleWidth / NX
        scly = Form15.Picture1.ScaleHeight / NY
        Form15.Picture1.Line (node(nodenr).xpos * sclx, node(nodenr).ypos * scly)-(node(i).xpos * sclx, node(i).ypos * scly), BLACK
      End If
    Next k
  Next nodenr
  
  Rem -- Draw node if it was already visited --
  For nodenr = 1 To nodenum
    If node(nodenr).visited <> 0 Then
      Call DrawNode(nodenr)
    End If
  Next nodenr
  
  Rem -- Print exit numbers of current node --
  nodenr = curnode
  For k = 1 To node(nodenr).nlinks
    i = node(nodenr).link(k)
    If i > 0 And nodenr > 0 And (node(i).visited <> 0 Or node(nodenr).visited <> 0) Then
      sclx = Form15.Picture1.ScaleWidth / NX
      scly = Form15.Picture1.ScaleHeight / NY
      cx = .5 * sclx * (node(nodenr).xpos + node(i).xpos)
      cy = .5 * scly * (node(nodenr).ypos + node(i).ypos)
      Form15.Picture1.CurrentX = cx - .1 * sclx
      Form15.Picture1.CurrentY = cy - .2 * scly
      Form15.Picture1.ForeColor = BLACK
      Form15.Picture1.Print Format(k)
    End If
  Next k

End Sub

Function RedSens () As Integer
  
  Debug.Print "THIS SHOULD NEVER HAPPEN: RedSens()"

End Function

Sub ReSleaze (decker As deckertype, deck As cyberdecktype, nodenr%)
  Rem Do a Resleaze, if necessary
  Dim k%, icenr%

  If deck.usedprgs.Sleaze = nodenr Then
    Debug.Print "Test for RESLEAZE"
    icenr = GetICEofNode(nodenr, "RESLEAZE")
    If icenr = -2 Then     ' more than one ICE
      For k = 0 To node(nodenr).iceactive - 1
        Call ReSleazeOne(decker, deck, nodenr, iceofnode(k))
      Next k
    ElseIf node(nodenr).iceactive = 1 Then  ' only one ICE
      Call ReSleazeOne(decker, deck, nodenr, icenr)
    End If
  End If

End Sub

Sub ReSleazeOne (decker As deckertype, deck As cyberdecktype, nodenr%, icenr%)
  Rem Resleaze against one ICE
  Dim h%, r%, xtrasucc%
  Dim a$, b$, c$, p$

  b$ = GetICEType(icenr, c$)
  Debug.Print "Resleazeone: "; b$
  If Icesatisfaction(icenr) = ICESLEA Or Icesatisfaction(icenr) = ICESLEZ Then
    If deck.moddeception > -2 Then
      NewPad (" Must do a resleaze...")
      h = FindProg(List1, "SLEAZE")
      If h >= 0 Then
        a$ = List1.List(h)
        p$ = GetWord(a$, "-")
        r = Val(a$)
        If b$ = "PROBE" Then  ' PROBE gets +2 on Sleaze programs (Probe not mentioned in SR2)
          xtrasucc = ExecMaskTest(decker, deck, r, nodenr, icenr, deck.modsleaze + 2, deck.usedprgs.Sleaze)
        Else
          xtrasucc = ExecMaskTest(decker, deck, r, nodenr, icenr, deck.modsleaze, deck.usedprgs.Sleaze)
        End If
        If xtrasucc >= 0 Then
          AddPad (" successful.")
          Call SetICEsatisfaction(icenr, ICESLEA)
          deck.modsleaze = deck.modsleaze + 1
        Else
          AddPad (" failed.")
        End If
      Else
        NewPad ("Sleaze program not in active mem anymore! Sleaze failed!")
      End If
    End If
  End If

End Sub

Sub RestoreProg (decker As deckertype, deck As cyberdecktype, r%)
  Rem Restores rating of damaged Persona Program
  ReDim perstr(0 To 3) As String
  Dim k%, i%, l%, succ%
  
  perstr$(0) = "Bod"
  perstr$(1) = "Evasion"
  perstr$(2) = "Masking"
  perstr$(3) = "Sensor"
  For i = 0 To 3
    Debug.Print "Restore: dam/ori/tar:"; deck.dam(i); "/"; deck.oripp(i); "/"; deck.restr(i)
  Next i

  k = 0
  l = -1
  For i = 0 To 3
    If deck.restr(i) > 0 Then
      k = k + 1
      l = i
    End If
  Next i
  If k = 0 Then
    NewPad ("No Persona Program is damaged!")
    l = -1
  End If
  If k > 1 Then
    Form12.Label1(0) = "More than one persona program has taken damage, choose the one you like to repair:"
    Form12.Show 1    ' choose Bod, Evasion, Masking or Sensor from list of buttons
    l = retdata
  End If

  succ = 0
  If l >= 0 Then
    succ = SuccTest(r, deck.restr(l), 1, "Repair " & perstr(l))
    If succ > 0 Then
      NewPad ("Repairing was successful.")
      deck.dam(l) = deck.dam(l) - succ
      If deck.dam(l) <= 0 Then
        deck.dam(l) = 0
        deck.restr(l) = 0
      End If
      Call RecalcAttrib(deck)
    Else
      NewPad ("Repairing failed.")
    End If
  End If

  Call UpdateDeckStatus(decker, deck)

End Sub

Sub SetICEsatisfaction (icenr%, Value%)
  ' This subroutine sets .satisfaction of a specific ICE
  ' to a certain value, when this is logical.
  ' It avoids setting frozen ICE to other values.
  ' In future it will take account of connected ICE, which
  ' is triggered by other ICE types.

  If icenr >= 0 Then
    If ice(icenr).satisfaction <> ICEFROZ Then
      ice(icenr).satisfaction = Value
    End If
  End If
End Sub

Sub SetPasAlert ()
  Rem Set passive alert
  Rem If already passive, then set active alert
  Dim flag As Integer
  Dim i As Integer

  flag = False
  Select Case alert
    Case ALERTNONE:
      Call SoundPlay("PASA", 3)
      StrToAlert ("Passive")
    Case ALERTPASSIVE:
      Call SoundPlay("ACTA", 3)
      StrToAlert ("Active")  ' Two time passive gives active alert
      ' Do not change an active alert
    Case Else
      ' is superfluous, but better to avoid Color changes of "orange" to gray due to bad Windows Color allocation algorithm
      StrToAlert ("Active")
  End Select

End Sub

Sub ShowDamageStatus (decker As deckertype, deck As cyberdecktype)
  Dim i%

  ' Show damage values in crossed fields
  i = deck.damage
  If i > 10 Then i = 10
  If i > 0 Then
    If CheckStatus(i - 1).Value = True Then
      CheckStatus(i - 1).Value = False
    End If
    CheckStatus(i - 1).Value = True
  Else
    If CheckStatus(0).Value = True Then
      CheckStatus(0).Value = False
    End If
  End If
  i = decker.damage_stun
  If i > 10 Then
    decker.damage_phys = decker.damage_phys + i - 10
    i = 10
    decker.damage_stun = 10
  End If
  i = i + 10
  If i > 10 Then
    If CheckStatus(i - 1).Value = True Then
      CheckStatus(i - 1).Value = False
    End If
    CheckStatus(i - 1).Value = True
  Else
    If CheckStatus(10).Value = True Then
      CheckStatus(10).Value = False
    End If
  End If
  i = decker.damage_phys
  If i > 10 Then i = 10
  i = i + 20
  If i > 20 Then
    If CheckStatus(i - 1).Value = True Then
      CheckStatus(i - 1).Value = False
    End If
    CheckStatus(i - 1).Value = True
  Else
    If CheckStatus(20).Value = True Then
      CheckStatus(20).Value = False
    End If
  End If

End Sub

Sub ShowDetects (n%)
  Dim icenr%
    
  LampDATA (False)
  LampICE (False)
  LampPERSONA (False)
  icenr = GetICEofNode(n, "AnalyzeNode")
  If (node(n).iceactive) And (deck.range < RANGEOBS) Then
    LampICE (True)
    ICE_present.Caption = Format(node(n).iceactive) & " ICE in node"
  Else
    ICE_present.Caption = "no ICE in node"
  End If

  If (node(n).perpresent) And (deck.range < RANGEOBS) Then
    LampPERSONA (True)
  End If

  If (node(n).nfiles > 0) And (deck.range < RANGEOBS) Then
    LampDATA (True)
  End If

End Sub

Sub ShowICE (n%)
  Rem --- Display ICE in Vidscreen Display ---
  Rem n = Nodenr
  
  Dim icenr%, nr%, i%
  Dim a$, c$, m$
  Dim s$                ' for special display of ICE-Types
  ReDim iceposx(0 To 4)
  ReDim iceposy(0 To 4)

  On Error Resume Next
  icenr = GetICEofNode(n, "ShowICE")
  If icenr >= 0 Then
    iceposx(0) = 136
    iceposy(0) = 30
    iceposx(1) = 72
    iceposy(1) = 40
    iceposx(3) = 8
    iceposy(3) = 64
    iceposx(2) = 200
    iceposy(2) = 40
    iceposx(4) = 264
    iceposy(4) = 64
    nr = node(n).iceactive
    If nr > 5 Then nr = 5
    For i = 0 To nr - 1
      icenr = iceofnode(i)
      a$ = GetICEType(icenr, c$)
      s$ = ICEpictidx(icenr, icedisplay)
      a$ = ""
      Select Case ice(icenr).satisfaction
        Case ICEHIT: a$ = imagepath$ + "ichit"
          
        Case ICEYELL:
          If c$ = "WHITE" Then
            a$ = imagepath$ + "icyelw"
          ElseIf c$ = "GRAY" Then
            a$ = imagepath$ + "icyelg"
          Else
            a$ = imagepath$ + "icyelb"
          End If
        Case ICESUSP: a$ = imagepath$ + "icsusp"
        Case ICELOOK: a$ = imagepath$ + "iclook"
        Case ICESLEZ: a$ = imagepath$ + "icslze"
        Case ICESLEA: a$ = imagepath$ + "icslza"
        Case ICEDECP: a$ = imagepath$ + "icdecp"
        Case ICEFROZ: a$ = imagepath$ + "icfroz"
      End Select
      Err = 0
      pictSource.Picture = LoadPicture()
      pictSource.Picture = LoadPicture(a$ & s$ & ".bmp")
      If Err Then
        If failedload < 5 Then
          failedload = failedload + 1
          If isdemo = True Then
            m$ = "Can't find picture " & a$ & s$ & ".bmp. Use Standard ICE Display, ignore this message 5 times, create your own ICE pictures or order the full version."
          Else
            m$ = "Can't find picture " & a$ & s$ & ".BMP. Use Standard ICE Display, ignore this message 5 times, if you haven't created your own ICE pictures."
          End If
          MsgBox m$, MB_ICONSTOP
        End If
        pictSource.Picture = LoadPicture(a$ & ".bmp")
      End If
      ' image1.Picture = LoadPicture("d:\cyberspc\san1.bmp")
'      Debug.Print "Showing "; i; "th ICE at "; iceposx(i), iceposy(i)
      Call TransparentBlt(image1, pictSource.Picture, iceposx(i), iceposy(i), QBColor(15))
      ' Err = UpdateColors(image1.hDC) would produce wrong colors in left upper screen
    Next i

  End If
  
End Sub

Sub ShowLearn (n%)
  Rem If Menu Learn is checked, than put help messages onto Form10

  ' If m_learn.Checked = True Then
    
  If Form10.Visible = True Then
    Form10.pad = ""    ' Clear pad
    Select Case node(n).typ
      Case "SAN":
        If deck.range = RANGEOBS Then
          NewPadLrn ("--- SYSTEM ACCESS NODE ---")
          NewPadLrn ("Load ANALYZE to analyze color and rating of this SAN and possible ICE.")
          NewPadLrn ("Load DECEPTION (leaves traces) or SLEAZE (no traces, but resleaze necessary) to pass the ICE.")
          NewPadLrn ("A CLOAK makes you invisible to ICE.")
          NewPadLrn ("Use Forward-button to go to sensor range.")
        ElseIf deck.range = RANGESEN Then
          NewPadLrn ("Execute ANALYZE to analyze color and rating of this SAN.")
          If node(n).iceactive > 0 Then
            NewPadLrn ("ANALYZE <click on vidscreen> for color, type and rating of the ICE.")
            NewPadLrn ("ICE in SANs is often ACCESS, which can be fooled by DECEPTION or temporary by SLEAZE.")
            NewPadLrn ("Use Forward-button to enter the node in contact range.")
          End If
        Else
          If node(n).iceactive > 0 Then
            NewPadLrn ("Execute your DECEPTION or SLEAZE program now!")
          End If
          NewPadLrn ("Choose System Operation SEE SYSTEM (takes no time).")
          NewPadLrn ("If you like to install a Trojan Horse, use BACK DOOR.")
          NewPadLrn ("To leave the node press Forward, when you have fooled ICE.")
          NewPadLrn ("SANs are most likely connected to a SPU.")
        End If
      
      Case "SPU":
        NewPadLrn ("--- SUB-PROCESSOR UNIT ---")
        NewPadLrn ("SPUs are sometimes guarded by ICE (any type, except Scramble).")
        NewPadLrn ("They may connect to all node types.")
        If deck.range = RANGESEN Then
          NewPadLrn ("Use your ANALYZE program now.")
        ElseIf deck.range = RANGECON Then
          If node(n).iceactive > 0 Then
            NewPadLrn ("Fool the ICE now!")
          Else
            NewPadLrn ("Choose an exit and press Forward.")
          End If
        End If

      Case "CPU":
        NewPadLrn ("--- CENTRAL PROCESSING UNIT ---")
        NewPadLrn ("A CPU is the node with the highest security rating in the current cluster. Dangerous Place.")
        NewPadLrn ("However it supports the interesting System Operations DISPLAY MAP and TELEPORT.")
        NewPadLrn ("All types of ICE may occur, except Scramble.")

      Case "IOP":
        NewPadLrn ("--- I/O-PORT ---")
        NewPadLrn ("An IOP is a dead end node.")
        NewPadLrn ("Some devices may connect to this node, e.g. a printer, terminal, or cyberdeck.")
        NewPadLrn ("Inside a corporation you may jack into such I/O-Port to enter their system without passing a SAN.")
        NewPadLrn ("Any ICE may occur.")
        If deck.range = RANGESEN Then
          NewPadLrn ("Use ANALYZE now.")
        End If

      Case "DS":
        NewPadLrn ("--- DATASTORE ---")
        NewPadLrn ("You may find valuable information in this dead end node.")
        If deck.range = RANGESEN And node(n).nfiles > 0 Then
          NewPadLrn ("Load BROWSE or EVALUATE to scan for information. SIFT speeds up reading.")
        End If
        NewPadLrn ("Load DECRYPT or DECEPTION to fool Scramble ICE often found in DS.")
        If deck.range = RANGECON Then
          NewPadLrn ("Use BROWSE or EVALUATE to scan for data.")
          If node(n).iceactive > 0 Then
            NewPadLrn ("Scramble ICE will erase files, if you fail fooling it.")
          End If
        End If

      Case "MAT":
        NewPadLrn ("--- EXTERNAL MATRIX ---")
        If decker.damage_stun >= 10 Then
          NewPadLrn ("Sleep well...")
        ElseIf decker.damage_phys >= 10 Then
          NewPadLrn ("Heal decker or plug in a new one.")
        Else
          NewPadLrn ("Choose a LTG from menu file.")
        End If

      Case "DLJ":
        NewPadLrn ("--- DATA LINE JUNCTION ---")
        NewPadLrn ("Be careful, this node type is typically guarded by ICE.")
      
      Case "CRA":
        NewPadLrn ("Deck crashed. Reboot the deck.")
          
    End Select
  End If
  
End Sub

Sub ShowMesg (nodenr%, mes%, dat%)
  Rem Show node(n).mesg and filenames and sizes of datafiles (when all ICE decepted)
  Rem mes =True : Show node message
  Rem dat =True : Show data file, if not blocked
  Dim i%
  Dim a$
  Dim b$

  If deck.range = RANGECON Then
    If Len(node(nodenr).mesg) > 0 And mes = True Then
      NewPad (node(nodenr).mesg)
    End If
    
    If datashowed = False And node(nodenr).nfiles > 0 And BlockedByIce("SHOWFILES") = False Then
      datashowed = True
      a$ = "Data files:"
      If node(nodenr).nfiles = 1 Then a$ = "Data file:"
      NewPad (a$)
      For i = 1 To node(nodenr).nfiles
        NewPad ("  " & node(nodenr).file(i).name & " [" & Format(node(nodenr).file(i).size) & " Mp]")
      Next i
    End If
  End If

End Sub

Sub ShowNode (nodenr%, mes%, dat%)
  Rem nodenr = Node number to display
  Rem mes = True: show node number and description
  Rem dat = True: show data files, if not blocked (for ShowMesg)
  Dim lastlink%
  Dim s$

  curnode = nodenr
  If node(nodenr).nlinks > 1 Then
    lastlink = GetLastlink(curnode, deck.lastnode)
    If lastlink + 1 <= node(nodenr).nlinks Then
      node(nodenr).curlink = lastlink + 1
    Else
      node(nodenr).curlink = 1
    End If
  Else
    node(nodenr).curlink = 1
  End If
  If deck.range > RANGEOBS Then deck.range = RANGEOBS
  If deck.range < RANGECON Then deck.range = RANGECON
  If onsatellite = True Then s$ = "S" Else s$ = ""
  image1.Picture = LoadPicture()
  Select Case node(nodenr).typ
    Case "CPU": image1.Picture = LoadPicture(imagepath$ + "CPU" + Format(deck.range) + s$ + ".BMP")
    Case "SPU": image1.Picture = LoadPicture(imagepath$ + "SPU" + Format(deck.range) + s$ + ".BMP")
    Case "SAN": image1.Picture = LoadPicture(imagepath$ + "SAN" + Format(deck.range) + s$ + ".BMP")
    Case "IOP": image1.Picture = LoadPicture(imagepath$ + "IOP" + Format(deck.range) + s$ + ".BMP")
    Case "DLJ": image1.Picture = LoadPicture(imagepath$ + "DLJ" + Format(deck.range) + s$ + ".BMP")
    Case "DS":  image1.Picture = LoadPicture(imagepath$ + "DS" + Format(deck.range) + s$ + ".BMP")
    Case "SM", "SN": image1.Picture = LoadPicture(imagepath$ + "SM" + Format(deck.range) + s$ + ".BMP")
    Case "MAT":
                If deck.damage < 10 Then
                  image1.Picture = LoadPicture(imagepath$ + "MAT.BMP")
                Else
                  image1.Picture = LoadPicture(imagepath$ + "CRASH.BMP")
                End If
                If isdemo Then Form4.Show
    Case "CRA": image1.Picture = LoadPicture(imagepath$ + "CRASH.BMP")
                If isdemo Then Form4.Show
  End Select
  If mes = True Then
    NewPad ("")
    Select Case node(nodenr).typ
      Case "CPU": NewPad (Format(nodenr) & ". Central Processing Unit (CPU)")
      Case "SPU": NewPad (Format(nodenr) & ". Sub-Processing Unit (SPU)")
      Case "SAN": NewPad (Format(nodenr) & ". System Access Node (SAN)")
      Case "IOP": NewPad (Format(nodenr) & ". I/O Port (IOP)")
      Case "DS":  NewPad (Format(nodenr) & ". Datastore (DS)")
      Case "SM", "SN": NewPad (Format(nodenr) & ". Slave Module (SM)")
      Case "DLJ": NewPad (Format(nodenr) & ". Dataline Junction (DLJ)")
      Case "MAT": NewPad ("External Matrix (MAT)")
      Case "CRA": NewPad ("System Error. Cyberdeck crashed.")
    End Select
  End If

  Call ShowICE(nodenr)
  If deck.range = RANGECON Then
    lastlink = GetLastlink(curnode, deck.lastnode)
    Exits3D1(0) = "Exit #" & Format(node(curnode).curlink)
    Exits3D1(1) = "  of   " & Format(node(curnode).nlinks)
    Exits3D1(2) = "Last #" & Format(lastlink)
  End If
  ShowDetects (nodenr)
  ShowOps (nodenr)
  If alert >= ALERTPASSIVE Then LampPASSIVE (True)
  Call ShowMesg(nodenr, mes, dat)
  ShowLearn (nodenr)
  If node(nodenr).visited = 0 Then node(nodenr).visited = 1
  Call RedrawPic1
End Sub

Sub ShowOps (n%)
  Dim i%

  ' clear SysOps-Panels
  For i = 0 To 4
    SysOps(i).Visible = False
  Next i
  
  If deck.range = RANGECON Then
    Select Case node(n).typ
    Case "CPU":
      SysOps(0).Caption = "&1. Cancel Alert"
      SysOps(0).Visible = True
      SysOps(1).Caption = "&2. Change Node"
      SysOps(1).Visible = True
      SysOps(2).Caption = "&3. Display Map"
      SysOps(2).Visible = True
      SysOps(3).Caption = "&4. Shutdown"
      SysOps(3).Visible = True
      SysOps(4).Caption = "&5. System Inquiry"
      SysOps(4).Visible = True
    
    Case "SAN":
      SysOps(0).Caption = "&1. Lockout" ' IOP has a different Lockout command (I call that "Disconnect Port")
      SysOps(0).Visible = True
      SysOps(1).Caption = "&2. Back Door"
      SysOps(1).Visible = True
      SysOps(2).Caption = "&3. See System"
      SysOps(2).Visible = True
    
    Case "IOP":
      SysOps(0).Caption = "&1. Display Message"
      SysOps(0).Visible = True
      SysOps(1).Caption = "&2. Disconnect Port" ' Originally called "Lockout" collides with SAN-Command
      SysOps(1).Visible = True
    
    Case "DS":
      SysOps(0).Caption = "&1. Erase File"
      SysOps(0).Visible = True
      SysOps(1).Caption = "&2. Edit File"
      SysOps(1).Visible = True
      SysOps(2).Caption = "&3. Read File"
      SysOps(2).Visible = True
      SysOps(3).Caption = "&4. Transfer File"
      SysOps(3).Visible = True
    
    Case "SM", "SN":
      SysOps(0).Caption = "&1. Control"
      SysOps(0).Visible = True
      SysOps(1).Caption = "&2. Sensor Readout"
      SysOps(1).Visible = True
    
    Case "SPU", "DLJ", "MAT", "CRA", "LNK":
      ' no sysops

    End Select
  End If
End Sub

Sub SolidLTG1 ()
  Rem Make a solid LTG for the Demo Version
  Rem nodenum and icenum are global
  Dim i%

  If waveOutGetNumDevs() <> 0 And soundpath$ <> "(none)" Then i = sndPlaySound(soundpath$ + "sndcltg.wav", 3)
  Call RememberDisable
  Form15.Picture1.Cls
  nodenum = 9
  For i = 1 To nodenum
    node(i).visited = 0
  Next i
  entrynode = 1
  icenum = 0
  onsatellite = 0
  matrixname$ = "Ultra-Chip Corporation"
  Form15.Label1.Caption = matrixname$
  Call StrToAlert("none")
  Call StrToNode(0, "MAT Green-4")
  Call StrToLinks(0, "1")
  
  Call StrToNode(1, "SAN Orange-4 4 7")
  Call StrToLinks(1, "0/2")
  icenum = StrToICE(1, icenum, "White Access-4")
  
  Call StrToNode(2, "SPU Green-3 4 6")
  Call StrToLinks(2, "1/3/4/5/8")
  
  Call StrToNode(3, "IOP Orange-5 1 6")
  Call StrToLinks(3, "2")
  icenum = StrToICE(3, icenum, "Gray Blaster-11 passive")
  node(3).mesg = "Security Display"
  
  Call StrToNode(4, "SM Green-5 1 5")
  Call StrToLinks(4, "2")
  icenum = StrToICE(4, icenum, "Gray Acid-8 ever pmobile")
  node(4).mesg = "Surveillance Camera"
  
  Call StrToNode(5, "CPU Red-4 4 4")
  Call StrToLinks(5, "2/6/7")
  icenum = StrToICE(5, icenum, "Gray Trace and Burn-7 ever immobile")
  
  Call StrToNode(6, "DS Green-5 3 2")
  Call StrToLinks(6, "5")
  Call StrToFiles(6, "Customers/40/5000 Employees/110/6000 Yakuza/30/2500")
  icenum = StrToICE(6, icenum, "White Scramble-11")
  node(6).mesg = "A snake guards the data."
  
  Call StrToNode(7, "DS Red-4 5 2")
  Call StrToLinks(7, "5")
  Call StrToFiles(7, "Chip Design/100/20000")
  icenum = StrToICE(7, icenum, "White Scramble-7")
  node(7).mesg = "A small snake guards the data."
  
  Call StrToNode(8, "SPU Orange-5 6 6")
  Call StrToLinks(8, "2/9")
  icenum = StrToICE(8, icenum, "Gray Tar Baby-7 passive immobile")
  
  Call StrToNode(9, "DS Red-4 8 6")
  Call StrToLinks(9, "8")
  Call StrToFiles(9, "Tank Design/110/50000")
  icenum = StrToICE(9, icenum, "White Scramble-6")
  icenum = StrToICE(9, icenum, "Black Probe-10 immobile active")
  
  Rem --- roll initiative for all ICEs ---
  Call ICEIni(-2)

  pad.Caption = ""
  curnode = entrynode
  deck.range = RANGEOBS ' Observation
  ChgNode (curnode)
  Call ShowNode(curnode, True, True)
  RangeLabel.Caption = rangetypes(deck.range)
  i = TestMatrix(False)

  ' TestCntIni1

End Sub

Sub SolidLTG2 ()
  Rem Make a solid LTG (Slider) for the Demo Version
  Rem nodenum and icenum are global
  Dim i%

  If waveOutGetNumDevs() <> 0 And soundpath$ <> "(none)" Then i = sndPlaySound(soundpath$ + "sndcltg.wav", 3)
  Call RememberDisable
  Form15.Picture1.Cls
  nodenum = 39
  For i = 1 To nodenum
    node(i).visited = 0
  Next i
  icenum = 0
  entrynode = 1
  onsatellite = 0
  matrixname$ = "Bloody Net"
  Form15.Label1.Caption = matrixname$
  Call StrToAlert("none")
  Call StrToNode(0, "MAT Green-4")
  Call StrToLinks(0, "1")
  
  Call StrToNode(1, "SAN Orange-4 5 7")
  Call StrToLinks(1, "0/2")
  icenum = StrToICE(1, icenum, "White Access-8")
  node(1).mesg = "Info: Bury your hopes..."
  icenum = StrToICE(1, icenum, "White Barrier-6 active")

  Call StrToNode(2, "SPU Green-4 5 6")
  Call StrToLinks(2, "1/3/4")
  icenum = StrToICE(2, icenum, "White Barrier-6 active")
  
  Call StrToNode(3, "SPU Green-4 4 5")
  icenum = StrToICE(3, icenum, "Gray Trace and Report-4 active mobile")
  Call StrToLinks(3, "5/6/2")
  icenum = StrToICE(3, icenum, "White Barrier-6 active")
  
  Call StrToNode(4, "SPU Green-5 7 6")
  Call StrToLinks(4, "20/19/2/22/21")
  node(4).mesg = "Info: E"
  icenum = StrToICE(4, icenum, "White Barrier-6 active")
  

  Call StrToNode(5, "SPU Orange-8 2 5")
  Call StrToLinks(5, "3/23/24/25/26/27/28/29/30/31")
  icenum = StrToICE(5, icenum, "White Access-6")
  node(5).mesg = "Info: Control"
  icenum = StrToICE(5, icenum, "White Barrier-6 active")

  Call StrToNode(6, "SPU Orange-6 4 3")
  Call StrToLinks(6, "3/7/13/8")
  icenum = StrToICE(6, icenum, "White Access-5")
  icenum = StrToICE(6, icenum, "White Barrier-6 active")
  icenum = StrToICE(6, icenum, "Gray Tar Pit-9 passive")

  Call StrToNode(7, "CPU Orange-8 4 2")
  Call StrToLinks(7, "6/10")
  icenum = StrToICE(7, icenum, "Black Killer (S)-8")
  icenum = StrToICE(7, icenum, "Gray Trace and Burn-10")


  Call StrToNode(8, "SM Green-5 6 4")
  Call StrToLinks(8, "6/32/33/34/35/9")
  node(8).mesg = "Info: Management"

  Call StrToNode(9, "SM Orange-4 7 4")
  Call StrToLinks(9, "37/8/36/38")
  node(9).mesg = "Info: Office machines"

  Call StrToNode(10, "SAN Orange-8 4 1")
  Call StrToLinks(10, "7/39")
  icenum = StrToICE(10, icenum, "White Barrier-8")
  icenum = StrToICE(10, icenum, "Black Killer-6 passive immobile")
  node(10).mesg = "Way of Blood"

  Call StrToNode(11, "DS Orange-6 2 1")
  Call StrToLinks(11, "12/39")
  icenum = StrToICE(11, icenum, "White Access-6")
  icenum = StrToICE(11, icenum, "White Scramble-5")
  icenum = StrToICE(11, icenum, "White Barrier-6 active")
  Call StrToFiles(11, "Production/80/80000 Chemicals/60/60000 Design/40/40000 Chips/60/60000 Robot Project/70/70000")

  Call StrToNode(12, "DS Orange-6 1 1")
  Call StrToLinks(12, "11")
  icenum = StrToICE(12, icenum, "White Scramble-5")
  icenum = StrToICE(12, icenum, "White Barrier-6 active")
  Call StrToFiles(12, "Seattle Stock/60/300000 Stock Info/50/250000 Stock Projects/70/350000 Stock Manipulation/120/600000")
  
  Call StrToNode(13, "DS Green-5 6 2")
  Call StrToLinks(13, "6/14/15")
  Call StrToFiles(13, "Bribe/50/2500 Yakuza Contacts/80/4000")
  icenum = StrToICE(13, icenum, "White Access-5")
  icenum = StrToICE(13, icenum, "White Barrier-6 active")


  Call StrToNode(14, "DS Green-5 6 1")
  Call StrToLinks(14, "13")
  Call StrToFiles(14, "Physics/40/2000 Quantum Leep/60/3000 Chemical Almanach/40/2000 Biology/70/3500 Engineering/80/4000")
  icenum = StrToICE(14, icenum, "White Barrier-6 active")

  Call StrToNode(15, "DS Green-5 7 2")
  Call StrToLinks(15, "13/16/17")
  Call StrToFiles(15, "Projects/90/9000")
  icenum = StrToICE(15, icenum, "White Barrier-6 active")

  Call StrToNode(16, "DS Green-5 7 1")
  Call StrToLinks(16, "15")
  Call StrToFiles(16, "Physics Today/20/2000 Economics/30/3000")
  icenum = StrToICE(16, icenum, "White Barrier-6 active")

  Call StrToNode(17, "DS Green-5 8 2")
  Call StrToLinks(17, "15/18")
  icenum = StrToICE(17, icenum, "White Scramble-5")
  Call StrToFiles(17, "Illegal'49/90/9000 Illegal'50/100/10000 Illegal'51/90/9000 Illegal'52/80/8000")
  icenum = StrToICE(17, icenum, "White Barrier-6 active")

  Call StrToNode(18, "DS Green-5 8 1")
  Call StrToLinks(18, "17")
  icenum = StrToICE(18, icenum, "White Scramble-5")
  Call StrToFiles(18, "Yakuza/100/50000")
  icenum = StrToICE(18, icenum, "White Barrier-6 active")
  icenum = StrToICE(18, icenum, "Gray Binder-9 passive")


  Call StrToNode(19, "SM Green-4 6 7")
  Call StrToLinks(19, "4")
  node(19).mesg = "Info: Heating Control"

  Call StrToNode(20, "SM Green-4 7 7")
  Call StrToLinks(20, "4")
  node(20).mesg = "Info: Air-conditioning"

  Call StrToNode(21, "SM Orange-4 8 7")
  Call StrToLinks(21, "4")
  node(21).mesg = "Info: Elevators"
  icenum = StrToICE(21, icenum, "Gray Acid-9 passive")


  Call StrToNode(22, "SM Orange-4 8 6")
  Call StrToLinks(22, "4")
  node(22).mesg = "Info: Doors"

  Call StrToNode(23, "SM Orange-5 3 7")
  Call StrToLinks(23, "5")
  node(23).mesg = "Info: E-Sensors"

  Call StrToNode(24, "SM Orange-5 2 7")
  Call StrToLinks(24, "5")
  node(24).mesg = "Info: Camera"

  Call StrToNode(25, "SM Orange-5 1 7")
  Call StrToLinks(25, "5")
  node(25).mesg = "Info: Radar"

  Call StrToNode(26, "SM Orange-6 1 6")
  Call StrToLinks(26, "5")
  node(26).mesg = "Info: Movement Detectors"

  Call StrToNode(27, "SM Orange-6 1 5")
  Call StrToLinks(27, "5")
  node(27).mesg = "Info: Bio Detectors"

  Call StrToNode(28, "SM Orange-7 1 4")
  Call StrToLinks(28, "5")
  node(28).mesg = "Info: Electric Fence"

  Call StrToNode(29, "SM Orange-7 1 3")
  Call StrToLinks(29, "5")
  node(29).mesg = "Info: Alarm"
  icenum = StrToICE(29, icenum, "Gray Trace and Burn-11 passive")

  Call StrToNode(30, "SM Orange-8 2 3")
  Call StrToLinks(30, "5")
  node(30).mesg = "Info: Rockets"

  Call StrToNode(31, "SM Orange-8 3 3")
  Call StrToLinks(31, "5")
  node(31).mesg = "Info: Servo Guns"
  icenum = StrToICE(31, icenum, "Gray Killer (M)-10 passive")

  Call StrToNode(32, "IOP Green-4 5 3")
  Call StrToLinks(32, "8")

  Call StrToNode(33, "IOP Green-4 6 3")
  Call StrToLinks(33, "8")
  
  Call StrToNode(34, "IOP Green-4 7 3")
  Call StrToLinks(34, "8")
  
  Call StrToNode(35, "IOP Green-4 8 3")
  Call StrToLinks(35, "8")
  
  Call StrToNode(36, "SM Green-4 8 4")
  Call StrToLinks(36, "9")
  node(36).mesg = "Please leave your LTG number - Thanks"

  Call StrToNode(37, "SM Green-4 7 5")
  Call StrToLinks(37, "9")
  
  Call StrToNode(38, "SM Green-4 8 5")
  Call StrToLinks(38, "9")

  Call StrToNode(39, "CPU Red-9 3 1")
  Call StrToLinks(39, "11/10")
  node(39).mesg = "A voice asks in a friendly tone: Have you made your legacy?"
  icenum = StrToICE(39, icenum, "White Probe-13")
  icenum = StrToICE(39, icenum, "Gray Acid-15")
  icenum = StrToICE(39, icenum, "Black Killer (D)-15")
  

  Rem --- roll initiative for all ICEs ---
  Call ICEIni(-2)

  pad.Caption = ""
  curnode = entrynode
  deck.range = RANGEOBS ' Observation
  ChgNode (curnode)
  Call ShowNode(curnode, True, True)
  RangeLabel.Caption = rangetypes(deck.range)
  i = TestMatrix(False)

End Sub

Sub SolidLTG3 ()
  Rem Make a solid LTG for the Demo Version
  Rem nodenum and icenum are global
  Dim i%

  If waveOutGetNumDevs() <> 0 And soundpath$ <> "(none)" Then i = sndPlaySound(soundpath$ + "sndcltg.wav", 3)
  Call RememberDisable
  Form15.Picture1.Cls
  nodenum = 5
  For i = 1 To nodenum
    node(i).visited = 0
  Next i
  entrynode = 2
  icenum = 0
  onsatellite = 0
  matrixname$ = "Traced Corporation Test"
  Form15.Label1.Caption = matrixname$
  Call StrToAlert("none")
  Call StrToNode(0, "MAT Green-4")
  Call StrToLinks(0, "1/2")
  
  Call StrToNode(1, "SAN Blue-2 1 6")
  Call StrToLinks(1, "0/5")
  
  Call StrToNode(2, "IOP Orange-4 1 2")
  Call StrToLinks(2, "0/5")
  icenum = StrToICE(2, icenum, "Gray Trace and Report-6 immobile ever")
  node(2).mesg = "Info: The running journalist"
  
  Call StrToNode(3, "DS Red-5 3 2")
  Call StrToLinks(3, "5")
  Call StrToFiles(3, "How to build Trace ICE/110/50000")
  icenum = StrToICE(3, icenum, "Gray Trace and Dump-6 ever")
  node(3).mesg = "Info: Dumpdidump..."
  
  Call StrToNode(4, "SM Green-3 3 4")
  Call StrToLinks(4, "5")
  icenum = StrToICE(4, icenum, "Gray Trace and Burn-9 amobile")
  node(4).mesg = "Info: Burning fire..."
  
  Call StrToNode(5, "CPU Orange-4 1 4")
  Call StrToLinks(5, "1/2/3/4")
  node(5).mesg = "Info: Prepare to get traced!"
  
  Rem --- roll initiative for all ICEs ---
  Call ICEIni(-2)

  pad.Caption = ""
  curnode = entrynode
  deck.range = RANGEOBS ' Observation
  ChgNode (curnode)
  Call ShowNode(curnode, True, True)
  RangeLabel.Caption = rangetypes(deck.range)
  i = TestMatrix(False)


End Sub

Sub StrToAlert (ByVal alertstr$)
  Rem --- Set Alert Status ---
  Rem This routine is only for global alert setting (LoadMatrix, Cancel Alert).
  Rem When ICE or failed SYSOP triggers an alert, use the routine
  Rem SetPasAlert instead (for active alert trigger use it twice).

  Select Case Left$(UCase$(alertstr$), 1)
    Case "P":
      LampPASSIVE (True)
      LampACTIVE (False)
      modalert = 1.5
      alert = ALERTPASSIVE
    Case "A":
      LampPASSIVE (True)
      LampACTIVE (True)
      modalert = 1.5
      alert = ALERTACTIVE
      decker.hackingpool = decker.hackingpool + decker.hackingallo
      decker.hackingallo = 0
    Case Else:
      LampPASSIVE (False)
      LampACTIVE (False)
      modalert = 0#
      alert = ALERTNONE
  End Select
  Rem --- Cheated Demo ? ---
  If isdemo = True And (nodenum <> 9 And nodenum <> 39 And nodenum <> 5) Then
    nodenum = 0
    ' m_exit_Click
  End If
  If shutdowntics > 0 Then
    LampSHUTDOWN (True)
  Else
    LampSHUTDOWN (False)
  End If

End Sub

Function SuccNumber (ndice%, target%) As Integer
  Rem For ICE: returns number of successes with ndice dices against target
  Dim nsucc%, v%, i%

  nsucc = 0
  For i = 0 To ndice - 1
    v = 0
reloop:
    v = v + D6(1)
    If v Mod 6 = 0 Then GoTo reloop
    If v >= target Then nsucc = nsucc + 1
  Next
  
  SuccNumber = nsucc

  Rem Rule of Ones is missing here
End Function

Function SuccOppTest (ndice%, target%, need_succ%, oppdice%, opptarget%, rollmesg$) As Integer
  Dim succ%
  Dim oppsucc%
  
  succ = SuccTest(ndice, target, need_succ, rollmesg$)
  oppsucc = SuccNumber(oppdice, opptarget)
  Debug.Print Format(succ) & " (needed " & Format(need_succ) & "):" & Format(oppsucc) & " Dices=" & Format(ndice) & "D6:" & Format(oppdice) & "D6   Targets=" & Format(target) & ":" & Format(opptarget)
  If succ < need_succ Then succ = need_succ ' because succ-need_succ shouldn't be smaller than 0
  SuccOppTest = succ - oppsucc - need_succ

End Function

Function SuccTest (ndice%, target%, need_succ%, rollmesg$) As Integer
  Rem For Decker: Returns number of successes, without substracting need_succ
  Rem If ndice = 0 --> hanging tough, no resistence
  Dim h%, i%, nsucc%, fnsucc%, v%
  Dim a$

  nsucc = 0
  dicestr$ = ""
  If ndice > 0 Then ' else hanging tough
    If m_dices.Checked = True Then
      Rem Input dices manually
      Form6.Caption = rollmesg$ & " (" & ndice & " dices)"
      h = 0
      Do
        If h > ndice Then
          MsgBox "Too much dices! Please Retry.", MB_ICONQUESTION
        End If
        If (realtime = True) Then
            Timer1.Enabled = False
        End If
        Form6.Show 1  ' modal dialog: waits until dialog is closed
        If (realtime = True) Then
            Timer1.Enabled = True
        End If
        dicestr$ = ""
        h = 0
        For i = 0 To 15
          h = h + Val(Form6.Text1(i).Text)
          Call AddDicestr(Val(Form6.Text1(i).Text), wt(i))
          If target >= 0 And target <= 18 Then   ' else subscript error
            If i >= tw(target) Then
              nsucc = nsucc + Val(Form6.Text1(i).Text)
            End If
          End If
        Next i
      Loop While h > ndice
      Call DicestrToResult
    Else
      Rem Let Computer roll the dices for you
      For i = 0 To ndice - 1
        v = 0
ruleofsix:
        v = v + D6(1)
      If v Mod 6 = 0 Then GoTo ruleofsix
        dicearr(i) = v
        Call AddDicestr(1, v)
        If v >= target Then nsucc = nsucc + 1
      Next i
      BubbleSort (ndice)
      ' Debug.Print "Dice Result sorted: "; dicestr$
    End If
  
    fnsucc = nsucc
    Rem Ask for usage of karma
    If (decker.karma > 0) Then
      a$ = "Result of " & rollmesg$ & " roll: " & Chr$(10) & Chr$(13) & dicestr$ & Chr$(10) & Chr$(13) & "Left Karma:" & Format(decker.karma) & Chr$(10) & Chr$(13) & "Do you want to use Karma?"
      If fnsucc = 0 Then a$ = "No successes. " & a$
      If MsgBox(a$, MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2, "Use Karma") = IDYES Then
        decker.karma = decker.karma - 1
        If m_dices.Checked = True Then
          Rem Input dices manually
          Form6.Caption = "Roll " & Format(ndice - fnsucc) & " dices again and input them here."
          h = 0
          Do
            If h > 2 * ndice - fnsucc Then
              MsgBox "Too much dices! Please Retry.", MB_ICONEXCLAMATION
              h = 0
            End If
            Form6.Show 1  ' modal dialog: waits until dialog is closed
            nsucc = 0
            For i = 0 To 15
              h = h + Val(Form6.Text1(i).Text)
              Call AddDicestr(Val(Form6.Text1(i).Text), wt(i))
              If target >= 0 And target <= 18 Then  ' else subscript error
                If i >= tw(target) Then
                  nsucc = nsucc + Val(Form6.Text1(i).Text)
                End If
              End If
            Next i
          Loop While h > ndice
          Call DicestrToResult
        
        Else
          Rem Let Computer roll the karma dices for you
          nsucc = fnsucc
          For i = fnsucc To 2 * ndice - fnsucc
            v = 0
ruleofsix2:
            v = v + D6(1)
            If v Mod 6 = 0 Then GoTo ruleofsix2
            dicearr(i) = v
            Call AddDicestr(1, v)
            If v >= target Then nsucc = nsucc + 1
          Next i
          BubbleSort (2 * ndice - fnsucc)
          ' Debug.Print "Dice Result sorted: "; dicestr$
        End If
      End If  ' of karma input
    End If ' no karma
  
    ' Debug.Print Format(nsucc) & " successes (needed " & Format(need_succ) & ") with " & Format(ndice) & "D6 against " & Format(target)
  End If ' not hanging tough
  SuccTest = nsucc
End Function

Sub SwapICE (ByVal i As Integer, ByVal k As Integer)
  Rem Subroutine for QSortICE()
  Dim temp As Integer

  temp = iceorder(i)
  iceorder(i) = iceorder(k)
  iceorder(k) = temp
  temp = sorticeini(i)
  sorticeini(i) = sorticeini(k)
  sorticeini(k) = temp
End Sub

Sub SysOps_Click (Index As Integer)
  Dim b$, c$, icestr$, p$, sysop$
  Dim lenscr As Single    ' factor 1 or 1.5 for transfering wo/w Scramble
  Dim siz As Long         ' len of file
  Dim sizc As Long        ' len of compressed file
  Dim cpurate%, blocked%, modscr%, sift%, icenr%, i%, target%
  Dim n%                  ' used for filenumber
  Dim nsucc%, xtrasucc%
  Dim numcpu%, numspu%, numsan%, numiop%, numds%, numsm%, numdlj%
  Dim failed%             ' number of previously failed SysOps before this one

  sysop$ = Mid$(SysOps(Index).Caption, 5)
  Call DeckersTurn(curnode, sysop$)
  icenr = GetICEofNode(curnode, sysop$)
  blocked = BlockedByIce("none")
  icestr$ = GetICEType(icenr, c$)
  If blocked = True Then
    NewPad ("Some ICE block your SysOp.")
  Else
    failed = node(curnode).failsysop  ' store number of previously failed SysOps for SoundPlay
    Select Case sysop$
      Case "Lockout":                 ' SAN (System Access Node) Operations
        cpurate = GetCPURate(curnode)
        i = MaxDD(decker.computer)
        nsucc = SuccTest(i, node(curnode).rating, node(curnode).colnr + 1, "Lockout SysOp")
        If nsucc > node(curnode).colnr Then
          If i - cpurate > 0 Then
            NewPad ("San locked (see GM log).")
            NewPadGM ("SAN locked for " & Format(i - cpurate) & " turns.")
            node(curnode).locked = i - cpurate
          Else
            NewPad ("SAN locked and immediately unlocked again.")
          End If
        Else
          NewPad ("Lockout SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1
    
      Case "Back Door":  ' SAN (System Access Node) Operations
        nsucc = SuccTest(MaxDD(decker.computer), 2 * node(curnode).rating, node(curnode).colnr + 1, "Back Door SysOp")
        If nsucc > node(curnode).colnr Then
          target = 2 + 2 * (nsucc - node(curnode).colnr)
          If target > 12 Then target = 12
          NewPad ("Back Door installed (see GM log).")
          NewPadGM ("Back Door target is " & Format(target) & ".")
        Else
          NewPad ("Back Door SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1
    
      Case "See System":  ' SAN (System Access Node) Operations
        Rem No System Operation necessary (no time delay)
        numsan = 0
        numcpu = 0
        numspu = 0
        numdlj = 0
        numds = 0
        numsm = 0
        numiop = 0
        For i = 1 To nodenum
          Select Case UCase$(node(i).typ)
            Case "SAN"
                numsan = numsan + 1
            Case "CPU"
                numcpu = numcpu + 1
            Case "SPU"
              numspu = numspu + 1
            Case "DLJ"
                numdlj = numdlj + 1
            Case "DS"
                numds = numds + 1
            Case "SM"
                numsm = numsm + 1
            Case "IOP"
                numiop = numiop + 1
          End Select
        Next i
        NewPad (Format(numsan) & " SAN (System Access Node)")
        NewPad (Format(numcpu) & " CPU (Central Processing Unit)")
        NewPad (Format(numspu) & " SPU (Slave Processor Units)")
        NewPad (Format(numsm) & " SM  (Slave Modules)")
        NewPad (Format(numds) & " DS  (Datastores)")
        NewPad (Format(numiop) & " I/O (Input/Output Ports)")
        NewPad (Format(numdlj) & " DLJ (Dataline Junctions)")
        timetics = 0

      Case "Cancel Alert":   ' CPU (Central Processor Unit) Operations
        Rem Only if no active alert is triggered
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Cancel Alert SysOp")
        
        If nsucc > node(curnode).colnr And alert = ALERTPASSIVE Then
          NewPad ("Passive Alert canceled.")
          StrToAlert ("none")
        Else
          NewPad ("Alert not canceled.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        If alert = ALERTACTIVE Then
          NewPad ("Can only cancel passive alerts!")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1

      Case "Change Node":   ' CPU (Central Processor Unit) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Teleport SysOp")
        If nsucc > node(curnode).colnr Then
          NewPad ("Teleport activated.")
          Form5.HScroll1.Max = nodenum
          Form5.Show 1 ' modal dialog: waits until dialog is closed
          
          If retdata >= 0 Then ' cascade because of case <0
            If UCase$(node(retdata).typ) = "LNK" Then
              NewPad ("This seems to be a pseudo node.")
              retdata = -1
            End If
          End If
          If retdata >= 0 Then
            curnode = retdata
            deck.lastnode = curnode  ' no last node
            deck.range = RANGECON    ' teleport as legal signal into contact range
            RangeLabel.Caption = rangetypes(deck.range)
            ChgNode (curnode)
            icenr = GetICEofNode(curnode, "none")
            For i = 0 To node(curnode).iceactive - 1
              Call SetICEsatisfaction(iceofnode(i), ICEDECP)        ' satisfy all ICE (legal signal)
            Next i
            Call ShowNode(curnode, True, True)
          Else
            NewPad ("Teleport canceled.")
          End If
        Else
          NewPad ("Teleport SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1

      Case "Display Map":   ' CPU (Central Processor Unit) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Display Map SysOp")
        If nsucc > node(curnode).colnr Then
          For i = 1 To nodenum
            node(i).visited = -2
            node(i).nodeanatarget = -1000
          Next i
          NewPad ("Display Map.")
          Form15.Show
          RedrawPic1
        Else
          NewPad ("Display Map SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1
    
      Case "Shutdown":  ' CPU (Central Processor Unit) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Shutdown SysOp")
        If nsucc <= node(curnode).colnr Then
          NewPad ("Shutdown SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        Else
          NewPad ("Shutdown successful running.")
          shutdowntics = Int(5 / (nsucc - node(curnode).colnr) + .95)
          If shutdowntics = 0 Then shutdowntics = 1
        End If
        timetics = 1

      Case "System Inquiry":  ' CPU (Central Processor Unit) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "System Inquiry SysOp")
        If nsucc <= node(curnode).colnr Then
          NewPad ("System Inquiry SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        Else
          If sysirqtics > 0 Then
            NewPad ("System Inquiry returns alert.")
            SetPasAlert
            sysirqtics = 0
            decker.hackingpool = decker.hackingpool + decker.hackingallo
            decker.hackingallo = 0
          Else
            NewPad ("System Inquiry returns okay.")
          End If
        End If
        timetics = 1
        
        

      Case "Edit File":   ' DS (Datastore) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Edit File SysOp")
        If nsucc > node(curnode).colnr Then
          NewPad ("File successful edited.")
        Else
          NewPad ("Edit File SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1
    
      Case "Erase File":  ' DS (Datastore) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Erase File SysOp")
        If nsucc > node(curnode).colnr Then
          If node(curnode).nfiles <= 0 Then
            NewPad ("No file left to erase.")
          Else
            Rem Support for file number
            n = 1
            If node(curnode).nfiles > 1 Then
              Form7.Label1.Caption = "Choose number of file to delete:"
              Form7.Show 1
              n = retdata
            End If
            If n < 1 Or n > node(curnode).nfiles Then n = 1
            NewPad ("File <" & node(curnode).file(n).name & "> " & Format(node(curnode).file(n).size) & " erased.")
            For i = n + 1 To node(curnode).nfiles
              node(curnode).file(i - 1).name = node(curnode).file(i).name
              node(curnode).file(i - 1).size = node(curnode).file(i).size
              node(curnode).file(i - 1).Value = node(curnode).file(i).Value
            Next i
            node(curnode).nfiles = node(curnode).nfiles - 1
            If node(curnode).nfiles = 0 Then LampDATA (False) ' Data exists off when no file left
          End If
        Else
          NewPad ("Erase File SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If
        timetics = 1
    
      Case "Read File":   ' DS (Datastore) Operations
        timetics = 1
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Read File SysOp")
        If nsucc > node(curnode).colnr Then
          If node(curnode).nfiles <= 0 Then
            NewPad ("No file left for reading.")
          Else
            Rem Support for file number
            NewPad ("File scan started...")
            n = 1
            If node(curnode).nfiles > 1 Then
              Form7.Label1.Caption = "Choose number of file to scan:"
              Form7.Show 1
              n = retdata
            End If
            If n < 1 Or n > node(curnode).nfiles Then n = 1
            
            i = FindProg(List1, "SIFT") ' Increase reading speed, if SIFT is present
            sift = 0
            If i >= 0 Then
              b$ = List1.List(i)
              p$ = GetWord(b$, "-")
              sift = Val(b$)
              AddPad ("Use Sift...")
              xtrasucc = ExecUtilTest(decker, deck, sift, curnode, node(curnode).nodesifttarget, deck.usedprgs.sift)
              If xtrasucc < 0 Then
                NewPad ("Execution of Sift failed.")
                node(curnode).nodesifttarget = node(curnode).nodesifttarget + 2
                sift = 0
              Else
                NewPad ("Execution of Sift successful.")
                deck.usedprgs.sift = curnode
              End If
            End If
            timetics = Int(node(curnode).file(n).size / ((decker.intelligence + sift) * 5) + .95)
            If timetics > 1 Then
              Form17.TurnsLabel = "Reading would take " & Format(timetics) & " turn(s). Increase speed by factor (1=none)"
              Form17.Show 1
              i = retdata
            End If
            If i < 1 Then i = 1
            timetics = Int(node(curnode).file(n).size / ((decker.intelligence + sift) * 5 * i) + .95)
            NewPad ("Scan takes (" & Format(timetics) & " turns)")
            Rem Make Perception Test against Target "Increase Factor"
            nsucc = SuccTest(decker.intelligence, i, 1, "Perception Test")
            If nsucc > 0 Then
              NewPad ("You found something in <" & node(curnode).file(n).name & "> (see GM log).")
              NewPadGM ("Scan file <" & node(curnode).file(n).name & "> results in " & Format(nsucc) & " successes.")
            Else
              NewPad ("Nothing found in  <" & node(curnode).file(n).name & ">.")
            End If
          End If
        Else
          NewPad ("Read file SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        End If

      Case "Transfer File":   ' DS (Datastore) Operations
        timetics = 1
        modscr = 0
        lenscr = 1#
        If icestr$ = "SCRAMBLE" And Icesatisfaction(icenr) >= ICELOOK Then
          modscr = GetIceRating(icenr)
          lenscr = 1.5
        ElseIf icestr$ = "" Or (Icesatisfaction(icenr) <= ICEDECP) Then
          modscr = 0
          lenscr = 1#
        Else
          NewPad ("This ICE blocks your transfer.")
          modscr = -1
        End If
        If modscr <> -1 Then
          nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating + modscr, node(curnode).colnr + 1, "Transfer file SysOp")
          If nsucc > node(curnode).colnr Then
            If node(curnode).nfiles <= 0 Then
              NewPad ("No file left for transfer.")
            Else
              Rem Choose file number
              NewPad ("Transfer started...")
              n = 1
              If node(curnode).nfiles > 1 Then
                Form7.Label1.Caption = "Choose number of file to transfer:"
                Form7.Show 1
                n = retdata
              End If
              If n < 1 Or n > node(curnode).nfiles Then n = 1
              siz = lenscr * node(curnode).file(n).size
              sizc = siz
              If deck.compressed > 0 And siz <= 100 * deck.compressed Then
                sizc = Int(.5 * siz + .95)
                NewPad ("File compression during saving.")
              End If
              If deck.storageprogmem + sizc > deck.storagemem Then
                NewPad ("File too big. Not enough storage mem.")
              Else
                deck.modload = 2   ' Modifier +2 while transfering data
                timetics = Int(siz / deck.io + .95)
                AddPad (" (" & Format(timetics) & " turns).")
                b$ = ""
                If lenscr = 1.5 Then
                  b$ = "+ICEd"
                  NewPad ("ICECode is attached to the file.")
                End If
                deck.storageprogmem = deck.storageprogmem + siz
                List2.AddItem node(curnode).file(n).name & b$ & " [" & Format(sizc) & "Mp]"
                NewPad ("Transfering <" & node(curnode).file(n).name & b$ & ">")
                dirtyflag = True
                UpdateMemoryStatus
              End If
            End If
          Else
            NewPad ("Transfer file SysOp failed.")
            node(curnode).failsysop = node(curnode).failsysop + 1
          End If
       End If

      Case "Control":   ' SM (Slave Module) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Control Device SysOp")
        If nsucc <= node(curnode).colnr Then
          NewPad ("Control Device SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        Else
          NewPad ("Control Device successful (see GM log).")
          NewPadGM ("Control Device in node " & Format(curnode) & " with " & Format(nsucc) & " successes.")
        End If
        timetics = 1

      Case "Sensor Readout":  ' SM (Slave Module) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Sensor readout SysOp")
        If nsucc <= node(curnode).colnr Then
          NewPad ("Sensor Readout SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        Else
          NewPad ("Sensor Readout successful (ask GM).")
          NewPadGM ("Sensor Readout in node " & Format(curnode) & " with " & Format(nsucc) & " successes.")
        End If
        timetics = 1
        
      Case "Display Message":  ' IOP (I/O Port) Operations
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Display message SysOp")
        If nsucc <= node(curnode).colnr Then
          NewPad ("Display Message SysOp failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        Else
          NewPad ("Message displayed successful.")
        End If
        timetics = 1
        
      Case "Disconnect Port":  ' IOP (I/O Port) Operations
        Rem Missing: If port is a terminal or cyberdeck, it has to be crashed by cybercombat
        nsucc = SuccTest(MaxDD(decker.computer), node(curnode).rating, node(curnode).colnr + 1, "Disconnect SysOp")
        If nsucc <= node(curnode).colnr Then
          NewPad ("Disconnect Port failed.")
          node(curnode).failsysop = node(curnode).failsysop + 1
        Else
          NewPad ("Port successful disconnected.")
        End If
        timetics = 1
    

      Case Else:
        NewPad ("Unimplemented SysOp.")

    End Select
    
    Rem Trigger passive alert when D6(1) <= sysop-attemps (=failedsysop?)
    Rem For each attempt after the 1st, roll D6(1).
    If node(curnode).failsysop > failed Then
      If (D6(1) <= node(curnode).failsysop And failed > 0) Or sysop$ = "Back Door" Then
        SetPasAlert ' Set passive alert
      End If
    Else ' SysOp successful: Play Sound
      Call SoundPlay(sysop$, 3)
    End If
  End If

EndSysOp:
  CntIni (timetics)

End Sub

Sub TestCntIni1 ()
  Dim i%

  Debug.Print "++++"
  TestCntIni2 (1)
  Debug.Print "----"
  TestCntIni2 (1)
  Debug.Print "----"
  TestCntIni2 (1)
  Debug.Print "----"
  TestCntIni2 (1)
  Debug.Print "----"

End Sub

Sub TestCntIni2 (timetics%)
  Dim icenr As Integer
  Dim j As Integer
  Dim h As Integer

  
  ' Quick Sort with Index exchanging and copying of Ice().ini and decker.ini
  Call QuickSortICE(True)
  ' Now iceorder() contains the indices of ICE sorted by initiative in ascending order.
  ' sorticeini() contains the initiative numbers of the ICE's.
  ' iceorder()=icenum-1+1 is the decker.
  Do  ' loop for timetics
    If timetics > 0 Then
      decker.ini = decker.ini - 10
      timetics = timetics - 1
      QuickSortICE (False)
    End If
  
    If icenum > 0 Then
      Do
        Debug.Print "Decker's Initiative:"; decker.ini, sorticeini(0)
        h = icenum - 1 + 1
        ' as long as one Ini > 0
        Do While sorticeini(h) > 0
          If sorticeini(h) < sorticeini(icenum) Then ' not lower than highest-10
            QuickSortICE (False)
            h = icenum - 1 + 1
          End If
          icenr = iceorder(h)
          If icenr = icenum - 1 + 1 Then Exit Do ' This is the decker
          Debug.Print ice(icenr).description & "-" & Format(ice(icenr).rating) & " Initiative:"; sorticeini(h)
          DoICE (icenr)
          ' avoid endless loop, when decker is bailed out
          If deck.damage >= 10 Or decker.damage_phys >= 10 Or decker.damage_stun >= 10 Then GoTo endcntini2
          ice(icenr).succattacked = False
          ice(icenr).succslowed = False
          Call UpdateDeckStatus(decker, deck)
          ice(icenr).ini = ice(icenr).ini - 10    ' reduce Ini of done ICE
          sorticeini(h) = ice(icenr).ini
          h = h - 1
          If h < 0 Then Exit Do
        Loop
        If h < 0 Then
          ' Roll new Initiative for all, because all ICE and the decker has no action left
          Call NewIni
          h = icenum
        End If
      Loop While icenr <> icenum - 1 + 1   ' as long as not the decker himself
    End If   ' no ICE at all
    
    UpdateDecker
  Loop While timetics > 0
endcntini2:
  timetics = 0
  deck.modload = 0



End Sub

Sub TestMoveICE ()
  Dim icenr%, nodenr%, range%

  For icenr = 5 To 5
    nodenr = ice(icenr).nodenr
    range = ice(icenr).range
    MoveICE (icenr)
  Next icenr

End Sub

Sub Timer1_Timer ()
  If realtime = True Then
    Timer1.Enabled = False
    Wait3D1_Click
    Timer1.Interval = realtimeinterval
    Timer1.Enabled = True
  End If
End Sub

Sub Timer2_Timer ()
  Timer2.Enabled = False
  timer2elapsed = True
End Sub

Sub Timer2Start (Interval As Long)
  Rem --- Start timer2 ---
  If icetime = True Then     ' start ICE clock if enabled
    timer2elapsed = False
    Timer2.Interval = Interval
    Timer2.Enabled = True
  Else
    timer2elapsed = True
  End If
End Sub

Sub Timer2WaitForElapse ()
  Dim h%

  If icetime Then
    Do While timer2elapsed = False
      h = DoEvents()
      ' wait for Timer2 to count down
    Loop
  Else
    timer2elapsed = True
  End If
End Sub

Function TranslateCRC (ByVal s$) As Long
  Dim i As Long
  Dim k As Long
  Dim l As Long
  Dim b As Integer

  k = 0
  l = 1
  For i = 1 To Len(s$)
    b = Asc(Mid$(s$, i, 1))
    If b <> Asc(" ") Then
      k = k + (b + 1) * l
      l = l + 1
    End If
  Next i
  TranslateCRC = k

End Function

Function TranslateTo256 (in As String) As String
  Dim Acc As Long
  Dim Out$
  Dim k%, i%

  For k = 1 To Len(in) Step 4
    Acc = (Asc(Mid$(in, k)) - Asc("0"))
    Acc = Acc + (Asc(Mid$(in, k + 1) + "0") - Asc("0")) * 64
    Acc = Acc + (Asc(Mid$(in, k + 2) + "0") - Asc("0")) * 64 ^ 2
    Acc = Acc + (Asc(Mid$(in, k + 3) + "0") - Asc("0")) * 64 ^ 3
    For i = 1 To 3
      Out = Out + Chr$(Acc Mod 256)
      Acc = Acc \ 256
    Next i
  Next k

  TranslateTo256 = Left$(Out, Int(Len(in) * 3 / 4))

End Function

Function TranslateTo64 (ByVal in As String) As String
  Dim Acc As Long
  Dim Out$
  Dim k%, i%

  For k = 1 To Len(in) Step 3
    Acc = (Asc(Mid$(in, k)) - Asc("0"))
    Acc = Acc + (Asc(Mid$(in, k + 1) + "0") - Asc("0")) * 256
    Acc = Acc + (Asc(Mid$(in, k + 2) + "0") - Asc("0")) * 65536
    For i = 1 To 4
      Out = Out + Chr$(Acc Mod 64 + Asc("0"))
      Acc = Acc \ 64
    Next i
  Next k

  TranslateTo64 = Left$(Out, Int(Len(in) * 8 / 6 + .9))
    ' 2nd arg <=> Ceiling(Len(in)*8/6)

End Function

Sub TriggerICE1 (ByVal icenr%)
  Rem Checks whether new ICE is triggered by some other ICE
  
  If icenr >= 0 Then
    If ice(icenr).satisfaction >= ICESUSP And ice(icenr).ptrigger <> -1 Then
      Call TriggerICE2(ice(icenr).ptrigger, ice(icenr).nodenr, ice(icenr).ini - 10)
    End If
    If ice(icenr).satisfaction >= ICEYELL And ice(icenr).atrigger <> -1 Then
      Call TriggerICE2(ice(icenr).atrigger, ice(icenr).nodenr, ice(icenr).ini - 10)
    End If
    ' reverse trigger possible? (no, at this time)
  End If
End Sub

Sub TriggerICE2 (ByVal icenr%, ByVal nodenr%, ByVal triggerini%)
  Rem Makes ICE icenr% active.
  Rem If icenr = -2 then trigger all ICE which is active = never.
  Rem If icenr = -3 then trigger all ICE in node nodenr.
  Rem
  Rem triggerini is the Initiative of the newly triggered ICE
  Dim flag As Integer
  
  flag = False
  If icenr >= 0 And icenr < icenum Then
    If ice(icenr).damage < 10 And ice(icenr).satisfaction <> ICEFROZ Then
      ice(icenr).active = alert  ' or 0 (when only passive alert, ICE may go dormant again)
      ice(icenr).ini = triggerini
      If ice(icenr).nodenr = curnode Then flag = True
    End If
  ElseIf icenr = -2 Then
    For icenr = 0 To icenum - 1
      If ice(icenr).active = 3 And ice(icenr).damage < 10 And ice(icenr).satisfaction <> ICEFROZ Then
        ice(icenr).active = alert
        ice(icenr).ini = triggerini
        If ice(icenr).nodenr = curnode Then flag = True
      End If
    Next icenr
  ElseIf icenr = -3 Then
    For icenr = 0 To icenum - 1
      If ice(icenr).nodenr = nodenr And ice(icenr).damage < 10 And ice(icenr).satisfaction <> ICEFROZ Then
        ice(icenr).active = alert
        ice(icenr).ini = triggerini
        If ice(icenr).nodenr = curnode Then flag = True
      End If
    Next icenr
  End If
  If flag Then     ' If ICE was triggered in same node as decker update node image
    Call ShowNode(curnode, False, False)
  End If
End Sub

Sub UnloadProg_Click ()
  Rem Unload (=>) Button
  Dim r%
  Dim a$, s$, p$, l$

  Call DeckersTurn(curnode, "UNLOAD")
  timetics = 0
  If decker.body <= 0 Or decker.damage_stun >= 10 Or decker.damage_phys >= 10 Then
    NewPad ("Plug in first!")
  Else
    If List1.ListIndex >= 0 Then
      Call DelProg(decker, deck, 0)
      timetics = 1
    End If
  End If
  CntIni (timetics)

End Sub

Sub UpdateDecker ()
  Dim modifier%
  Form3.Label1.Caption = decker.name
  Form3.Label2(8).Caption = skilltype

  Form3.Label3(0).Caption = Format(decker.body)
  Form3.Label3(1).Caption = Format(decker.quickness)
  Form3.Label3(2).Caption = Format(decker.strength)
  Form3.Label3(3).Caption = Format(decker.charisma)
  Form3.Label3(4).Caption = Format(decker.intelligence)
  Form3.Label3(5).Caption = Format(decker.willpower)
  deck.dicereact = decker.reactdice + deck.response + deck.purecyber + deck.realfilteruse
  deck.dreaction = decker.reaction + 2 * deck.response + 2 * deck.realfilteruse + 2 * deck.purecyber - 2 * deck.onuplink
  deck.dreaction = deck.dreaction - GetDamMod(decker.damage_stun) - GetDamMod(decker.damage_phys) - GetDamMod(deck.damage)
  If deck.dreaction < 0 Then
    Form3.Label3(6).Caption = Format(deck.dicereact) & "D" & Format(deck.dreaction)
  Else
    Form3.Label3(6).Caption = Format(deck.dicereact) & "D+" & Format(deck.dreaction)
  End If
  modifier = 2 * deck.realfilteruse - 2 * deck.onuplink - GetDamMod(decker.damage_stun) - GetDamMod(decker.damage_phys) - GetDamMod(deck.damage)
  Form3.Label3(7).Caption = Format(modifier)
  Form3.Label3(8).Caption = Format(decker.computer)
  Form3.Label3(9).Caption = Format(decker.karma)
  Form3.Label3(10).Caption = Format(decker.team)
  Form3.Label3(11).Caption = Format(decker.lefthacking) & "/" & Format(decker.hackingpool)

End Sub

Sub UpdateDeckStatus (decker As deckertype, deck As cyberdecktype)
  Dim dam%, m%

  Call ShowDamageStatus(decker, deck)
  DeckAttrib(0) = Format(deck.mpcp)
  DeckAttrib(1) = Format(deck.bod)
  DeckAttrib(2) = Format(deck.evasion)
  DeckAttrib(3) = Format(deck.masking)
  DeckAttrib(4) = Format(deck.sensor)
End Sub

Sub UpdateMemoryStatus ()

  active.FloodPercent = deck.activeprogmem / deck.activemem * 100
  If deck.storageprogmem > deck.storagemem Then
    NewPad ("Overflow in storage mem: Improper cyberdeck data!")
    deck.storageprogmem = deck.storagemem
  End If
  storage.FloodPercent = deck.storageprogmem / deck.storagemem * 100
  Active_label.Caption = Format(deck.activeprogmem) & "Mp"
  Storage_label.Caption = Format(deck.storageprogmem) & "Mp"

End Sub

Sub UpdateReaction ()
  '
  ' called by LoadDeck and LoadDecker
  '
  Dim modifier%

  deck.dicereact = decker.reactdice + deck.response + deck.purecyber + deck.realfilteruse
  deck.dreaction = decker.reaction + 2 * deck.response + 2 * deck.realfilteruse + 2 * deck.purecyber - 2 * deck.onuplink
  If decker.reaction <> Int((decker.quickness + decker.intelligence) / 2) Then
    NewPad ("R=(Q+I)/2 does not fit this decker!")
  End If
  If decker.body > 0 And decker.hackingpool > 0 And deck.mpcp > 0 And ((deck.dreaction + decker.computer) <> (decker.hackingpool - 2 * deck.onuplink)) Then
    NewPad ("Hackpool=MatR+Skill does not fit this decker!")
  Else
    Rem set hackingpool automatically
    decker.hackingpool = deck.dreaction + decker.computer + 2 * deck.onuplink
  End If
  ' apply damage modifiers
  deck.dreaction = deck.dreaction - GetDamMod(decker.damage_stun) - GetDamMod(decker.damage_phys) - GetDamMod(deck.damage)
  If deck.dreaction < 0 Then
    Form3.Label3(6).Caption = Format(deck.dicereact) & "D" & Format(deck.dreaction)
  Else
    Form3.Label3(6).Caption = Format(deck.dicereact) & "D+" & Format(deck.dreaction)
  End If
  modifier = 2 * deck.realfilteruse - 2 * deck.onuplink - GetDamMod(decker.damage_stun) - GetDamMod(decker.damage_phys) - GetDamMod(deck.damage)
  Form3.Label3(7).Caption = Format(modifier)

End Sub

Sub UpdateRounds ()
    Rem Updates the login time display
    Dim secs As Long
    Dim minutes As Long

    secs = roundssinceload * 3
    minutes = Fix(secs / 60)
    secs = secs - minutes * 60
    timelabel.Caption = "Login Time: " + Format$(minutes, "00") + ":" + Format$(secs, "00")

End Sub

Function UseBod () As Integer
    Rem E.g. ARMOR's bod reduces at every test

    UseBod = deck.bod
    Call DegradeUtil(deck, "ARMOR")
End Function

Function UseEva () As Integer
    Rem MIRRORS' evasion reduces at every turn
    Rem (not at every usage) --> see RedEva()

    UseEva = deck.evasion
    Call UpdateDeckStatus(decker, deck)
End Function

Function UseMask () As Integer
    Rem E.g. CLOAK's masking reduces at every test

    UseMask = deck.masking
    Call DegradeUtil(deck, "CLOAK")
End Function

Sub Wait3D1_Click ()
  timetics = 1
  If decker.body > 0 And deck.mpcp > 0 And deck.damage < 10 And decker.damage_stun < 10 And decker.damage_phys < 10 Then
    NewPad ("Waiting...")
    Call DeckersTurn(curnode, "WAIT")
    CntIni (timetics)
  End If
End Sub

