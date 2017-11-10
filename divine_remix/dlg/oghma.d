EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Lorekeepers
IF ~Kit(Player1,A#OGMA)~ THEN GOTO Oghma
END

APPEND BHARVAL
IF ~~ Oghma SAY @12110
  IF ~~ THEN GOTO 2
END
END

EXTEND_BOTTOM BHOISIG 0
IF ~Kit(Player1,A#OGMA)~ THEN GOTO Oghma
END

APPEND BHOISIG
IF ~~ Oghma SAY @12110
  IF ~~ THEN GOTO 3
END
END

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Lorekeepers
IF ~Kit(Player1,A#OGMA)~ THEN GOTO Oghma
END

APPEND BHNALLA
IF ~~ Oghma SAY @12111
  IF ~~ THEN GOTO 2
END
END
