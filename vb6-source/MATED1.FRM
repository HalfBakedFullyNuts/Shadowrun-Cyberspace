VERSION 2.00
Begin Form Form1 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Matrix Construction Set"
   ClientHeight    =   7725
   ClientLeft      =   1245
   ClientTop       =   2445
   ClientWidth     =   11520
   Height          =   8415
   Icon            =   MATED1.FRX:0000
   Left            =   1185
   LinkTopic       =   "Form1"
   ScaleHeight     =   7725
   ScaleWidth      =   11520
   Top             =   1815
   Width           =   11640
   Begin SSFrame Frame3D7 
      Caption         =   "Node Design: "
      Font3D          =   4  'Inset w/heavy shading
      ForeColor       =   &H00000000&
      Height          =   7695
      Left            =   120
      TabIndex        =   35
      Top             =   0
      Width           =   6135
      Begin CommonDialog StdDialog2 
         DefaultExt      =   "cpu0.bmp"
         Filter          =   "Images (*.bmp)|*.bmp|All files (*.*)|*.*"
         Left            =   5040
         Top             =   120
      End
      Begin SSRibbon GroupPush3D2 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         GroupNumber     =   2
         Height          =   375
         Index           =   1
         Left            =   2760
         PictureUp       =   MATED1.FRX:0302
         Top             =   1680
         Width           =   375
      End
      Begin SSRibbon GroupPush3D2 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         GroupNumber     =   2
         Height          =   375
         Index           =   0
         Left            =   2760
         PictureUp       =   MATED1.FRX:08B8
         Top             =   1320
         Width           =   375
      End
      Begin SSRibbon GroupPush3D1 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         Height          =   615
         Index           =   4
         Left            =   4200
         PictureUp       =   MATED1.FRX:0E6E
         Top             =   2160
         Width           =   615
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   9
         Left            =   5160
         TabIndex        =   53
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   8
         Left            =   4920
         TabIndex        =   52
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin TextBox MsgTextBox 
         Height          =   285
         Left            =   3360
         TabIndex        =   51
         Top             =   1680
         Width           =   2655
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   11
         Left            =   5640
         TabIndex        =   48
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   10
         Left            =   5400
         TabIndex        =   47
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin CommonDialog StdDialog1 
         DefaultExt      =   "*.ltg"
         Filter          =   "Matrix (*.ltg)|*.ltg|All files (*.*)|*.*"
         Left            =   5520
         Top             =   120
      End
      Begin SSRibbon GroupPush3D1 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         Height          =   615
         Index           =   2
         Left            =   4800
         PictureUp       =   MATED1.FRX:16A8
         Top             =   2160
         Width           =   615
      End
      Begin SSRibbon GroupPush3D1 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         Height          =   615
         Index           =   3
         Left            =   5400
         PictureUp       =   MATED1.FRX:1EE2
         Top             =   2160
         Width           =   615
      End
      Begin SSRibbon GroupPush3D1 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         Height          =   615
         Index           =   1
         Left            =   3600
         PictureUp       =   MATED1.FRX:279C
         Top             =   2160
         Width           =   615
      End
      Begin SSRibbon GroupPush3D1 
         AutoSize        =   0  'None
         GroupAllowAllUp =   0   'False
         Height          =   615
         Index           =   0
         Left            =   3000
         PictureUp       =   MATED1.FRX:2F3A
         Top             =   2160
         Value           =   -1  'True
         Width           =   615
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   7
         Left            =   4680
         TabIndex        =   0
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   6
         Left            =   4440
         TabIndex        =   1
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   5
         Left            =   4200
         TabIndex        =   2
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   4
         Left            =   3960
         TabIndex        =   3
         Top             =   600
         Value           =   -1  'True
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   3
         Left            =   3720
         TabIndex        =   4
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   2
         Left            =   3480
         TabIndex        =   5
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   1
         Left            =   3240
         TabIndex        =   6
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin SSOption Option3D1 
         Caption         =   "Option3D1"
         Height          =   255
         Index           =   0
         Left            =   3000
         TabIndex        =   7
         TabStop         =   0   'False
         Top             =   600
         Width           =   255
      End
      Begin PictureBox Picture1 
         AutoRedraw      =   -1  'True
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         FillColor       =   &H00FFFFFF&
         FillStyle       =   0  'Solid
         ForeColor       =   &H00000000&
         Height          =   4455
         Left            =   360
         MousePointer    =   2  'Cross
         Picture         =   MATED1.FRX:383C
         ScaleHeight     =   297
         ScaleMode       =   3  'Pixel
         ScaleWidth      =   369
         TabIndex        =   36
         Top             =   3120
         Width           =   5535
      End
      Begin Line Line7 
         X1              =   3000
         X2              =   2880
         Y1              =   720
         Y2              =   720
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "DLJ"
         Height          =   255
         Index           =   28
         Left            =   120
         TabIndex        =   62
         Top             =   2760
         Width           =   375
      End
      Begin Image Picture2 
         Height          =   2535
         Left            =   600
         Picture         =   MATED1.FRX:38FE
         Stretch         =   -1  'True
         Top             =   480
         Width           =   2175
      End
      Begin Label Label3 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackColor       =   &H00C0C0C0&
         Caption         =   "Message in Node/LNK-File:"
         Height          =   195
         Left            =   3495
         TabIndex        =   9
         Top             =   1440
         Width           =   2385
      End
      Begin Line Line6 
         X1              =   3360
         X2              =   3600
         Y1              =   1320
         Y2              =   1200
      End
      Begin Line Line5 
         X1              =   3360
         X2              =   3600
         Y1              =   1080
         Y2              =   1200
      End
      Begin Line Line4 
         X1              =   2880
         X2              =   3600
         Y1              =   1200
         Y2              =   1200
      End
      Begin Line Line3 
         X1              =   2760
         X2              =   2880
         Y1              =   2880
         Y2              =   2880
      End
      Begin Line Line2 
         X1              =   2880
         X2              =   2880
         Y1              =   600
         Y2              =   2880
      End
      Begin Line Line1 
         X1              =   2760
         X2              =   2880
         Y1              =   600
         Y2              =   600
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "D"
         Height          =   255
         Index           =   26
         Left            =   2400
         TabIndex        =   50
         Top             =   240
         Width           =   375
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "P"
         Height          =   255
         Index           =   25
         Left            =   2040
         TabIndex        =   49
         Top             =   240
         Width           =   375
      End
      Begin Label SelNodetypLabel 
         Alignment       =   2  'Center
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "SAN Orange-5"
         Height          =   255
         Left            =   3720
         TabIndex        =   8
         Top             =   1080
         Width           =   2295
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   " 1  2  3  4  5   6  7  8  9  10 11 12"
         ForeColor       =   &H00404040&
         Height          =   255
         Index           =   11
         Left            =   3000
         TabIndex        =   10
         Top             =   840
         Width           =   3015
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "System Rating:"
         Height          =   255
         Index           =   10
         Left            =   3240
         TabIndex        =   11
         Top             =   240
         Width           =   2295
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "CPU"
         Height          =   255
         Index           =   5
         Left            =   120
         TabIndex        =   12
         Top             =   2400
         Width           =   495
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "IOP"
         Height          =   255
         Index           =   4
         Left            =   120
         TabIndex        =   13
         Top             =   2040
         Width           =   495
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "SM"
         Height          =   255
         Index           =   3
         Left            =   120
         TabIndex        =   44
         Top             =   1680
         Width           =   495
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "DS"
         Height          =   255
         Index           =   2
         Left            =   120
         TabIndex        =   45
         Top             =   1320
         Width           =   495
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "SPU"
         Height          =   255
         Index           =   1
         Left            =   120
         TabIndex        =   46
         Top             =   960
         Width           =   495
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "SAN"
         Height          =   255
         Index           =   0
         Left            =   120
         TabIndex        =   43
         Top             =   600
         Width           =   495
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "R"
         Height          =   255
         Index           =   9
         Left            =   1680
         TabIndex        =   42
         Top             =   240
         Width           =   375
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "O"
         Height          =   255
         Index           =   8
         Left            =   1320
         TabIndex        =   41
         Top             =   240
         Width           =   375
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "G"
         Height          =   255
         Index           =   7
         Left            =   960
         TabIndex        =   40
         Top             =   240
         Width           =   375
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "B"
         Height          =   255
         Index           =   6
         Left            =   600
         TabIndex        =   39
         Top             =   240
         Width           =   375
      End
   End
   Begin SSFrame Frame3D2 
      Caption         =   "Data Files: "
      Font3D          =   4  'Inset w/heavy shading
      ForeColor       =   &H00000000&
      Height          =   1815
      Left            =   6360
      TabIndex        =   23
      Top             =   2640
      Width           =   5055
      Begin CommandButton DataButton 
         Caption         =   "Erase File"
         Height          =   375
         Index           =   1
         Left            =   120
         TabIndex        =   34
         Top             =   1320
         Width           =   1095
      End
      Begin CommandButton DataButton 
         Caption         =   "Add File"
         Height          =   375
         Index           =   0
         Left            =   120
         TabIndex        =   33
         Top             =   960
         Width           =   1095
      End
      Begin TextBox DataText 
         Height          =   285
         Index           =   2
         Left            =   4080
         TabIndex        =   31
         Text            =   "50000"
         Top             =   360
         Width           =   855
      End
      Begin TextBox DataText 
         Height          =   285
         Index           =   1
         Left            =   3240
         TabIndex        =   29
         Text            =   "110"
         Top             =   360
         Width           =   855
      End
      Begin TextBox DataText 
         Height          =   285
         Index           =   0
         Left            =   1320
         TabIndex        =   26
         Text            =   "Customer Infos"
         Top             =   360
         Width           =   1935
      End
      Begin ListBox List1 
         BackColor       =   &H00808080&
         Height          =   615
         Left            =   1320
         TabIndex        =   25
         Top             =   960
         Width           =   3615
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Filename:"
         ForeColor       =   &H00808080&
         Height          =   240
         Index           =   22
         Left            =   1440
         TabIndex        =   32
         Top             =   135
         Width           =   1695
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Value:"
         ForeColor       =   &H00808080&
         Height          =   240
         Index           =   21
         Left            =   4080
         TabIndex        =   30
         Top             =   135
         Width           =   855
      End
      Begin Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Size (Mp):"
         ForeColor       =   &H00808080&
         Height          =   240
         Index           =   20
         Left            =   3120
         TabIndex        =   28
         Top             =   135
         Width           =   975
      End
      Begin Label Label1 
         Alignment       =   2  'Center
         BackColor       =   &H00C0C0C0&
         Caption         =   "Filename  Mp/Value"
         ForeColor       =   &H00808080&
         Height          =   255
         Left            =   1440
         TabIndex        =   27
         Top             =   720
         Width           =   3375
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "In Node: "
         Height          =   255
         Index           =   19
         Left            =   120
         TabIndex        =   24
         Top             =   360
         Width           =   1215
      End
   End
   Begin SSFrame Frame3D1 
      Caption         =   "General Parameters: "
      Font3D          =   4  'Inset w/heavy shading
      Height          =   2535
      Left            =   6360
      TabIndex        =   14
      Top             =   0
      Width           =   5055
      Begin SpinButton Spin2 
         Height          =   255
         Index           =   1
         Left            =   4680
         Top             =   2040
         Width           =   255
      End
      Begin TextBox EmergText 
         Height          =   285
         Index           =   1
         Left            =   3960
         TabIndex        =   59
         Text            =   "1000"
         Top             =   2040
         Width           =   735
      End
      Begin SpinButton Spin2 
         Height          =   255
         Index           =   0
         Left            =   1800
         Top             =   2040
         Width           =   255
      End
      Begin TextBox EmergText 
         Height          =   285
         Index           =   0
         Left            =   1320
         TabIndex        =   58
         Text            =   "101"
         Top             =   2040
         Width           =   495
      End
      Begin ComboBox Combo1 
         BackColor       =   &H00FFFFFF&
         Height          =   300
         Left            =   3360
         TabIndex        =   56
         Text            =   "Observation"
         Top             =   1680
         Width           =   1575
      End
      Begin TextBox EntryText 
         Height          =   285
         Left            =   1320
         TabIndex        =   55
         Text            =   "1"
         Top             =   1680
         Width           =   375
      End
      Begin SSOption Option3D2 
         Caption         =   "Active Alert"
         Height          =   255
         Index           =   2
         Left            =   3600
         TabIndex        =   20
         Top             =   720
         Width           =   1335
      End
      Begin SSOption Option3D2 
         Caption         =   "Passive Alert"
         Height          =   255
         Index           =   1
         Left            =   2160
         TabIndex        =   19
         Top             =   720
         Width           =   1455
      End
      Begin SSOption Option3D2 
         Caption         =   "none"
         Height          =   255
         Index           =   0
         Left            =   1320
         TabIndex        =   18
         Top             =   720
         Width           =   735
      End
      Begin TextBox MatnameText 
         Height          =   345
         Left            =   1320
         TabIndex        =   16
         Text            =   "New LTG"
         Top             =   360
         Width           =   3615
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "% damIC/Reacttime"
         Height          =   255
         Index           =   24
         Left            =   2160
         TabIndex        =   61
         Top             =   2100
         Width           =   1695
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Emergency:"
         Height          =   255
         Index           =   23
         Left            =   120
         TabIndex        =   60
         Top             =   2040
         Width           =   1095
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Entry Range:"
         Height          =   255
         Index           =   27
         Left            =   2160
         TabIndex        =   57
         Top             =   1740
         Width           =   1215
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Entry node:"
         Height          =   255
         Index           =   12
         Left            =   120
         TabIndex        =   54
         Top             =   1740
         Width           =   1095
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Messages:"
         Height          =   225
         Index           =   14
         Left            =   120
         TabIndex        =   38
         Top             =   1080
         Width           =   1095
      End
      Begin Label pad 
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Select node type, color and rating and click on graphic field."
         ForeColor       =   &H0000FFFF&
         Height          =   615
         Left            =   1320
         TabIndex        =   37
         Top             =   1080
         Width           =   3615
      End
      Begin Label ICEnrLabel 
         BackColor       =   &H00C0C0C0&
         Caption         =   "ICEs: 0"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   1515
         Width           =   975
      End
      Begin Label Nodenrlabel 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Nodes: 0"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   1290
         Width           =   975
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Alert Status:"
         Height          =   255
         Index           =   16
         Left            =   120
         TabIndex        =   17
         Top             =   720
         Width           =   1215
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Matrix Name:"
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   15
         Left            =   120
         TabIndex        =   15
         Top             =   360
         Width           =   1215
      End
   End
   Begin Menu m_file 
      Caption         =   "&File"
      Begin Menu m_new 
         Caption         =   "&New LTG"
      End
      Begin Menu m_loadltg 
         Caption         =   "&Load LTG..."
      End
      Begin Menu m_saveltg 
         Caption         =   "&Save LTG..."
      End
      Begin Menu m_sep0 
         Caption         =   "-"
      End
      Begin Menu m_exit 
         Caption         =   "&Exit"
      End
   End
   Begin Menu m_analyze 
      Caption         =   "&Analyze"
      Begin Menu m_matrixstat 
         Caption         =   "&Matrix Statistics"
      End
   End
   Begin Menu m_options 
      Caption         =   "&Options"
      Begin Menu m_readonly 
         Caption         =   "&Read Only LTG/RTG"
      End
      Begin Menu m_ltgimagepath 
         Caption         =   "&Special Image Set"
      End
   End
   Begin Menu m_help 
      Caption         =   "&Help"
      Begin Menu m_starthelp 
         Caption         =   "Start &Help..."
      End
      Begin Menu m_sep1 
         Caption         =   "-"
      End
      Begin Menu m_about 
         Caption         =   "&About..."
      End
   End
