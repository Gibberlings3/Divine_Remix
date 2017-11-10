REPLACE_TRIGGER_TEXT BHARVAL ~Global("CDFakeSeluneF","GLOBAL",0)~ ~!Kit(Player1,CDSELUNE)~

EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Silverstars
IF ~Kit(Player1,CDSELUNE)~ THEN GOTO Selune
END

APPEND BHARVAL
IF ~~ Selune SAY @10323
  IF ~~ THEN GOTO 2
END
END
