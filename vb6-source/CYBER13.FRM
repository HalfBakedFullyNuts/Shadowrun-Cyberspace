VERSION 2.00
Begin Form Form13 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Registration"
   ClientHeight    =   5325
   ClientLeft      =   1110
   ClientTop       =   5115
   ClientWidth     =   9150
   Height          =   5730
   Icon            =   CYBER13.FRX:0000
   Left            =   1050
   LinkTopic       =   "Form13"
   ScaleHeight     =   5325
   ScaleWidth      =   9150
   Top             =   4770
   Width           =   9270
   Begin SSOption PayTypeCheck 
      Caption         =   "I pay by international postal money order."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   4
      Left            =   4800
      TabIndex        =   28
      TabStop         =   0   'False
      Top             =   3840
      Width           =   4335
   End
   Begin SSOption PayTypeCheck 
      Caption         =   "I pay by COD parcel/Nachnahme."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   3
      Left            =   4800
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   2880
      Width           =   4335
   End
   Begin SSOption PayTypeCheck 
      Caption         =   "I include the cash in my country's currency or in"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   2
      Left            =   4800
      TabIndex        =   26
      TabStop         =   0   'False
      Top             =   2160
      Width           =   4335
   End
   Begin SSOption PayTypeCheck 
      Caption         =   "I transfer the money to the bank account of"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   1
      Left            =   4800
      TabIndex        =   25
      TabStop         =   0   'False
      Top             =   1080
      Width           =   4335
   End
   Begin SSOption PayTypeCheck 
      Caption         =   "I pay with the check included (in my currency)."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   0
      Left            =   4800
      TabIndex        =   24
      TabStop         =   0   'False
      Top             =   360
      Width           =   4335
   End
   Begin SSCheck OrderOption 
      Caption         =   "Please send the package via air mail (add 6 DM)."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   22
      Top             =   3780
      Width           =   4455
   End
   Begin TextBox AddrText 
      Height          =   285
      Index           =   5
      Left            =   840
      TabIndex        =   6
      Text            =   "E-Mail address (if any)"
      Top             =   1800
      Width           =   3735
   End
   Begin TextBox AddrText 
      Height          =   285
      Index           =   4
      Left            =   840
      TabIndex        =   5
      Text            =   "Telephone number(s)"
      Top             =   1560
      Width           =   3735
   End
   Begin CommandButton PrintOrderButton 
      Caption         =   "Print order on my printer"
      Height          =   495
      Left            =   360
      TabIndex        =   8
      Top             =   4320
      Width           =   3975
   End
   Begin TextBox AddrText 
      Height          =   285
      Index           =   3
      Left            =   840
      TabIndex        =   4
      Text            =   "State, Country"
      Top             =   1320
      Width           =   3735
   End
   Begin TextBox AddrText 
      Height          =   285
      Index           =   2
      Left            =   840
      TabIndex        =   3
      Text            =   "Town, ZIP-Code"
      Top             =   1080
      Width           =   3735
   End
   Begin TextBox AddrText 
      Height          =   285
      Index           =   1
      Left            =   840
      TabIndex        =   2
      Text            =   "Street name  number"
      Top             =   840
      Width           =   3735
   End
   Begin TextBox AddrText 
      Height          =   285
      Index           =   0
      Left            =   840
      TabIndex        =   1
      Text            =   "First and family name"
      Top             =   600
      Width           =   3735
   End
   Begin TextBox CountText 
      Alignment       =   2  'Center
      Height          =   285
      Left            =   1680
      TabIndex        =   7
      Text            =   "1"
      Top             =   2160
      Width           =   495
   End
   Begin Label Label12 
      BackColor       =   &H00C0C0C0&
      Caption         =   "(CDROM, 25 MB, additional files for raytracing your own new ICE and node images) for"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   735
      Left            =   120
      TabIndex        =   0
      Top             =   2460
      Width           =   4215
   End
   Begin Label Label11 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Or print the order.txt included in this package."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Left            =   360
      TabIndex        =   19
      Top             =   4920
      Width           =   3255
   End
   Begin Label Label13 
      BackColor       =   &H00C0C0C0&
      Caption         =   "http://www.geocities.com/TimesSquare/5245"
      Height          =   255
      Left            =   5040
      TabIndex        =   20
      Top             =   5040
      Width           =   4095
   End
   Begin Label Label10 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Choose Payment Type:"
      Height          =   255
      Left            =   5040
      TabIndex        =   29
      Top             =   120
      Width           =   3735
   End
   Begin Label Label9 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Air mail to oversea countries takes 7-14 days."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Left            =   360
      TabIndex        =   23
      Top             =   4020
      Width           =   4215
   End
   Begin Label Label4 
      BackColor       =   &H00C0C0C0&
      Caption         =   "currency."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   2
      Left            =   1560
      TabIndex        =   21
      Top             =   3480
      Width           =   1575
   End
   Begin Label Label8 
      BackColor       =   &H00C0C0C0&
      Caption         =   "You may place your order by Mail (address on printer form), E-mail  to Icetoaster@gmx.de or by telephone (+49 170 8575192 (mobile, SMS) , or in Germany 06151-933273). Newest program information on"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   855
      Left            =   5040
      TabIndex        =   18
      Top             =   4200
      Width           =   3855
   End
   Begin Label Label4 
      BackColor       =   &H00C0C0C0&
      Caption         =   "or a comparable amount in a different"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   1
      Left            =   1560
      TabIndex        =   17
      Top             =   3240
      Width           =   2775
   End
   Begin Label Label5 
      BackColor       =   &H00C0C0C0&
      Caption         =   "(Best in Germany and some other european countries, but inform yourself about your country's possible expensive postage you have to pay)."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   615
      Index           =   3
      Left            =   5040
      TabIndex        =   16
      Top             =   3120
      Width           =   3975
   End
   Begin Label Label5 
      BackColor       =   &H00C0C0C0&
      Caption         =   "DM (german currency) in this order (rounded  up to fixed values ready for currency exchange)."
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   495
      Index           =   2
      Left            =   5040
      TabIndex        =   15
      Top             =   2400
      Width           =   4095
   End
   Begin Label Label5 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Stefan Markgraf, account number 606882-300 at Postbank Hannover, Germany. Bank code 250 100 30. (Disks will be sent as soon as the money appears on this account.)"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   855
      Index           =   1
      Left            =   5040
      TabIndex        =   14
      Top             =   1320
      Width           =   3975
   End
   Begin Label Label5 
      BackColor       =   &H00C0C0C0&
      Caption         =   "(Use crossed cheque / voucher check / validated check  / Verrechnungsscheck and don't forget to sign it.)"
      FontBold        =   0   'False
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   8.25
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   615
      Index           =   0
      Left            =   5040
      TabIndex        =   13
      Top             =   600
      Width           =   4095
   End
   Begin Label SumValueLabel 
      BackColor       =   &H00C0C0C0&
      Caption         =   "40 DM, $27"
      Height          =   495
      Left            =   120
      TabIndex        =   12
      Top             =   3240
      Width           =   1335
   End
   Begin Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Deluxe-Version(s)"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Index           =   0
      Left            =   2280
      TabIndex        =   11
      Top             =   2220
      Width           =   2295
   End
   Begin Label Label2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "I like to order"
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   9.75
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   2220
      Width           =   1575
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Please send the full featured version of the Cyberspace program package to the address below:"
      Height          =   495
      Index           =   1
      Left            =   120
      TabIndex        =   9
      Top             =   120
      Width           =   4470
   End