End
Option Explicit

Const SETMODE = 0
Const LNKMODE = 1
Const MOVEMODE = 4
Const DATMODE = 2
Const ICEMODE = 3


Const NX = 9#
Const NY = 8#
Const M_PI = 3.1415927

Dim emerg(0 To 1) As Single
Dim nodetypestr(0 To 8) As String  ' SAN SPU DS SM IOP CPU DLJ LNK MAT

Sub Combo1_Change ()
  Rem Entry Range: Observation/Sensor/Contact
  Dim a$
  Dim i%, ret%

  a$ = UCase$(Combo1.Text)
  ret = -1
  For i = 0 To 2
    If UCase$(Left$(rangetypes(i), 1)) = Left$(a$, 1) Then
      ret = i
      Exit For
    End If
  Next i
  If ret >= 0 Then
    Combo1.Text = rangetypes(ret)
    deck.range = ret
  Else
    Combo1.Text = rangetypes(2)
    deck.range = 2
  End If


End Sub

Sub Combo1_Click ()
  Call Combo1_Change
End Sub

Sub DataButton_Click (Index As Integer)
  Rem Add/Erase file
  Dim k%, n%

  If curnode <> -1 Then
    If Index = 0 Then ' add file
      n = node(curnode).nfiles + 1
      node(curnode).nfiles = n
      node(curnode).file(n).name = DataText(0).Text
      node(curnode).file(n).size = DataText(1).Text
      node(curnode).file(n).Value = DataText(2).Text
    Else              ' erase file
      n = List1.ListIndex + 1
      If n >= 1 Then
        For k = n + 1 To node(curnode).nfiles
          node(curnode).file(k - 1).name = node(curnode).file(k).name
          node(curnode).file(k - 1).size = node(curnode).file(k).size
          node(curnode).file(k - 1).Value = node(curnode).file(k).Value
        Next k
        node(curnode).nfiles = node(curnode).nfiles - 1
      End If
    End If
    ShowFileList (curnode)
    List1.ListIndex = List1.ListCount - 1
  End If

