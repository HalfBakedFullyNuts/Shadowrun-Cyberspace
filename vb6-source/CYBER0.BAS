Option Explicit
Rem ==================================================================
Rem  This Module is used by all programs:
Rem  cyberspc.exe, cybdemo.exe, cybdeck.exe, mated.exe, deckered.exe
Rem ==================================================================


Rem --- Define Constants here AND in cyber01.frm ---
Global Const SRCCOPY = &HCC0020         ' System Constants for BITBLT
Global Const SRCAND = &H8800C6
Global Const SRCPAINT = &HEE0086
Global Const NOTSRCCOPY = &H330008
Global Const WHITENESS = 16
        
Const LUNSORTED = 0
Const LNAMES = 1
Const LNAMESR = 2
Const LSIZE = 3
Const LSIZER = 4
        


Rem --- Colors ---
Global Const BLACK = &H0&
Global Const MAGENTA = &HFF00FF
Global Const CYAN = &HFFFF00
Global Const WHITE = &HFFFFFF
Global Const ORANGE = &HFFFF&    ' &H7FFF&  let orange be yellow because of few colors
Global Const DARK = &H808080
Global Const GREEN = &HFF00&
Global Const DARKGREEN = &H8000&
Global Const BLUE = &HFF0000
Global Const DARKBLUE = &H400000
Global Const PORANGE = &H80FF&
Global Const PDARKORANGE = &H40C0&
Global Const RED = &HFF&
Global Const DARKRED = &H80&
Global Const YELLOW = &HFFFF&
Global Const DARKYELLOW = &H8080&
Global Const LAMPGRAY = &H808080

Rem --- Constants for MsgBox ---
Global Const MB_OK = 0
Global Const MB_OKCANCEL = 1
Global Const MB_ABORTRETRYIGNORE = 2
Global Const MB_YESNOCANCEL = 3
Global Const MB_YESNO = 4
Global Const MB_RETRYCANCEL = 5
Global Const MB_ICONSTOP = 16
Global Const MB_ICONQUESTION = 32
Global Const MB_ICONEXCLAMATION = 48
Global Const MB_ICONINFORMATION = 64
Global Const MB_DEFBUTTON1 = 0
Global Const MB_DEFBUTTON2 = 256
Global Const MB_DEFBUTTON3 = 512
Global Const MB_APPLMODAL = 0
Global Const MB_SYSTEMMODAL = 4096
Global Const IDOK = 1
Global Const IDCANCEL = 2
Global Const IDABORT = 3
Global Const IDRETRY = 4
Global Const IDIGNORE = 5
Global Const IDYES = 6
Global Const IDNO = 7


Global Const MAXICENUM = 100
Global Const MAXSORTNUM = MAXICENUM + 1
Global Const MAXNODENUM = 100
Global Const MAXLINKSNUM = 30
Global Const MAXFILESNUM = 20
Global Const MAXPNTS = 15
Global Const ALERTNONE = 0
Global Const ALERTPASSIVE = 1
Global Const ALERTACTIVE = 2
Global Const RANGEOBS = 2
Global Const RANGESEN = 1
Global Const RANGECON = 0
Global Const ICEHIT = 3
Global Const ICEYELL = 2
Global Const ICESUSP = 1
Global Const ICELOOK = 0
Global Const ICESLEZ = -1
Global Const ICESLEA = -2
Global Const ICEDECP = -3
Global Const ICEFROZ = -4
Global Const EMOBILE = 0
Global Const PMOBILE = 1
Global Const AMOBILE = 2
Global Const IMOBILE = 3
Global Const M_PI = 3.1415927
Global Const DECEPT_APPROP = 1
Global Const DECEPT_ALL = 0


Type pnt
  X As Integer
  Y As Integer
End Type
Global pntdata(0 To MAXPNTS) As pnt

Type bitmap
  bmType As Integer
  bmWidth As Integer
  bmHeight As Integer
  bmWidthBytes As Integer
  bmPlanes As String * 1
  bmBitsPixel As String * 1
  bmBits As Long
End Type
   