End
Option Explicit

Sub AddrText_Change (Index As Integer)

End Sub

Sub AddrText_KeyPress (Index As Integer, KeyAscii As Integer)
  Dim nidx%
  
  If KeyAscii = 13 Then
    KeyAscii = 0
    Call AddrText_Change(Index)
    nidx = Index + 1
    If nidx = 6 Then nidx = 0
    AddrText(nidx).SetFocus
  End If
End Sub

Sub CountText_Change ()
  Dim nr%
  Dim i%
  Dim ord%
  Dim a$
  Dim dollar As Single, dmark As Single, basecost As Single

  basecost = 50#

  nr = Val(CountText.Text)
  If nr < 0 Then
    nr = 0
    CountText.Text = "0"
  End If
  If nr >= 0 And nr < 5 Then
    If nr > 1 Then basecost = 50#
    dmark = nr * basecost
    If OrderOption(1).Value = True Then dmark = dmark + 6#
    dollar = Fix(dmark / 1.85 + .5)
    a$ = Format$(dmark) + " DM, $" + Format$(dollar)
  Else       ' 50 DM, $35, 360 sh, 40 Schweizer Franken, 23 brit Pfd, 180 frz. Francs
    a$ = "(Contact author)"
  End If
  SumValueLabel.Caption = a$