End Sub

Sub DelaNode (nodenr%, xpos%, ypos%)
  Rem --- Deletes a node with its links in node() ---
  Rem Input:
  Rem  xpos,ypos are in grid corrdinates
  Dim i%, k%, l%

  If nodenr > 0 And nodenr <= nodenum Then
    ' Delete all ICE in deleted node
    k = 0
    While (k < icenum)
      If ice(k).nodenr = nodenr Then
        DeleteICE (k)   ' delete ICE (changes var. icenum)
      Else
        If ice(k).nodenr > nodenr Then
          ice(k).nodenr = ice(k).nodenr - 1 ' (changes nodenum)
        End If
        k = k + 1
      End If
    Wend
      
    ' delete all links pointing to deleted node
    For i = 0 To nodenum
      For k = 1 To node(i).nlinks
        l = node(i).link(k)
        If l = nodenr Then
          Call DelLink(i, nodenr)
          Call DelLink(nodenr, i)
        End If
      Next k
    Next i
    ' reduce all links pointing above deleted node by one
    For i = 0 To nodenum
      For k = 1 To node(i).nlinks
        l = node(i).link(k)
        If l > nodenr Then
          node(i).link(k) = l - 1
        End If
      Next k
    Next i

    ' Copy all node info of following nodes
    For i = nodenr To nodenum - 1
      node(i).xpos = node(i + 1).xpos
      node(i).ypos = node(i + 1).ypos
      node(i).typ = node(i + 1).typ
      node(i).color = node(i + 1).color
      node(i).colnr = node(i + 1).colnr
      node(i).rating = node(i + 1).rating
      node(i).nlinks = node(i + 1).nlinks
      node(i).mesg = node(i + 1).mesg
        
      ' copy all links (link numbers already corrected)
      For k = 1 To node(i + 1).nlinks
        node(i).link(k) = node(i + 1).link(k)
      Next k
      ' copy data files
      For k = 1 To node(i).nfiles
        node(i).file(k).name = node(i + 1).file(k).name
        node(i).file(k).size = node(i + 1).file(k).size
        node(i).file(k).Value = node(i + 1).file(k).Value
      Next k
    Next i
    nodenum = nodenum - 1
  End If
    
