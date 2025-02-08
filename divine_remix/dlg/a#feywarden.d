EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Feywardens
  IF ~Kit(Player1,A#FEYWARDEN)~ THEN GOTO Feywarden
END

APPEND BHARVAL
  IF ~~ Feywarden SAY @12711
    COPY_TRANS BHARVAL 1
  END
END
