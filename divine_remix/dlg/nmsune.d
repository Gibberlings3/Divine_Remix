EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Heartwearders
  IF ~Kit(Player1,NMSUNE)~ THEN GOTO Sune
END

APPEND BHARVAL
  IF ~~ Sune SAY @12412
    COPY_TRANS BHARVAL 1
  END
END