End Sub

Sub DelLink (nodenr%, othernode%)
  Rem removes link othernode from the node nodenr
  Dim i%
  Dim linknr%

  linknr = -1
  For i = 1 To node(nodenr).nlinks              ' search link number
    If node(nodenr).link(i) = othernode Then
      linknr = i
      Exit For
    End If
  Next i

  If linknr <> -1 Then
    For i = linknr To node(nodenr).nlinks - 1
      node(nodenr).link(i) = node(nodenr).link(i + 1)
    Next i
    If linknr <= node(nodenr).nlinks Then
      node(nodenr).nlinks = node(nodenr).nlinks - 1
    End If
  End If

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

    sclx = Picture1.ScaleWidth / NX
    scly = Picture1.ScaleHeight / NY
    cx = node(nodenr).xpos * sclx
    cy = node(nodenr).ypos * scly
'    Debug.Print "xpos,ypos : cx,cy="; node(nodenr).xpos; node(nodenr).ypos; ":"; cx, cy

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

    Picture1.FillColor = colin
    Picture1.FillStyle = 0
    Picture1.CurrentX = cx
    Picture1.CurrentY = cy
    Picture1.ForeColor = colout
    If npnts = 0 Then                           ' SM (Circle)
      Picture1.Circle (cx, cy), .375 * sclx, colout
    ElseIf npnts = 14 And curnode = nodenr Then ' Inverse CPU
      Call Polygon(Picture1.hDC, pntdata(0), npnts)
      ' Call MyPolygon(npnts, colout, colin)
      Picture1.FillColor = WHITE
      Picture1.Circle (cx, cy), .125 * sclx, WHITE
      Picture1.FillColor = colin
    ElseIf npnts = 2 Then
      ' Do nothing for "LNK"-node
    Else                                        ' All other nodes
      Call Polygon(Picture1.hDC, pntdata(0), npnts)
      ' Call MyPolygon(npnts, colout, colin)
      Picture1.FillColor = WHITE
      Picture1.Circle (cx, cy), .125 * sclx, WHITE
      Picture1.FillColor = colin
      FloodFill Picture1.hDC, cx, cy, BLACK   ' BLACK is color of boundaries
    End If
    Picture1.CurrentX = cx - .1 * sclx
    Picture1.CurrentY = cy - .2 * scly
    Picture1.ForeColor = colstr
    If node(nodenr).visited = -2 Then
      Picture1.Print Format(node(nodenr).rating)
    End If
  End If

End Sub

Sub EmergText_Change (Index As Integer)

  emerg(Index) = Val(Format$(EmergText(Index).Text))
  emergeperc = emerg(0)
  emergetics = emerg(1)

End Sub

Sub EntryText_Change ()
  Rem Entry Node
  Dim ret%

  entrynode = Val(EntryText.Text)
  If entrynode < 1 Or entrynode > nodenum Then
    pad.Caption = "The node where the decker logs in must lie in the grid!"
  End If

End Sub

