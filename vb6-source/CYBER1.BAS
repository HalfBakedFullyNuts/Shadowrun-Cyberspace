Option Explicit
Rem ======================================================
Rem  This Module contains functions used by
Rem  CYBERSPC.EXE, CYBDEMO.EXE
Rem ======================================================

Global realtime As Integer        ' True/False for real time decking on/off
Global icetime As Integer         ' True/False for leave ICE the time for displaying on fast computers
Global realtimeinterval As Long   ' time interval in milliseconds
Global icetimeinterval As Long    ' time interval in milliseconds
Global timer2elapsed As Integer   ' True/False if timer2 is elapsed (in DoICE)

Function CrashedICE () As Integer
  Rem --- Counts the number of crashed ICE ---
  Dim icenr As Integer
  Dim crashed As Integer
  
  crashed = 0
  For icenr = 0 To icenum - 1
    If ice(icenr).damage >= 10 Then
      crashed = crashed + 1
      ice(icenr).active = 4
    End If
  Next icenr
  Debug.Print "CrashedICE="; crashed
  CrashedICE = crashed
End Function

Function fac (n As Long) As Double
  Dim l As Long
  Dim d As Double

  d = 1#
  For l = 2 To n
    d = d * l
  Next l
  fac = d
End Function

Function FindProg (Liste As ListBox, p$) As Integer
  Rem Search program in liste and returns listindex
  Dim i%, ret%
  Dim a$

  ret = -1
  For i = 0 To Liste.ListCount - 1
    a$ = Liste.List(i)
    If UCase$(StrwoBrackets(GetWord(a$, "-"))) = p$ Then ret = i
  Next i

  FindProg = ret

End Function

Function ICEType2Nr (b$) As Integer
  Rem Converts ICE-type (Access,Killer,...) to a number
  Dim i%

  b$ = UCase$(b$)
  For i = 0 To 14
    If b$ = UCase$(icetypes(i)) Then Exit For
  Next i
  Debug.Print i, icetypes(i)
  ICEType2Nr = i
End Function

Function n_over_k (n As Long, k As Long) As Double
  n_over_k = fac(n) / (fac(n - k) * fac(k))
End Function

Function Probability_ksucc (ksucc As Long, ndices As Long, target As Long) As Double
  Rem --- Calculates probability for reaching target with k dices at least n times
  Rem ptarget(target) = 6/6, 5/6, 4/6, 3/6, 2/6, 1/6, 6/36, 5/36, 4/36, ...
  Dim p As Double  ' probability for reaching target using only 1 dice
  Dim sum As Double
  Dim k As Long

  p = (6 - ((target - 1) Mod 6)) / 6 ^ Int((target - 1) / 6 + 1)
  'Debug.Print "ptarget:"; (6 - ((target - 1) Mod 6)); "/"; 6 ^ Int((target - 1) / 6 + 1);
  sum = 0#
  For k = ksucc To ndices
    sum = sum + n_over_k(ndices, k) * p ^ k * (1 - p) ^ (ndices - k)
  Next k
  'Debug.Print " p="; sum
  Probability_ksucc = sum
End Function

