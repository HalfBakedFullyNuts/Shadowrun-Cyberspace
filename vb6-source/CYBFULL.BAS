Option Explicit

Sub RememberDisable ()
  If isdemo Then
    MsgBox "Remember: this is a DEMO version. 675 KB sounds and 1171 KB images are deleted here, in order to save download size and time.", MB_ICONEXCLAMATION
  End If
End Sub

Sub SoundPlay (sndevent$, typ%)
  Rem --- Plays a Sound ---
  Dim a$
  Dim ret%

  If playsound <> 0 And isdemo = False Then
    a$ = ""
    Select Case UCase$(sndevent$)
      Case "LOOK": a$ = "sndlook"  ' ICE wants identification
      Case "SUSP": a$ = "sndsusp"  ' ICE wants second identification
      Case "YELL": a$ = "sndyell"  ' ICE yells
      Case "SLZA": a$ = "sndslza"  ' ICE searches persona
      Case "SLZE": a$ = "sndslze"  ' ICE searches persona
      Case "DECP": a$ = "snddecp"  ' ICE is decepted (no sound?)
      Case "SHTG": a$ = "sndshtg"  ' Gray ICE tries to hit (shoots)
      Case "SHTB": a$ = "sndshtb"  ' Black ICE tries to hit (stun)
      Case "SHTP": a$ = "sndshtp"  ' Black ICE tries to hit (physical)
      Case "SHTD": a$ = "sndshtd"  ' Decker tries to hit             ?
      Case "HITG": a$ = "sndhitg"  ' Gray ICE hits decker successful
      Case "HITB": a$ = "sndhitb"  ' Do Stun Damage to Decker
      Case "HITP": a$ = "sndhitp"  ' Black ICE does physical damage
      Case "HITD": a$ = "sndhitd"  ' Decker hits ICE successful
      Case "ARMG": a$ = "sndarmg"  ' Gray ICE Attack bits deckers armor
      Case "ARMB": a$ = "sndarmb"  ' Black ICE Attack bits deckers armor
      Case "ARMP": a$ = "sndarmp"  ' Black ICE Attack bits deckers armor
      Case "ARMD": a$ = "sndarmd"  ' Deckers Attack doesn't hurt the ICE ?
      Case "BLST": a$ = "sndblst"  ' Blaster Attack successful
      Case "BLSA": a$ = "sndblsa"  ' Blaster Attack unsuccessful
      Case "SLOW": a$ = "sndfrez"  ' Freeze (slow)
      Case "FROZ": a$ = "sndfroz"  ' Frozen ICE makes this sound
      Case "ACID": a$ = "sndacid"  ' Acid ICE hits
      Case "ACIA": a$ = "sndacia"  ' Acid ICE hits unsuccessful
      Case "BIND": a$ = "sndbind"  ' Binder ICE hits
      Case "BINA": a$ = "sndbina"  ' Binder ICE hits unsuccessful
      Case "JAMM": a$ = "sndjamm"  ' Jammer ICE hits
      Case "JAMA": a$ = "sndjama"  ' Jammer ICE hits unsuccessful
      Case "MARK": a$ = "sndmark"  ' Marker ICE hits
      Case "MARA": a$ = "sndmara"  ' Marker ICE hits unsuccessful
      Case "TARB": a$ = "sndtarb"  ' Tar Baby steals program
      Case "TARP": a$ = "sndtarp"  ' Tar Pit steals program
      Case "BARK": a$ = "sndbark"  ' Trace ICE releases dog
      Case "ACTA": a$ = "sndacta"  ' active Alert just triggered
      Case "PASA": a$ = "sndpasa"  ' passive Alert just triggered
      Case "CRAS": a$ = "sndcras"  ' Cyberdeck crashed
      Case "BOOT": a$ = "sndboot"  ' Booting the cyberdeck
      Case "PLUG": a$ = "sndplug"  ' Plug in decker
      Case "CLTG": a$ = "sndcltg"  ' Choose LTG
      Case "PUKE": a$ = "sndpuke"  ' Puke on the cyberdeck
      Case "DUMP": a$ = "snddump"  ' Dump Shock
      Case "TRAC": a$ = "sndtrac"  ' Decker is traced successfully
      Case "LOCKOUT":         a$ = "sndsop0"  ' SysOp
      Case "BACK DOOR":       a$ = "sndsop1"  ' SysOp
      Case "SEE SYSTEM":      a$ = "sndsop2"  ' SysOp
      Case "CANCEL ALERT":    a$ = "sndsop3"  ' SysOp
      Case "CHANGE NODE":     a$ = "sndsop4"  ' SysOp
      Case "DISPLAY MAP":     a$ = "sndsop5"  ' SysOp
      Case "SHUTDOWN":        a$ = "sndsop6"  ' SysOp
      Case "SYSTEM INQUIRY":  a$ = "sndsop7"  ' SysOp
      Case "EDIT FILE":       a$ = "sndsop8"  ' SysOp
      Case "ERASE FILE":      a$ = "sndsop9"  ' SysOp
      Case "READ FILE":       a$ = "sndsopa"  ' SysOp
      Case "TRANSFER FILE":   a$ = "sndsopb"  ' SysOp
      Case "CONTROL":         a$ = "sndsopc"  ' SysOp
      Case "SENSOR READOUT":  a$ = "sndsopd"  ' SysOp
      Case "DISPLAY MESSAGE": a$ = "sndsope"  ' SysOp
      Case "DISCONNECT PORT": a$ = "sndsopf"  ' SysOp
      Case Else:  a$ = "snd" + LCase$(a$)
    End Select
    a$ = soundpath$ & a$ & ".wav"
    ret = sndPlaySound(a$, typ)
  End If

End Sub