Rem --- Functions for Transparent Bitmap ---
Declare Function BitBlt Lib "GDI" (ByVal srchDC%, ByVal srcX%, ByVal srcY%, ByVal srcW%, ByVal srcH%, ByVal desthDC%, ByVal destX%, ByVal destY%, ByVal op As Long) As Integer
Declare Function SetBkColor Lib "GDI" (ByVal hDC%, ByVal cColor As Long) As Long
Declare Function CreateCompatibleDC Lib "GDI" (ByVal hDC As Integer) As Integer
Declare Function DeleteDC Lib "GDI" (ByVal hDC As Integer) As Integer
Declare Function CreateBitmap Lib "GDI" (ByVal nWidth%, ByVal nHeight%, ByVal cbPlanes%, ByVal cbBits%, lpvBits As Any) As Integer
Declare Function CreateCompatibleBitmap Lib "GDI" (ByVal hDC%, ByVal nWidth%, ByVal nHeight%) As Integer
Declare Function SelectObject Lib "GDI" (ByVal hDC%, ByVal hObject%) As Integer
Declare Function DeleteObject Lib "GDI" (ByVal hObject As Integer) As Integer
Declare Function GetDeviceCaps Lib "GDI" (ByVal hDC%, ByVal nIndex%) As Integer
Declare Function GetObj Lib "GDI" Alias "GetObject" (ByVal hObject As Integer, ByVal nCount As Integer, bmp As Any) As Integer
Declare Function UpdateColors Lib "GDI" (ByVal hDC As Integer) As Integer

Declare Function sndPlaySound Lib "MMSYSTEM.DLL" (ByVal lpszSoundName$, ByVal wFlags%) As Integer
Declare Function waveOutGetNumDevs Lib "MMSystem" () As Integer
Declare Function SendMessage% Lib "user" (ByVal hWd%, ByVal wMsg%, ByVal wParam%, ByVal lParam&)
Declare Sub FloodFill Lib "GDI" (ByVal hDC%, ByVal xpos%, ByVal ypos%, ByVal boundarycolor&)
 ' boundarycolor is the color of the boundaries where fill stops.
 ' set fillcolor with e.g. picture1.fillcolor=RED.
Declare Sub Polygon Lib "GDI" (ByVal hDC%, pntdata As pnt, ByVal number%)
Declare Function GetProfileInt Lib "Kernel" (ByVal lpAppName$, ByVal lpKeyName$, ByVal nDefault%) As Integer
Declare Function GetProfileString Lib "Kernel" (ByVal lpAppName$, ByVal lpKeyName$, ByVal lpDefault$, ByVal lpReturnedString$, ByVal nSize%) As Integer
Declare Function WriteProfileString Lib "Kernel" (ByVal lpAppName$, ByVal lpKeyName$, ByVal lpString$) As Integer
Declare Function GetPrivateProfileInt Lib "Kernel" (ByVal lpAppName$, ByVal lpKeyName$, ByVal nDefault%, ByVal lpfilename$) As Integer
Declare Function GetPrivateProfileString Lib "Kernel" (ByVal lpAppName$, ByVal lpKeyName$, ByVal lpDefault$, ByVal lpReturnedString$, ByVal nSize%, ByVal lpfilename$) As Integer
Declare Function WritePrivateProfileString Lib "Kernel" (ByVal lpAppName$, ByVal lpKeyName$, ByVal lpString$, ByVal lpfilename$) As Integer
Declare Function WinHelp Lib "User" (ByVal hWnd%, ByVal lpzFileName$, ByVal wcmd%, dwData As Any) As Integer
Declare Function GetVersion Lib "Kernel" () As Long
Declare Function GetWindowsDirectory Lib "Kernel" (ByVal lpBuffer As String, ByVal nSize As Integer) As Integer



Type prgs
  Rem --- Combat Utilities ---
  attack As Integer
  blind As Integer
  hog As Integer
  poison As Integer
  restrict As Integer
  reveal As Integer
  slow As Integer

  Rem --- Defense Utilities ---
  armor As Integer    ' not refreshable (must be in active memory)
  cloak As Integer    ' not refreshable
  medic As Integer    ' degrades, refreshable
  mirrors As Integer
  restore As Integer
  shield As Integer
  smoke As Integer    ' not refreshable

  Rem --- Sensor Utilities ---
  analyze As Integer
  browse As Integer
  decrypt As Integer
  evaluate As Integer
  scanner As Integer
  sift As Integer

  Rem --- Masking Utilities ---
  deception As Integer
  relocate As Integer
  sleaze As Integer

  Rem --- Operation Utilities ---
  auto_execute As Integer
  compressor As Integer
  controller As Integer

End Type

