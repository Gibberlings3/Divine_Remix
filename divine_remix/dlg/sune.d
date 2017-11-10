REPLACE_TRIGGER_TEXT BHARVAL ~Global("CDFakeSuneF","GLOBAL",0)~ ~!Kit(Player1,NMSUNE)~

EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Heartwearders
IF ~Kit(Player1,NMSUNE)~ THEN GOTO Sune
END

APPEND BHARVAL
IF ~~ Sune SAY @12412
  IF ~~ THEN GOTO 2
END
END