Sub Form_Load ()
  Dim i As Integer
  Dim xres As Integer, yres As Integer
  Dim a As String
  Dim windir As String

  FontName = "MS Sans Serif"
  FontSize = 8.25
  xres = Screen.Width \ Screen.TwipsPerPixelX
  yres = Screen.Height \ Screen.TwipsPerPixelY
  If xres <= 640 Or yres <= 480 Then
    MsgBox "Your display seems to provide a resolution of " & xres & " x " & yres & ". This is to small for this program. Try to choose a higher resolution if your video card and monitor is capable of this. Any SVGA card should satisfy your needs. Perhaps a later release of this program will fit on screens with 640 x 480.", 64
  End If
  
  deck.range = RANGEOBS  ' Observation Range for entry
  emergeperc = 101#
  emergetics = -1
  roundssinceload = 0    ' for StrToNode
  matreadonly = False
  m_readonly.Checked = False
  nodetypestr(0) = "SAN"
  nodetypestr(1) = "SPU"
  nodetypestr(2) = "DS"
  nodetypestr(3) = "SM"
  nodetypestr(4) = "IOP"
  nodetypestr(5) = "CPU"
  nodetypestr(6) = "DLJ"
  nodetypestr(7) = "LNK"
  nodetypestr(8) = "MAT"
  nodecolorstr(0) = ""
  nodecolorstr(1) = "Blue"
  nodecolorstr(2) = "Green"
  nodecolorstr(3) = "Orange"
  nodecolorstr(4) = "Red"
  nodecolorstr(5) = "Purple"
  nodecolorstr(6) = "Dark"
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
  rangetypes(0) = "Contact"
  rangetypes(1) = "Sensor"
  rangetypes(2) = "Observation"
  icoltypes(0) = "White"
  icoltypes(1) = "Gray"
  icoltypes(2) = "Black Phys"
  icoltypes(3) = "Black Stun"

  For i = 0 To 2
    Combo1.AddItem rangetypes(i)
  Next i

  dirtyflag = False
  lastnode = -1
  nodenum = 0
  icenum = 0
  entrynode = 1
  matrixname$ = MatnameText.Text
  padwidth = 36
  padclearlen = 2
  NodenrLabel.Caption = "Nodes: " & Format(nodenum)
  ' Picture2.Scale (0, 0)-(6, 6)
  modus = 0
  nodecolor = 3
  noderate = 5
  nodetype = 0
  icecolor = 0
  Option3D2(0).Value = True   ' none Alert
  ' picture1.Scale (-500#, -500#)-(500#, 500#)
  Picture1.Scale (0#, 0#)-(369#, 297#)
  Picture1.ScaleMode = 0
  ' Picture1.Scale (0#, 0#)-(1000#, 1000#)
  Picture1.AutoRedraw = True
  Frame3D2.Enabled = False
  Call StrToNode(0, "MAT Green-4")
  node(0).mesg = ""
  inifile$ = GetPathes()
  If TestPathes(inifile$) = False Then End
  SetPathes (inifile$)
  a$ = ReadDataIni(inifile$, "Cyberspace Program", "DefaultLTG")
  If Len(a$) > 0 Then
    On Error Resume Next
    LoadLTG (a$)
    Picture1.Cls
    Picture1_Paint
  End If
  If GetFormXPosition("Mated.Form1") <> 0 And GetFormYPosition("Mated.Form1") <> 0 Then
    Form1.Left = GetFormXPosition("Mated.Form1")
    Form1.Top = GetFormXPosition("Mated.Form1")
  Else
    Form1.Left = 0
    Form1.Top = 0
  End If
End Sub

Function GetNodeDescription (curnode) As String
  Rem Returns String describing the current node

  If node(curnode).typ = "LNK" Then
    GetNodeDescription = node(curnode).typ
  Else
    GetNodeDescription = node(curnode).typ & " " & node(curnode).color & "-" & node(curnode).rating
  End If
End Function

Sub GroupPush3D1_Click (Index As Integer, Value As Integer)

  If Value = True Then
    curnode = -1
    Select Case Index
      Case 0:
        modus = SETMODE
        lastnode = -1
        pad.Caption = "Set/Delete node with left/right mouse button"
        Frame3D2.Enabled = False
        Frame3D2.Enabled = False
      Case 4:
        modus = MOVEMODE
        lastnode = -1
        pad.Caption = "Select node to move with mouse"
        Frame3D2.Enabled = False
        Frame3D2.Enabled = False
      Case 1:
        modus = LNKMODE
        pad.Caption = "Connect/Disconnect two nodes clicking on 2 nodes with left/right mouse button"
        lastnode = -1
        Frame3D2.Enabled = False
        Frame3D2.Enabled = False
      Case 2:
        modus = DATMODE
        pad.Caption = "Click on node to add data files"
        lastnode = -1
      Case 3:
        modus = ICEMODE
        pad.Caption = "Click on node to add ICE"
        Frame3D2.Enabled = False
    End Select
    Picture1_Paint
'    If Index <> DATMODE Then List1.Clear
  End If

End Sub

Sub GroupPush3D2_Click (Index As Integer, Value As Integer)
  
  If Value = True Then
    curnode = -1
    Select Case Index
      Case 0:  ' External Matrix Node
        curnode = 0
        If modus = LNKMODE Then
          If lastnode <> curnode Then
            Call Addlink(lastnode, curnode)
            Call Addlink(curnode, lastnode)
            pad.Caption = "Connect Node " & Format(lastnode) & " with external Matrix."
            lastnode = -1
            curnode = -1
          End If
        Else
          pad.Caption = "Switch to Link Mode first, and select another node before connecting it with the external Matrix!"
        End If

      Case 1:  ' LNK node (linking other LTG-files with this node)
        nodetype = 7  ' LNK
        ' nodecolor = 0
        ' noderate = 0
        SelNodetypLabel.Caption = nodetypestr(nodetype)
        If modus = DATMODE Or modus = ICEMODE Then
          pad.Caption = "Cannot place data or ICE in an automatic LinkLoad node."
        End If
    End Select
  End If
End Sub

Sub LoadLTG (m$)
  Dim a$, n$
  Dim h%, k%, i%, l%

  matrixname$ = ReadDataIni(m$, "Matrix", "Description")
  MatnameText.Text = Format(matrixname$)
  nodenum = Val(ReadDataIni(m$, "Matrix", "Nodes"))
  NodenrLabel.Caption = "Nodes: " & Format(nodenum)
  entrynode = Val(ReadDataIni(m$, "Matrix", "Entry"))
  If entrynode = 0 Then entrynode = 1
  EntryText.Text = Format(entrynode)
  a$ = ReadDataIni(m$, "Matrix", "Range")
  If Len(a$) > 0 Then
    deck.range = Val(a$)
  Else
    deck.range = 2
  End If
  Combo1.Text = rangetypes(deck.range)
  a$ = ReadDataIni(m$, "Matrix", "Alert")
  a$ = UCase$(a$)
  If a$ = "PASSIVE" Then
    alert = 1
  ElseIf a$ = "ACTIVE" Then
    alert = 2
  Else
    alert = 0
  End If
  a$ = ReadDataIni(m$, "Matrix", "Emergency")
  If Len(a$) = 0 Then
    emergeperc = 101# ' never Shutdown System when critical
    emergetics = -1 ' never
  Else
    emergeperc = Val(GetWord(a$, "/"))
    emergetics = Val(a$)
  End If
  a$ = ReadDataIni(m$, "Matrix", "Shutdowntics")
  shutdowntics = 0
  If Len(a$) > 0 Then shutdowntics = Val(a$)
  a$ = ReadDataIni(m$, "Matrix", "Readonly")
  matreadonly = False
  If UCase$(a$) = "YES" Then
    matreadonly = True
    m_readonly.Checked = True
  Else
    m_readonly.Checked = False
  End If
  LTGImagePath$ = ""
  LTGImagePath$ = ReadDataIni(m$, "Matrix", "LTGImagePath")

  Rem --- Read Node (and ICE) Data ---
  pad.Caption = ""
  icenum = 0
  For i = 0 To nodenum
    n$ = "Node" + Format(i)
    
    a$ = ReadDataIni(m$, n$, "Type")
    If n$ = "Node0" And Len(a$) = 0 Then
      Rem --- Connect entrynode with external matrix ---
      Call StrToNode(0, "MAT Green-4")
      Call StrToLinks(0, Format(entrynode))
      node(0).mesg = ""
      node(entrynode).nlinks = node(entrynode).nlinks + 1
      node(entrynode).link(node(entrynode).nlinks) = node(entrynode).link(1)
      node(entrynode).link(1) = 0
    Else
      node(i).mesg = ""
      Call StrToNode(i, a$)
      If Len(node(i).mesg) = 0 Then  ' LNK text may be saved in node().mesg
        node(i).mesg = ReadDataIni(m$, n$, "Mesg")
      End If
    
      Rem Read Links (link1/link2/link3...)
      Call StrToLinks(i, ReadDataIni(m$, n$, "Links"))
    End If
  
    icenum = StrToIce(i, icenum, ReadDataIni(m$, n$, "ICEType"))
    k = 1
    Do
      h = icenum
      icenum = StrToIce(i, icenum, ReadDataIni(m$, n$, "ICEType" & Format(k)))
      k = k + 1
    Loop While icenum > h
    node(i).perpresent = Val(ReadDataIni(m$, n$, "PERPresent"))
    
    Rem Read Data files (Filename/MP/value ...)
    Call StrToFiles(i, ReadDataIni(m$, n$, "Files"))
  Next i
  
  ICEnrLabel.Caption = "ICEs: " & Format(icenum)
  h = TestMatrix(False)
  For i = 1 To nodenum
    node(i).visited = -2
  Next i
  dirtyflag = False

End Sub

Sub m_about_Click ()
  Form4.Show
End Sub

Sub m_exit_Click ()
  Dim m As Integer

  If dirtyflag Then
    m = MsgBox("Save Matrix changes?", MB_ICONQUESTION + MB_YESNOCANCEL + MB_DEFBUTTON1)
    If m = IDOK Then Call m_saveltg_click
    If m = IDCANCEL Then GoTo m_exit_end
  End If
  Call SaveFormPosition("Mated.Form1", CSng(Form1.Left), CSng(Form1.Top))
  End
m_exit_end:
End Sub

Sub m_loadltg_Click ()
  Rem "File Load Matrix"
  Dim i%

  On Error Resume Next
  Stddialog1.DialogTitle = " Load Matrix"
  Stddialog1.InitDir = datapath$
  Stddialog1.Action = 1

  If Err = 0 Then
    LoadLTG (Stddialog1.Filename)
  End If
  
  Picture1.Cls
  Picture1_Paint

End Sub

Sub m_ltgimagepath_Click ()
  Dim i%

  On Error Resume Next
  Stddialog2.DialogTitle = " Choose Special Image Path (select file CPU0.BMP)..."
  Stddialog2.InitDir = progpath$
  Stddialog2.CancelError = True
  Stddialog2.Action = 1

  If Err = 0 Then
    LTGImagePath = Stddialog2.Filename
    For i = Len(LTGImagePath) To 1 Step -1
      If (Mid$(LTGImagePath, i, 1) = "\") Then
        LTGImagePath = Left$(LTGImagePath, i)
        Exit For
      End If
    Next i
  Else
    LTGImagePath = ""
  End If

End Sub

Sub m_matrixstat_Click ()
  
  Form8.Caption = "Matrix Analyze"
  Form8.Show
  NewPadGM (MatrixStatistic())
  
End Sub

Sub m_new_Click ()
  Dim i%

  nodenum = 0
  icenum = 0
  shutdowntics = 0
  emergeperc = 101#
  emergetics = -1
  alert = ALERTNONE
  deck.range = RANGEOBS
  entrynode = 1
  NodenrLabel.Caption = "Nodes: " & Format(nodenum)
  ICEnrLabel.Caption = "ICEs: " & Format(icenum)
  MsgTextBox.Text = ""
  MatnameText.Text = "New LTG"
  For i = 0 To MAXNODENUM
    Call StrToNode(i, "")
  Next i
  Call StrToNode(0, "MAT Green-4")
  node(0).mesg = ""
  node(0).nlinks = 0
  lastnode = -1
  Picture1.Cls

End Sub

Sub m_readonly_Click ()
    If (m_readonly.Checked) Then
      m_readonly.Checked = False
      matreadonly = False
    Else
      m_readonly.Checked = True
      matreadonly = True
    End If
End Sub

Sub m_saveltg_click ()
  Rem "File Save LTG"

  On Error Resume Next
  Stddialog1.DialogTitle = " Save Matrix"
  Stddialog1.InitDir = datapath$
  Stddialog1.Action = 2

  If Err = 0 Then
    Call SaveLTG(Format$(Stddialog1.Filename), True)
    dirtyflag = False
  End If

End Sub

Sub m_starthelp_Click ()
  Dim ret%
  Dim dwdata As Variant

  ret = WinHelp(Form1.hWnd, progpath$ & "cyber.hlp" & Chr$(0), &H3, dwdata)
End Sub

Sub MatnameText_Change ()
  matrixname$ = Format(MatnameText.Text)
End Sub

Sub MsgTextBox_Change ()
  If curnode >= 0 Then
    node(curnode).mesg = MsgTextBox.Text
  Else
    pad.Caption = "Input text only when a node is selected!"
    MsgTextBox.Text = ""
  End If
End Sub

Sub MyPolygon (npnts%, colout&, colin&)
  Dim i%
  Dim cx#, cy#

  For i = 0 To npnts - 2
    Picture1.Line (pntdata(i).X, pntdata(i).Y)-(pntdata(i + 1).X, pntdata(i + 1).Y), colout
  Next i
  If npnts >= 3 Then
    Picture1.ForeColor = colin
    Picture1.FillColor = colin
    cx = .5 * (pntdata(0).X + pntdata(2).X)
    cy = .5 * (pntdata(0).Y + pntdata(2).Y)
    FloodFill Picture1.hDC, cx, cy, colout   ' BLACK is color of boundaries
  End If
End Sub

Sub Option3D1_Click (Index As Integer, Value As Integer)
  
  noderate = Index + 1
  
  If nodetype = 7 Then   ' LNK-node?
    SelNodetypLabel.Caption = nodetypestr(nodetype) & " " & nodecolorstr(nodecolor)
  Else
    SelNodetypLabel.Caption = nodetypestr(nodetype) & " " & nodecolorstr(nodecolor) & "-" & Format(noderate)
  End If
End Sub

Sub Option3D2_Click (Index As Integer, Value As Integer)
  Rem Set global alert status

  If Value = True Then
    alert = Index
  End If

End Sub

Sub Picture1_MouseDown (Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim cx#, cy#, sclx#, scly#
  Dim fcolor As Long
  Dim npnts%, i%
  Dim xpos%, ypos%

  sclx = Picture1.ScaleWidth / NX
  scly = Picture1.ScaleHeight / NY
  
  xpos = Int(X / sclx + .5)
  ypos = Int(Y / scly + .5)
  Debug.Print "MouseDown at "; xpos, ypos

  curnode = -1
  For i = 1 To nodenum
    If node(i).xpos = xpos And node(i).ypos = ypos Then
      curnode = i
      MsgTextBox.Text = node(curnode).mesg
      Label3.Caption = "Message in Node" & Format(curnode)
      Exit For
    End If
  Next i

  If Button = 1 And modus = SETMODE Then
    If curnode = -1 Then
      ' Set new node
      curnode = nodenum + 1
      Call SetaNode(curnode, nodetypestr(nodetype), nodecolor, noderate, xpos, ypos, True)
      NodenrLabel.Caption = "Nodes: " & Format(nodenum)
      pad.Caption = "Set Node" & Format(curnode) & " to " & GetNodeDescription(curnode)
      If nodetypestr(nodetype) = "LNK" And Len(node(curnode).mesg) = 0 Then
        pad.Caption = "Input filename of linked LTG in message textbox and add it's entry node from here (e.g. firstrun.ltg 1)"
      End If
    Else
      ' Change node
      Call SetaNode(curnode, nodetypestr(nodetype), nodecolor, noderate, xpos, ypos, False)
      pad.Caption = "Change Node" & Format(curnode) & " to " & GetNodeDescription(curnode)
      If nodetypestr(nodetype) = "LNK" And Len(node(curnode).mesg) = 0 Then
        pad.Caption = "Input filename of linked LTG in message textbox and add it's entry node from here (e.g. firstrun.ltg 1)"
      End If
    End If
    MsgTextBox.Text = node(curnode).mesg
    If nodetypestr(nodetype) = "LNK" Then
      Label3.Caption = "LTG-filename+ +entry node:"
    Else
      Label3.Caption = "Message in Node " & Format(curnode)
    End If
  ElseIf Button = 2 And modus = SETMODE And curnode <> -1 Then
    ' really delete a node
    pad.Caption = "Delete Node" & Format(curnode)
    Call DelaNode(curnode, xpos, ypos)
    NodenrLabel.Caption = "Nodes: " & Format(nodenum)
    ICEnrLabel.Caption = "ICEs: " & Format(icenum)
  ElseIf modus = MOVEMODE Then
    If lastnode = -1 Then
      lastnode = curnode   ' define node to move
      pad.Caption = "Move Node" & Format(curnode) & " to... (click on new position)"
    Else
      If curnode = -1 Then
        node(lastnode).xpos = xpos
        node(lastnode).ypos = ypos
        lastnode = -1
        pad.Caption = "Select next node to move."
      Else
        pad.Caption = "New position must be free."
      End If
    End If
  ElseIf Button = 1 And modus = LNKMODE And curnode <> -1 Then
    If lastnode = -1 Then
      lastnode = curnode   ' set "from" node for link
      pad.Caption = "Connect node" & Format(lastnode) & " with..."
    Else
      ' connect the two nodes
      If lastnode <> curnode Then
        Call Addlink(lastnode, curnode)
        Call Addlink(curnode, lastnode)
        pad.Caption = "Connect Node " & Format(lastnode) & " with " & Format(curnode)
        lastnode = -1
        curnode = -1
      End If
    End If
  ElseIf Button = 2 And modus = LNKMODE And curnode <> -1 Then
    If lastnode = -1 Then
      lastnode = curnode   ' set "from" node for link
      pad.Caption = "Disconnect node" & Format(lastnode) & " from..."
    Else
      If lastnode <> curnode Then
        pad.Caption = "Disconnect node " & Format(lastnode) & " from " & Format(curnode)
        Call DelLink(lastnode, curnode)
        Call DelLink(curnode, lastnode)
        curnode = -1
      End If
    End If
  ElseIf Button = 1 And modus = DATMODE And curnode <> -1 Then
    If node(curnode).typ <> "DS" Then
      pad.Caption = "This is not a Datastore! However you may place your files here anyway."
    Else
      pad.Caption = "Edit data of node" & Format(curnode) & " in the data file section."
    End If
    Frame3D2.Enabled = True
    Label2(19).Caption = "In Node: " & Format(curnode)
    ShowFileList (curnode)
  ElseIf Button = 1 And modus = ICEMODE And curnode <> -1 Then
    If node(curnode).colnr = 1 Then
      pad.Caption = "This is a blue node, where ICE normally do not occur!"
    Else
      pad.Caption = "Edit ICE of node" & Format(curnode) & " in the ICE construction section."
    End If
    If node(curnode).typ = "LNK" Then
      pad.Caption = "Placing ICE in a LinkLoad node does not make sense."
    End If
    Form2.Show
    Picture1.Cls
    Picture1_Paint
  End If

  Picture1.Cls
  Picture1_Paint

End Sub

Sub Picture1_Paint ()
  Rem --- AutoRedraw the complete LTG ---
  Rem This routine may be used by the Cyberspace and Mated program
  Dim nodenr%, k%, i%
  Dim sclx#, scly#
           
  Rem -- Draw the links (if one of the two node was already visited) --
  For nodenr = 1 To nodenum
    For k = 1 To node(nodenr).nlinks
      i = node(nodenr).link(k)
      ' Don't draw link to external matrix
      If i > 0 And nodenr > 0 And (node(i).visited <> 0 Or node(nodenr).visited <> 0) Then
        sclx = Picture1.ScaleWidth / NX
        scly = Picture1.ScaleHeight / NY
        Picture1.Line (node(nodenr).xpos * sclx, node(nodenr).ypos * scly)-(node(i).xpos * sclx, node(i).ypos * scly), BLACK
      End If
    Next k
  Next nodenr
  Rem -- Draw node if it was already visited --
  For nodenr = 1 To nodenum
    If node(nodenr).visited <> 0 Then
      Call DrawNode(nodenr)
    End If
  Next nodenr

End Sub

Sub Picture2_MouseDown (Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim typ%, color%

  nodecolor = Int(6# * X / Picture2.Width) + 1
  nodetype = Int(7# * Y / Picture2.Height)
  SelNodetypLabel.Caption = nodetypestr(nodetype) & " " & nodecolorstr(nodecolor) & "-" & Format(noderate)

End Sub

Sub SetaNode (ByVal nodenr%, ByVal typ$, ByVal colnr%, ByVal rating%, ByVal xpos%, ByVal ypos%, ByVal reallyadd%)
  Rem --- Draws a node in the picture and change the node()
  Rem Input:
  Rem  xpos,ypos are in grid corrdinates
  Rem  reallyadd = True means: add node, False: change it

  dirtyflag = True
  If reallyadd = True Then
    node(nodenr).nlinks = 0  ' delete all links
    node(nodenr).mesg = ""
  End If
  node(nodenr).xpos = xpos
  node(nodenr).ypos = ypos
  node(nodenr).typ = typ$
  If node(nodenr).typ = "LNK" Then
    colnr = 0
    rating = 0
  End If
  node(nodenr).color = nodecolorstr(colnr)
  node(nodenr).colnr = colnr
  node(nodenr).rating = rating
  node(nodenr).visited = -2

  If nodenr > nodenum Then
    nodenum = nodenr
  End If
End Sub

Function Setpntdata (typ$) As Integer
  Rem --- Sets pntdata() for geometric body ---
  Rem Returns number of points needed.
  Rem For circle 0 is returned.
  Dim i%, npnts%

  npnts = 0
  Select Case typ$
    Case "SAN":
      pntdata(0).X = -150
      pntdata(0).Y = -75
      pntdata(1).X = 150
      pntdata(1).Y = -75
      pntdata(2).X = 150
      pntdata(2).Y = 75
      pntdata(3).X = -150
      pntdata(3).Y = 75
      pntdata(4).X = -150
      pntdata(4).Y = -75
      npnts = 5

    Case "DS":
      pntdata(0).X = -125
      pntdata(0).Y = -125
      pntdata(1).X = 125
      pntdata(1).Y = -125
      pntdata(2).X = 125
      pntdata(2).Y = 125
      pntdata(3).X = -125
      pntdata(3).Y = 125
      pntdata(4).X = -125
      pntdata(4).Y = -125
      npnts = 5

    Case "SPU":
      For i = 0 To 6
        pntdata(i).X = 150 * Cos(i * M_PI / 3#)
        pntdata(i).Y = 150 * Sin(i * M_PI / 3#)
      Next i
      npnts = 7

    Case "CPU":
      For i = 0 To 6
        pntdata(i).X = 120 * Cos(i * M_PI / 3#)
        pntdata(i).Y = 120 * Sin(i * M_PI / 3#)
      Next i
      For i = 0 To 6
        pntdata(i + 7).X = 150 * Cos(i * M_PI / 3#)
        pntdata(i + 7).Y = 150 * Sin(i * M_PI / 3#)
      Next i
      
      npnts = 14

    Case "IOP":
      pntdata(0).X = -150
      pntdata(0).Y = 100
      pntdata(1).X = 150
      pntdata(1).Y = 100
      pntdata(2).X = 0
      pntdata(2).Y = -120
      pntdata(3).X = -150
      pntdata(3).Y = 100
      npnts = 4
  
    Case "DLJ":
      pntdata(0).X = -140
      pntdata(0).Y = -80
      pntdata(1).X = -100
      pntdata(1).Y = -65
      pntdata(2).X = 100
      pntdata(2).Y = -65
      pntdata(3).X = 140
      pntdata(3).Y = -80
      pntdata(4).X = 140
      pntdata(4).Y = 80
      pntdata(5).X = 100
      pntdata(5).Y = 65
      pntdata(6).X = -100
      pntdata(6).Y = 65
      pntdata(7).X = -140
      pntdata(7).Y = 80
      pntdata(8).X = -140
      pntdata(8).Y = -80
      npnts = 9

    Case "LNK":
      pntdata(0).X = 0
      pntdata(0).Y = 0
      pntdata(1).X = 0
      pntdata(1).Y = 0
      npnts = 2
  
  End Select


  Setpntdata = npnts
End Function

Sub ShowFileList (nodenr%)
  Rem Show a list with the files of a node
  Dim k%
  Dim a$

  List1.Clear
  For k = 1 To node(nodenr).nfiles
    a$ = node(nodenr).file(k).name & "   " & node(nodenr).file(k).size & " Mp/" & node(nodenr).file(k).Value & " Nuyen"
    List1.AddItem a$
  Next k

End Sub

Sub Spin2_SpinDown (Index As Integer)
  
  emerg(Index) = Val(Format$(EmergText(Index).Text))
  
  Select Case Index
    Case 0: emerg(Index) = emerg(Index) - 1
    Case 1: emerg(Index) = emerg(Index) - 10
  End Select
  If emerg(Index) < 0 Then emerg(Index) = 0
  EmergText(Index).Text = emerg(Index)

End Sub

Sub Spin2_SpinUp (Index As Integer)
  
  emerg(Index) = Val(Format$(EmergText(Index).Text))
  
  Select Case Index
    Case 0: emerg(Index) = emerg(Index) + 1
    Case 1: emerg(Index) = emerg(Index) + 10
  End Select
  If emerg(Index) < 0 Then emerg(Index) = 0
  EmergText(Index).Text = emerg(Index)


End Sub

