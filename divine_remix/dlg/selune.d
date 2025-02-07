// want to force silverstars on transition 0 (don't offer chance to work for helm)
ADD_TRANS_TRIGGER BHARVAL 2 ~!Kit(Player1,CDSELUNE)~                              // disable all transitions...
REPLACE_TRANS_TRIGGER BHARVAL BEGIN 2 END BEGIN 0 END ~!Kit(Player1,CDSELUNE)~ ~~ // except 0

EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Silverstars
  IF ~Kit(Player1,CDSELUNE)~ THEN GOTO Selune
END

APPEND BHARVAL
  IF ~~ Selune SAY @10323
    COPY_TRANS BHARVAL 1
  END
END
