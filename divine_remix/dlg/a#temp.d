EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Battleguards
  IF ~Kit(Player1,A#TEMP)~ THEN GOTO Tempus
END

APPEND BHNALLA
  IF ~~ Tempus SAY @10916
    COPY_TRANS BHNALLA 1
  END
END