Type cyberdecktype
  model As String
  mpcp As Integer
  bod As Integer
  evasion As Integer
  masking As Integer
  sensor As Integer
  hardening As Integer
  response As Integer
  activemem As Integer
  activeprogmem As Integer
  storagemem As Integer
  storageprogmem As Integer
  load As Integer
  io As Integer
  satuplink As Integer      ' ability of deck to do satellite uplinks
  onuplink As Integer       ' 0 = no satellite uplink, 1 = running thru uplink
  realfilter As Integer     ' 0 = no Reality Filter
  realfilteruse As Integer  ' 0 = no use
  purecyber As Integer      ' 0 = no pure cybernetic link
  compressed As Integer     ' 0 = no, r=compression rating (max 100 Mp * r)
  damage As Integer
  dicereact As Integer      ' Reaction dices (e.g. 3D) for decker's actions in the matrix
  dreaction As Integer      ' Reaction add (e.g. +10) for decker's actions in the matrix (incl. all device modifiers and dam mods)
  lastnode As Integer       ' node last visited (for step back)
  range As Integer          ' 2=observation, 1=sensor, 0=contact
  add(5) As Integer         ' additional persona rating due to ARMOR/MIRRORS/CLOAK/-- (counts positive)
  chg(5) As Integer         ' manual downscale of BOD/EVA/MASK/SENS (e.g. because of Reality Filter MPCP-1) additive change counts positive
  dam(5) As Integer         ' damage done to the  BOD/EVA/MASK/SENS/MPCP  (counts positive)
  oripp(5) As Integer       ' original rating of  BOD/EVA/MASK/SENS/MPCP  (no temporary damage!)
  restr(5) As Integer       ' rating of the program that did the damage to BOD/EVA/MASK/SENS/MPCP
  usedprgs As prgs
  modattack As Integer
  moddeception As Integer
  modsleaze As Integer
  moddecrypt As Integer
  modmedic As Integer  ' modmirrors=addeva, modcloak=addmask, modarmor=addbod
  modsmoke As Integer
  modshield As Integer
  modload As Integer
  ratearmor As Integer
  ratecloak As Integer
  ratemedic As Integer
  ratemirrors As Integer
  rateshield As Integer
  ratesmoke As Integer
  resleazetics As Integer    ' tics to wait for end of sleaze
  hangtough As Integer       ' = True (jack out failed while BLACK Ice attacked-> no resistence)
  istraced As Integer        ' True: Decker's location is reported by Trace ICE
  displaymode As Integer     ' 0=Standard,1=Advanced,2=Sculpted
End Type


Type filetype
  name As String
  size As Long
  Value As Currency
End Type

Type nodetype
  typ As String              ' SAN, SPU, CPU, IOP, SM (SN), DS, MAT
  color As String            ' Blue, Green, Orange, Red, Purple, Dark
  colnr As Integer           ' 1=Blue, 2=Green, 3=Orange, 4=Red
  rating As Integer          ' Node rating
  xpos As Integer            ' x-grid-coordinate for net display
  ypos As Integer            ' y-grid-coordinate for net display
  mesg As String             ' arbitrary message shown at contact range
  failsysop As Integer       ' number of failed system operations in this node
  nodeanatarget As Integer   ' modified analyze Target, if former analyze failed
  nodeevaltarget As Integer  ' modified Evaluate Target, if former Evaluate failed
  nodesifttarget As Integer  ' modified Sift Target, if former Sift failed
  nodebrowsetarget As Integer ' modified Browse Target, if former Browse failed
  visited As Integer         ' True=Decker has visited this node
  curlink As Integer         ' current link to other node
  nlinks As Integer          ' number of links to other nodes (1..nlinks)
  link(MAXLINKSNUM) As Integer        ' contains node numbers connected with current node
  nfiles As Integer          ' number of data files in this node
  file(MAXFILESNUM) As filetype       ' Filename/110 MP / 20000 NewYen...
  locked As Integer          ' tic number for which the SAN is locked
  icesleep As Integer        ' # of sleeping ICE in this node
  iceactive As Integer       ' # of activated ICE in this node
  perpresent As Integer      ' number of corporations personas in this node
End Type

Type deckertype
  name As String
  body As Integer
  quickness As Integer
  strength As Integer
  charisma As Integer
  intelligence As Integer
  willpower As Integer
  computer As Integer        ' Computer/Software/Decking attribute
  etiqmatrix As Integer      ' Etiquette/Matrix attribute
  reaction As Integer        ' 6 (ohne Cyberware)
  reactdice As Integer       ' 1[D6] (ohne Cyberware)
  hackingpool As Integer
  lefthacking As Integer     ' hacking pool left for next action (variable)
  spendhacking As Integer    ' max hacking pool dices used by decker
  hackingorig As Integer     ' original hacking pool
  hackingallo As Integer     ' allocated hacking pool to suppress alerts
  karma As Integer           ' Karma points left
  damage_phys As Integer     ' physical damage (0-10), the decker takes
  damage_stun As Integer     ' stun damage (0-10), the decker takes
  team As Integer            ' team pool
  ini As Integer             ' rolled initiative
End Type

