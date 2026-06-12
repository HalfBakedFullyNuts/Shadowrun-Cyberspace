Option Explicit
Rem ======================================================
Rem  This Module contains functions explicitly used by
Rem  MATED.EXE
Rem ======================================================

Global icoltypes(0 To 3) As String
Global nodecolorstr(0 To 6) As String
Global nodecolor As Integer
Global noderate As Integer
Global nodetype As Integer
Global lastnode As Integer            ' "from" node for (un)linking nodes
Global modus As Integer
Global staging As Integer
Global activity As Integer
Global mobility As Integer
Global icecolor As Integer

Sub DeleteICE (icenr%)
  Rem Delete ICE from array and update all other infos
  Dim k%, atr%, ptr%

  If icenr >= 0 Then
    For k = icenr + 1 To icenum - 1
      ice(k - 1).code = ice(k).code
      ice(k - 1).description = ice(k).description
      ice(k - 1).rating = ice(k).rating
      ice(k - 1).damage = ice(k).damage
      ice(k - 1).active = ice(k).active
      ice(k - 1).mobile = ice(k).mobile
      ice(k - 1).range = ice(k).range
      ice(k - 1).nodenr = ice(k).nodenr
      ice(k - 1).ptrigger = ice(k).ptrigger
      ice(k - 1).atrigger = ice(k).atrigger
    Next k
    icenum = icenum - 1
    ' Update trigger info
    For k = 0 To icenum - 1
      ice(k).ptrigger = DelTriggerICEnr(icenr, ice(k).ptrigger)
      ice(k).atrigger = DelTriggerICEnr(icenr, ice(k).atrigger)
    Next k
    
  End If

End Sub

Function DelTriggerICEnr (ByVal delicenr%, ByVal triggernr%) As Integer
  Rem sub-subroutine for DeleteICE
  Rem  returns correct index of ICE, after deleting delicenr.
  Dim ret%

  ret = triggernr
  If (triggernr = delicenr) Then
    ret = -1  ' ICE deleted, which is triggered -> set to trigger none
  ElseIf (triggernr > delicenr) Then
    ret = ret - 1
  End If
  DelTriggerICEnr = ret
End Function

