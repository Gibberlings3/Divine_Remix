EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Nightcloaks
  IF ~Kit(Player1,A#SHAR)~ THEN GOTO Shar
END

APPEND BHNALLA
  IF ~~ Shar SAY @10623
    COPY_TRANS BHNALLA 1
  END
END