End Sub

Sub Form_Load ()
    OrderOption(1).Value = False
    Call CountText_Change
End Sub

Sub OrderOption_Click (Index As Integer, Value As Integer)
  Call CountText_Change
End Sub

Sub PrintOrderButton_Click ()
  Dim i%, k%

  On Error GoTo showprterr
  k = 0
  For i = 0 To 4
    If PayTypeCheck(i).Value = True Then k = k + 1
  Next i
  If k <> 1 Then
    MsgBox "You should choose one payment type.", 16
    Exit Sub
  End If

  printer.Print "   From:"
  printer.Print ""
  printer.Print "   " + AddrText(0).Text
  printer.Print "   " + AddrText(1).Text
  printer.Print "   " + AddrText(2).Text
  printer.Print "   " + AddrText(3).Text
  printer.Print ""
  printer.Print "   " + AddrText(4).Text
  printer.Print "   " + AddrText(5).Text
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print "   To:"
  printer.Print ""
  printer.Print "   Stefan Markgraf"
  printer.Print "   Greinstr. 16"
  printer.Print "   D-64291 Darmstadt"
  printer.Print ""
  printer.Print "   GERMANY"
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  
  printer.Print "   Please send the full featured version of the Cyberspace program"
  printer.Print "   to my address."
  printer.Print ""

  printer.Print "   I like to order " & Format$(CountText.Text) & " full featured Cyberspace program"
  printer.Print "   package(s) of the Deluxe CDROM Version with colored manual included"
  printer.Print "   at a rate of " & SumValueLabel & ", or a comparable amount in a different currency,"
  printer.Print "   namely: ______________"
  printer.Print ""
  printer.Print "   (Please encircle above or write down your chosen currency and rate)."
  printer.Print ""
  printer.Print ""

  k = 0
  If OrderOption(1).Value = True Then
        printer.Print "   Please send the package via air mail."
  End If
  printer.Print
  For i = 0 To 4
    If PayTypeCheck(i).Value = True Then
      If i = 0 Then
        printer.Print "   I pay with the check included (in my currency)."
      ElseIf i = 1 Then
        printer.Print "   I transfer the money to the bank account of"
        printer.Print "     Stefan Markgraf"
        printer.Print "     account number 6068 82-300"
        printer.Print "     at Postbank Hannover, Germany, Bank code 250 100 30"
      ElseIf i = 2 Then
        printer.Print "   I include the cash in my country's currency or in DM"
        printer.Print "   (german currency) in this order (rounded up to fixed values"
        printer.Print "   ready for currency exchange)."
      ElseIf i = 3 Then
        printer.Print "   I will pay by COD parcel / Nachnahme."
      ElseIf i = 4 Then
        printer.Print "   I will pay by international postal money order."
      End If
    End If
  Next i
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print ""
  printer.Print "Place, Date:__________________________ Signature: ___________________________________"
  printer.EndDoc
  Form13.Hide
  Exit Sub
      
showprterr:
  MsgBox "Error in printing!", 16

End Sub

