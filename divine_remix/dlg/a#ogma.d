EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Lorekeepers
  IF ~Kit(Player1,A#OGMA)~ THEN GOTO Oghma
END

APPEND BHARVAL
  IF ~~ Oghma SAY @12110
    COPY_TRANS BHARVAL 1
  END
END

EXTEND_BOTTOM BHOISIG 0 // a specific welcome for Lorekeepers
  IF ~Kit(Player1,A#OGMA)~ THEN GOTO Oghma
END

APPEND BHOISIG
  IF ~~ Oghma SAY @12110
    COPY_TRANS BHOISIG 1
  END
END

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Lorekeepers
  IF ~Kit(Player1,A#OGMA)~ THEN GOTO Oghma
END

APPEND BHNALLA
  IF ~~ Oghma SAY @12111
    COPY_TRANS BHNALLA 1
  END
END