Sub TransparentBlt (dest As Control, ByVal srcBmp As Integer, ByVal destX As Integer, ByVal destY As Integer, ByVal TransColor As Long)
      Const PIXEL = 3
      Dim destScale As Integer
      Dim srcDC As Integer  'source bitmap (color)
      Dim saveDC As Integer 'backup copy of source bitmap
      Dim maskDC As Integer 'mask bitmap (monochrome)
      Dim invDC As Integer  'inverse of mask bitmap (monochrome)
      Dim resultDC As Integer 'combination of source bitmap & background
      Dim bmp As bitmap 'description of the source bitmap
      Dim hResultBmp As Integer 'Bitmap combination of source & background
      Dim hSaveBmp As Integer 'Bitmap stores backup copy of source bitmap
      Dim hMaskBmp As Integer 'Bitmap stores mask (monochrome)
      Dim hInvBmp As Integer  'Bitmap holds inverse of mask (monochrome)
      Dim hPrevBmp As Integer 'Bitmap holds previous bitmap selected in DC
      Dim hSrcPrevBmp As Integer  'Holds previous bitmap in source DC
      Dim hSavePrevBmp As Integer 'Holds previous bitmap in saved DC
      Dim hDestPrevBmp As Integer 'Holds previous bitmap in destination DC
      Dim hMaskPrevBmp As Integer 'Holds previous bitmap in the mask DC
      Dim hInvPrevBmp As Integer 'Holds previous bitmap in inverted mask DC
      Dim OrigColor As Long 'Holds original background color from source DC
      Dim success As Integer 'Stores result of call to Windows API
      
      If TypeOf dest Is PictureBox Then 'Ensure objects are picture boxes
        destScale = dest.ScaleMode 'Store ScaleMode to restore later
        dest.ScaleMode = PIXEL 'Set ScaleMode to pixels for Windows GDI
        'Retrieve bitmap to get width (bmp.bmWidth) & height (bmp.bmHeight)
        success = GetObj(srcBmp, Len(bmp), bmp)
        srcDC = CreateCompatibleDC(dest.hDC)    'Create DC to hold stage
        Rem saveDC = CreateCompatibleDC(dest.hDC)   'Create DC to hold stage
        maskDC = CreateCompatibleDC(dest.hDC)   'Create DC to hold stage
        invDC = CreateCompatibleDC(dest.hDC)    'Create DC to hold stage
        resultDC = CreateCompatibleDC(dest.hDC) 'Create DC to hold stage
        'Create monochrome bitmaps for the mask-related bitmaps:
        hMaskBmp = CreateBitmap(bmp.bmWidth, bmp.bmHeight, 1, 1, ByVal 0&)
        hInvBmp = CreateBitmap(bmp.bmWidth, bmp.bmHeight, 1, 1, ByVal 0&)
        'Create color bitmaps for final result & stored copy of source
        hResultBmp = CreateCompatibleBitmap(dest.hDC, bmp.bmWidth, bmp.bmHeight)
        Rem hSaveBmp = CreateCompatibleBitmap(dest.hDC, bmp.bmWidth, bmp.bmHeight)
        hSrcPrevBmp = SelectObject(srcDC, srcBmp)     'Select bitmap in DC
        Rem hSavePrevBmp = SelectObject(saveDC, hSaveBmp) 'Select bitmap in DC
        hMaskPrevBmp = SelectObject(maskDC, hMaskBmp) 'Select bitmap in DC
        hInvPrevBmp = SelectObject(invDC, hInvBmp)    'Select bitmap in DC
        hDestPrevBmp = SelectObject(resultDC, hResultBmp) 'Select bitmap
        Rem Success = BitBlt(saveDC, 0, 0, bmp.bmWidth, bmp.bmHeight, srcDC, 0, 0, SRCCOPY) 'Make backup of source bitmap to restore later
        'Create mask: set background color of source to transparent color.
        OrigColor = SetBkColor(srcDC, TransColor)
        success = BitBlt(maskDC, 0, 0, bmp.bmWidth, bmp.bmHeight, srcDC, 0, 0, SRCCOPY)
        TransColor = SetBkColor(srcDC, OrigColor)
        'Create inverse of mask to AND w/ source & combine w/ background.
        success = BitBlt(invDC, 0, 0, bmp.bmWidth, bmp.bmHeight, maskDC, 0, 0, NOTSRCCOPY)
        'Copy background bitmap to result & create final transparent bitmap
        success = BitBlt(resultDC, 0, 0, bmp.bmWidth, bmp.bmHeight, dest.hDC, destX, destY, SRCCOPY)
        'AND mask bitmap w/ result DC to punch hole in the background by
        'painting black area for non-transparent portion of source bitmap.
        success = BitBlt(resultDC, 0, 0, bmp.bmWidth, bmp.bmHeight, maskDC, 0, 0, SRCAND)
        'AND inverse mask w/ source bitmap to turn off bits associated
        'with transparent area of source bitmap by making it black.
        success = BitBlt(srcDC, 0, 0, bmp.bmWidth, bmp.bmHeight, invDC, 0, 0, SRCAND)
        'XOR result w/ source bitmap to make background show through.
        success = BitBlt(resultDC, 0, 0, bmp.bmWidth, bmp.bmHeight, srcDC, 0, 0, SRCPAINT)
        Debug.Print "Success:"; success
        success = BitBlt(dest.hDC, destX, destY, bmp.bmWidth, bmp.bmHeight, resultDC, 0, 0, SRCCOPY) 'Display transparent bitmap on backgrnd
        Rem Success = BitBlt(srcDC, 0, 0, bmp.bmWidth, bmp.bmHeight, saveDC, 0, 0, SRCCOPY)'Restore backup of bitmap.
        hPrevBmp = SelectObject(srcDC, hSrcPrevBmp) 'Select orig object
        Rem hPrevBmp = SelectObject(saveDC, hSavePrevBmp) 'Select orig object
        hPrevBmp = SelectObject(resultDC, hDestPrevBmp) 'Select orig object
        hPrevBmp = SelectObject(maskDC, hMaskPrevBmp) 'Select orig object
        hPrevBmp = SelectObject(invDC, hInvPrevBmp) 'Select orig object
        Rem Success = DeleteObject(hSaveBmp)   'Deallocate system resources.
        success = DeleteObject(hMaskBmp)   'Deallocate system resources.
        success = DeleteObject(hInvBmp)    'Deallocate system resources.
        success = DeleteObject(hResultBmp) 'Deallocate system resources.
        success = DeleteDC(srcDC)          'Deallocate system resources.
        Rem Success = DeleteDC(saveDC)         'Deallocate system resources.
        success = DeleteDC(invDC)          'Deallocate system resources.
        success = DeleteDC(maskDC)         'Deallocate system resources.
        success = DeleteDC(resultDC)       'Deallocate system resources.
        dest.ScaleMode = destScale         'Restore ScaleMode of destination.
      End If
End Sub