Type icetype
  code As String             ' White, Gray, Black
  description As String      ' e.g. Access, Killer (M)
  rating As Integer          ' rating of ICE e.g. 6
  damage As Integer
  modana As Integer          ' modifier for analyze
  modtar As Integer          ' modifier for decker programs due to stalemate
  modtrace As Integer        ' only for TRACE ICE
  tracetics As Long          ' only for TRACE ICE: turns until decker's entry location is found
  ' tracetics = -3 (flees/don't attack), -2 (Trace and Dump), -1 (Trace and Burn Blaster), or number of turns
  active As Integer          ' Activity status: 0 ever present, 1 present at passive alert, 2 present at active alert, 3 must be triggered explicitely through other ICE
  mobile As Integer          ' 0/1/2/3 if ICE is mobile, pmobile, amobile or stays in node
  satisfaction As Integer    ' -4=frozen, -3=decepted, -2,-1 = fooled, 0=wants passcode, 1=triggers passive alert, 2=triggers active alert, 3=just hits
  succattacked As Integer    ' True/False if ICE has been successfully attacked by the decker
  succslowed As Integer      '
  ini As Integer             ' rolled initiative of ICE
  freezemod As Integer        ' Initiative modifiers due to SLOW-program
  range As Integer           ' 0/1/2 for Contact, Sensor, Observation
  nodenr As Integer          ' node number
  lastnode As Integer        ' last node number
  ptrigger As Integer        ' ICEnr triggered when this ICE gets ICESUSP  (-1 no ICE, -2 all ICE with active=3)
  atrigger As Integer        ' ICEnr triggered when this ICE gets ICEYELL
End Type

Global deck As cyberdecktype ' attributes of the cyberdeck
Global decker As deckertype  ' attributes of the decker
' Global range As Integer      ' 2=Observation, 1=Sensor, 0=Contact
Global inifile As String     ' path+name of initialization file
Global ltgfile As String     ' current Matrix filename with path
Global progpath As String    ' current path for programs to load (root path for data/images/sounds)
Global imagepath As String   ' current path for image loading
Global datapath As String    ' current data path for loading
Global soundpath As String   ' current sound path for loading
Global ltgimagepath As String ' path defined in *.ltg for special images
Global nodenum As Integer    ' number of node in this matrix
Global entrynode As Integer  ' number of entry node in this LTG
Global icenum As Integer     ' number of ICEs in this matrix
Global node(0 To MAXNODENUM) As nodetype  ' all attributes of the node
Global ice(0 To MAXICENUM) As icetype    ' all attributes of ICEs
Global icebehavior As Integer ' DECEPT_APPROP | DECEPT_ALL
Global iceofnode(0 To MAXICENUM) As Integer ' indices of all active ICEs in current node (node(..).iceactive gives their number)
Global icesleepofnode(0 To MAXICENUM) As Integer ' indices of all sleeping ICEs in current node (node(..).icesleep gives their number)
Global iceorder(0 To MAXSORTNUM) As Integer   ' ICE sorted by Initiative
Global sorticeini(0 To MAXSORTNUM) As Integer ' array containing sorted initiative of ICE
Global matrixname As String  ' name of the Matrix
Global curnode As Integer    ' number of current node
Global attacked As Integer   ' ICE got attacked in this node
Global modalert As Single    ' 1.0 if normal, 1.5 if passive or active alert
Global alert As Integer      ' 0=none, 1=passive alert,2=active alert
Global timetics As Integer   ' combat turns needed for special actions of the decker
Global roundssinceload As Long ' rounds since last load for substraction from "node().locked" and "shutdowntics", when decker has left the matrix via LNK
Global rangetypes(3) As String ' Observation, Sensor, Contact
Global skilltype As String   ' Computer/Decking/Software/None
Global damlev(0 To 3) As Integer ' = 1/3/6/10 (initialized in Form1.Form)
Global sysirqtics As Integer    ' tics to next system inquiry
Global tw(0 To 18) As Integer   ' manually rolled dices targets (init in Form1.Form)
Global wt(0 To 15) As Integer   ' target of index of manually rolled dices images
Global retdata As Long          ' data file number choosen in Form7 or persona program number in Form12, or return value from Form18
Global dicestr As String        ' String containing sorted result of last roll
Global dicearr(0 To 100) As Integer ' result of last roll, unsorted
Global sortdicearr(0 To 100) As Integer ' result of last roll, sorted
Global shutdowntics As Integer  ' turns left until system is shut down
Global dirtyflag As Integer     ' is true, if changes are made in cyberdeck configuration
Global padclearlen As Integer   '  1 in CYBDECK, 6 in CYBERSPC
Global padwidth As Integer      ' ca. width of pad in chars (e.g. 30)
Global onsatellite As Integer   ' True = Show satellite pictures
Global icetypes(0 To 14) As String ' Names of ICE
Global icedisplay As Integer    ' 0=Standard, 1=Advanced, 2=Sculpted Reality
Global playsound As Integer     ' 0=No Sound, 1=Play Sound
Global isdemo As Integer        ' true/false
Global emergeperc As Single     ' defines percentage of ICE which is crashed for SystemOperators considering System Shutdown
Global emergetics As Long       ' Tics for Reaction when emergeperc is exceeded
Global icecrashed As Integer    ' Number of ICE which is crashed
Global failedload As Integer    ' Number of failed ICE images loading attemps (warning message is turned off)
Global proglist() As String     ' list of programs for saving. Needs to get redim'ed.
Global datashowed As Integer    ' only show data once
Global logfiletrue As Integer   ' =True/false save logfile
Global logfilename As String    ' Name of logfile
Global sortstorage As Integer   ' 0/1/2/3/4 sort by unsorted/by names/by names reserved order/by size/by size reversed
Global matreadonly As Integer   ' True/False Matrix is read only (used for AUTO SAVE connected grids)

