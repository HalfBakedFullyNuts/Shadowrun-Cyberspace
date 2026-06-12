Option Explicit
Rem ==================================================================
Rem  This Module is used by the programs:
Rem  cyberspc.exe, cybdemo.exe, and deckered.exe
Rem ==================================================================

Sub SaveDecker (c$)
  Dim ret%

  ret = 1
  If ret = 1 And InStr(c$, "*") <= 0 Then
    Open c$ For Output As #1
    Print #1, "[Character]"
    Print #1, "Name=" & decker.name
    Print #1,
    Print #1, "[Attributes]"
    Print #1, "Body=" & Format(decker.body)
    Print #1, "Quickness=" & Format(decker.quickness)
    Print #1, "Strength=" & Format(decker.strength)
    Print #1, "Charisma=" & Format(decker.charisma)
    Print #1, "Intelligence=" & Format(decker.intelligence)
    Print #1, "Willpower=" & Format(decker.willpower)
    Print #1, "Reaction=" & Format(decker.reaction) & "+" & Format(decker.reactdice) & "D"
    Print #1, "Stun Damage=" & Format(decker.damage_stun)
    Print #1, "Phys Damage=" & Format(decker.damage_phys)
    Print #1,
    Print #1, "[Skills]"
    Print #1, "Computer=" & Format(decker.computer)
    Print #1, "Etiquette/Matrix=" & Format(decker.etiqmatrix)
    Print #1,
    Print #1, "[Dice Pools]"
    Print #1, "Karma=" & Format(decker.karma)
    If ((deck.dreaction + decker.computer) <> (decker.hackingpool + decker.hackingallo - 2 * deck.onuplink)) Then
      Print #1, "Hacking=" & Format(decker.hackingpool)
    Else
      Print #1, "Hacking=0"  ' automatic hacking pool
    End If
    Print #1, "Team=" & Format(decker.team)
    Close #1
  End If
End Sub