Function atn2 (Y#, X#) As Double
  Rem Returns arctan for [-pi,+pi] taking all signs into account
  Dim ret#

  If X = 0 Then         ' special case x = 0 would result in a division by zero
    If Y >= 0 Then
      ret = M_PI * .5
    Else
      ret = -M_PI * .5
    End If
  Else
    ret = Atn(Y / X)    ' normal case
  End If
  If X < 0 And Y >= 0 Then
    ret = M_PI + ret
  ElseIf X < 0 And Y < 0 Then
    ret = -M_PI + ret
  Else
    ret = ret
  End If

  atn2 = ret

End Function

Function CheckWin95Filename (filename As String) As Integer
  Rem This functions checks pathes for a long Win95 filename
  Rem (other than 8+3). Return True when found.

  Dim i As Integer
  Dim ks As Integer
  Dim kd As Integer
  Dim a As String
  Dim retval As Integer
  
  i = 0
  a = filename
  retval = False
  If (Len(a) > 3) Then
    If (Mid$(a, 2, 1) = ":") Then a = Mid$(a, 3)
  End If
  If (Len(a) > 0) Then
    If (Mid$(a, 1, 1) = "\") Then a = Mid$(a, 2)
  End If
  Do While (i < Len(a))
    ks = InStr(i + 1, a$, "\")
    kd = InStr(i + 1, a$, ".")
    If (ks <= i) Then ks = Len(a) + 1
    If (((ks - i) > 9 And (kd > ks Or kd <= i)) Or ((kd - i) > 9 And (ks > kd Or ks <= i)) Or ((ks - kd) > 4 And kd > i)) Then
      retval = True
      Exit Do
    End If
    i = ks
  Loop
  CheckWin95Filename = retval

End Function

Function ExtractPath (a As String) As String
  Dim b As String
  Dim i As Integer

  i = Len(a$)
  Do While i > 0
    If Mid$(a$, i, 1) = "\" Then Exit Do
    i = i - 1
  Loop
  If i = 0 Then i = 1
  Debug.Print "ExtractPath="; Left$(a$, i)
  ExtractPath = Left$(a$, i)

End Function

Function GetAllICEofNode (nodenr%) As Integer
  Rem Returns number of all ICE (active and sleeping) in a node for SaveLTG
  Dim i%, ret%

  ret = 0
  For i = 0 To icenum - 1
    If ice(i).nodenr = nodenr Then
      iceofnode(ret) = i
      ret = ret + 1
    End If
  Next i
  GetAllICEofNode = ret

End Function

Function GetFormPosition (keyname$) As String
  Dim geom$, windir$
  
  windir$ = GetWindowsDir()
  inifile$ = windir$ + "CYBERSPC.INI"
  geom$ = ReadDataIni(inifile$, "Cyberspace Program", keyname$ + ".Geometry")
  If Len(geom$) = 0 Then geom$ = "+0+0"
  GetFormPosition = geom$
End Function

Function GetFormXPosition (keyname$) As Single
  GetFormXPosition = Val(GetFormPosition(keyname$))
End Function

Function GetFormYPosition (keyname$) As Single
  Dim geom$
  Dim c, i As Integer

  geom$ = GetFormPosition(keyname$)
  i = 0
  For i = 1 To Len(geom$)
    c = Asc(Mid$(geom$, i, 1))
    If ((c < Asc("0") Or c > Asc("9")) And c <> Asc(".")) Then Exit For
  Next i
  GetFormYPosition = Val(Mid$(geom$, i))
End Function

Function GetPathes () As String
  Dim i%
  Dim windir$
  Rem inifile$ is global

  windir$ = GetWindowsDir()
  inifile$ = windir$ + "CYBERSPC.INI"
  progpath$ = ReadDataIni(inifile$, "Cyberspace Program", "ProgPath")
  datapath$ = ReadDataIni(inifile$, "Cyberspace Program", "DataPath")
  imagepath$ = ReadDataIni(inifile$, "Cyberspace Program", "ImagePath")
  soundpath$ = ReadDataIni(inifile$, "Cyberspace Program", "SoundPath")

  If Len(progpath$) = 0 Then
    i = MsgBox("The " & inifile$ & " is missing or corrupt. This is okay when running the program for the first time or from a CDROM. If not you may have had an installation problem (read the INSTALL). Press OKAY to create the file automatically.", MB_OKCANCEL)
    If i = IDOK Then
      progpath$ = App.Path
      If Len(progpath$) > 0 Then
        If Right$(progpath$, 1) <> "\" Then progpath$ = progpath$ & "\"
      End If
      progpath$ = LCase$(progpath$)
      datapath$ = progpath$ + "data\"
      imagepath$ = progpath$ + "images\"
      soundpath$ = progpath$ + "sounds\"
      i = WritePrivateProfileString("Cyberspace Program", "ProgPath", progpath$, inifile$)
      i = WritePrivateProfileString("Cyberspace Program", "DataPath", datapath$, inifile$)
      i = WritePrivateProfileString("Cyberspace Program", "ImagePath", imagepath$, inifile$)
      i = WritePrivateProfileString("Cyberspace Program", "SoundPath", soundpath$, inifile$)
    End If
  End If
  If Len(datapath$) = 0 Then datapath$ = progpath$ & "data\"
  If Len(imagepath$) = 0 Then imagepath$ = progpath$ & "images\"
  If Len(soundpath$) = 0 Then soundpath$ = progpath$ & "sounds\"
  GetPathes = inifile$
  
End Function

Function GetWindowsDir () As String
  Rem Calls the windows API to get the windows directory
  Dim temp As String
  Dim X As Integer

  temp$ = String$(145, 0)              ' Size Buffer
  X = GetWindowsDirectory(temp$, 145)  ' Make API Call
  temp$ = Left$(temp$, X)              ' Trim Buffer

  If Right$(temp$, 1) <> "\" Then      ' Add \ if necessary
    GetWindowsDir$ = temp$ + "\"
  Else
    GetWindowsDir$ = temp$
  End If
End Function

Function GetWord (a$, b$) As String
  ' retrieve next word from a$ delimited by $b, return it and let a$ be the rest
  Dim c$
  Dim h%

  h = InStr(a$, b$)
  If h > 0 Then
    c$ = Left$(a$, h - 1)
    a$ = Mid$(a$, h + 1)
  Else
    c$ = a$
    a$ = ""
  End If
  GetWord = c$

End Function

Sub NewPad (s$)
  Dim pos%
  Dim n%
  Dim start%
  Dim a$
  Dim fo
  a$ = Form1.pad.Caption
  If Len(a$) > 0 Then
    a$ = a$ & Chr$(10) & Chr$(13) & s$
  Else
    If Len(s$) > 0 Then
      a$ = s$
    End If
  End If
  Rem Logfile
  If logfiletrue Then
    fo = FreeFile
    On Error Resume Next
    Open logfilename$ For Append Access Write As fo
    Print #fo, Format(roundssinceload, "0000"); " -- "; s$
    If Err <> 0 Then
      logfiletrue = False
      logfilename$ = ""
      NewPad ("Error writing logfile!!!")
    Else
      Close #fo
    End If
  End If
  Do
    start = 1
    n = 0
    pos = InStr(a$, Chr$(10))
    While pos >= start
      n = n + Int((pos + 1 - start) / padwidth + .99)
      start = pos + 1
      pos = InStr(start, a$, Chr$(10))
    Wend
    If n > padclearlen Then a$ = Mid$(a$, InStr(a$, Chr$(13)) + 1)
  Loop Until n <= padclearlen
  Form1.pad.Caption = a$

End Sub

Sub QSortI (sorta() As Integer, idx() As Integer, ByVal l As Integer, ByVal r As Integer)
  Rem  Quicksort Algorithm for sorting integers
  Dim last As Integer
  Dim i As Integer
  
  If (l >= r) Then GoTo endqsorti
  
  Call SwapI(idx(), l, (l + r) \ 2)
  last = l
  For i = l + 1 To r
    If sorta(idx(i)) < sorta(idx(l)) Then
      last = last + 1
      Call SwapI(idx(), last, i)
    End If
  Next i
  Call SwapI(idx(), l, last)
  Call QSortI(sorta(), idx(), l, last - 1)
  Call QSortI(sorta(), idx(), last + 1, r)

endqsorti:

End Sub

Sub QSortS (sorta() As String, idx() As Integer, ByVal l As Integer, ByVal r As Integer)
  Rem  Quicksort Algorithm for sorting strings
  Dim last As Integer
  Dim i As Integer
  
  If (l >= r) Then GoTo endqsorts
  
  Call SwapI(idx(), l, (l + r) \ 2)
  last = l
  For i = l + 1 To r
    If sorta(idx(i)) < sorta(idx(l)) Then
      last = last + 1
      Call SwapI(idx(), last, i)
    End If
  Next i
  Call SwapI(idx(), l, last)
  Call QSortS(sorta(), idx(), l, last - 1)
  Call QSortS(sorta(), idx(), last + 1, r)

endqsorts:
End Sub

Sub QuickSortInt (sa() As Integer, idx() As Integer, n%, full%)
  Rem --- Quicksort sa ---
  Dim i As Integer
  ReDim sorta(0 To n - 1) As Integer
  
  If full = True Then
    For i = 0 To n - 1
      idx(i) = i
      sorta(i) = sa(i)
    Next i
  End If

  Call QSortI(sorta(), idx(), 0, n - 1)

  Debug.Print "----"
  For i = 0 To n - 1
    Debug.Print "Prgnr="; idx(i); " Size="; sorta(idx(i))
  Next i


End Sub

Sub QuickSortStr (sa() As String, idx() As Integer, n As Integer, full%)
  Rem --- Quicksort sa ---
  Dim i As Integer
  ReDim sorta(0 To n - 1) As String
  
  If full = True Then
    For i = 0 To n - 1
      idx(i) = i
      sorta(i) = sa(i)
    Next i
  End If

  Call QSortS(sorta(), idx(), 0, n - 1)
  Debug.Print "----"
  For i = 0 To n - 1
    Debug.Print "Prg="; sa(idx(i)); " sorta="; sorta(idx(i))
  Next i


End Sub

Function ReadDataIni (file$, App$, key$) As String
   Dim lpAppName$, lpDefault$, lpReturnstring$, lpfilename$, lpKeyName$
   Dim size%, valid%

   lpAppName$ = App$
   lpDefault$ = ""
   lpReturnstring$ = Space$(1023)
   size = Len(lpReturnstring$)

   lpfilename$ = file$

   lpKeyName$ = key$
   valid = GetPrivateProfileString(lpAppName$, lpKeyName$, lpDefault$, lpReturnstring$, size, lpfilename$)
   ReadDataIni = Left$(lpReturnstring$, valid)

End Function

Function readline (max As Long, fi As Integer) As String
  Rem --- Reads a line until end of line
  Rem     or max characters read
  Rem     or end of file. ---
  Dim c As String
  Dim i As Long
  Dim a$

  a$ = ""
  i = 0
  Do Until EOF(fi)
    c = Input$(1, fi)
    If Asc(c) = 13 Or i >= max Then Exit Do
    a$ = a$ & c
    i = i + 1
  Loop
  readline = a$
End Function

Function ReadWinIni (App$, key$) As String
   Dim lpAppName$, lpDefault$, lpReturnstring$, lpKeyName$
   Dim size%, valid%

   
   lpAppName$ = App$
   lpKeyName$ = key$
   lpDefault$ = ""
   lpReturnstring$ = Space$(1024)
   size% = Len(lpReturnstring$)
   valid% = GetProfileString(lpAppName$, lpKeyName$, lpDefault$, lpReturnstring$, size%)
   ReadWinIni = Left$(lpReturnstring$, valid%)

End Function

Sub SaveFormPosition (keyname$, xpos As Single, ypos As Single)
  Dim i%
  Dim a$

  If xpos >= 0 Then a$ = "+" + Format(xpos)
  If ypos >= 0 Then a$ = a$ + "+" + Format(ypos)
  i = WritePrivateProfileString("Cyberspace Program", keyname$ + ".Geometry", a$, inifile$)

End Sub

Sub SetPathes (inifile$)
  Dim i As Integer

  i = WritePrivateProfileString("Cyberspace Program", "ProgPath", progpath$, inifile$)
  i = WritePrivateProfileString("Cyberspace Program", "DataPath", datapath$, inifile$)
  i = WritePrivateProfileString("Cyberspace Program", "ImagePath", imagepath$, inifile$)
  i = WritePrivateProfileString("Cyberspace Program", "SoundPath", soundpath$, inifile$)
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

Sub SortListBy (List As ListBox, sorttype As Integer)
  Dim n As Integer
  Dim i As Integer
  ReDim sa(List.ListCount) As String
  ReDim sb(List.ListCount) As String
  ReDim idx(List.ListCount) As Integer
  ReDim a(List.ListCount) As Integer
  Dim p$, q$
  
  n = List.ListCount
  If sorttype <> LUNSORTED And n > 0 Then
    Select Case sorttype
      Case LNAMES, LNAMESR: ' sort by names
        For i = 0 To n - 1
          sa(i) = List.List(i)
          sb(i) = List.List(i)
          p$ = GetWord(sb(i), "-")
          If Val(sb(i)) > 99 Then
            sb(i) = sa(i)
          Else
            q$ = sb(i)
            sb(i) = p$ + "-" + Format$(Val(q$), "00")
            p$ = GetWord(q$, " ")
            sb(i) = sb(i) + " " + q$
          End If
        Next i
        Call QuickSortStr(sb(), idx(), n, True)
        List.Clear
        If sorttype = LNAMES Then
          For i = 0 To n - 1
            List.AddItem sa(idx(i))
          Next i
        Else
          For i = n - 1 To 0 Step -1
            List.AddItem sa(idx(i))
          Next i
        End If
      
      Case LSIZE, LSIZER: ' sort by size
        For i = 0 To n - 1
          p$ = List.List(i)
          sa(i) = p$
          q$ = GetWord(p$, "[")
          a(i) = Val(p$)
        Next i
        Call QuickSortInt(a(), idx(), n, True)
        List.Clear
        If sorttype = LSIZE Then
          For i = 0 To n - 1
            List.AddItem sa(idx(i))
          Next i
        Else
          For i = n - 1 To 0 Step -1
            List.AddItem sa(idx(i))
          Next i
        End If
    End Select
  End If
End Sub

Function Strbrackets (ByVal a$) As String
  Dim h%
  Dim b$

  h = InStr(a$, "(") - 2
  If h > 0 Then
    b$ = Mid$(UCase$(a$), h + 3, 1)
  Else
    b$ = ""
  End If
  Strbrackets = b$

End Function

Function StrwoBrackets (ByVal a$) As String
  Rem "Auto Execute (M)-6"  --> "Auto Execute"
  Dim h%

  h = InStr(a$, "(") - 1
  If h >= 0 Then
    StrwoBrackets = RTrim$(Left$(a$, h))
  Else
    StrwoBrackets = Trim$(a$)
  End If

End Function

Sub SwapI (idx() As Integer, ByVal i As Integer, ByVal k As Integer)
  Rem Subroutine for QSortI()
  Dim temp As Integer

  temp = idx(i)
  idx(i) = idx(k)
  idx(k) = temp

End Sub

Function TestPathes (inifile$) As Integer
  Rem --- Test if all pathes are correct ---
  Dim fi As Integer
  Dim i As Integer
  Dim ret As Integer
  Dim version As Long
  Dim winversion As Single
  Dim wintxt As String

  On Error Resume Next
  fi = FreeFile
  version = GetVersion() And &H7FFF
  winversion = (version And &HFF) + (version \ &H100)
  If winversion >= 3.95 Then wintxt = " DO NOT USE LONG Win95 directory names, else you must change the pathes to the abbreviated DOS form (e.g. C:\CYBERS~1 for C:\Cyberspace)." Else wintxt = ""
  
  Open datapath$ & "NODELIM.DAT" For Input As fi
  If LOF(fi) = 0 Then
    Debug.Print CheckWin95Filename(datapath$)
    If (CheckWin95Filename(datapath$) = False) Then wintxt = ""
    MsgBox "Data file " & datapath$ & "NODELIM.DAT not found. Please edit " & inifile$ & "." & wintxt, MB_ICONSTOP
    i = WritePrivateProfileString("Cyberspace Program", "DataPath", "", inifile$)
    End
  End If
  Close #fi
  fi = FreeFile
  Open imagepath$ & "MAT.BMP" For Input As fi
  If LOF(fi) = 0 Then
    If (CheckWin95Filename(imagepath$) = False) Then wintxt = ""
    MsgBox "Image file " & imagepath$ & "MAT.BMP not found. Please edit " & inifile$ & "" & wintxt, MB_ICONSTOP
    i = WritePrivateProfileString("Cyberspace Program", "ImagePath", "", inifile$)
    End
  End If
  Close #fi
RetryTest:
  fi = FreeFile
  If soundpath$ <> "(none)" Then
    Open soundpath$ & "SNDBOOT.WAV" For Input As fi
    If LOF(fi) = 0 Then
      If (CheckWin95Filename(soundpath$) = False) Then wintxt = ""
      ret = MsgBox("Sound file " & soundpath$ & "SNDBOOT.WAV not found. Please press ABORT and edit " & inifile$ & ". Press retry, if you copy the file to the location. If you do not want any sound, click IGNORE here.", MB_ICONSTOP + MB_ABORTRETRYIGNORE)
      If ret = IDRETRY Then GoTo RetryTest
      soundpath$ = "(none)"
      i = WritePrivateProfileString("Cyberspace Program", "SoundPath", soundpath$, inifile$)
      If ret = IDABORT Then End
    End If
  End If
  Close #fi
  TestPathes = True
End Function

