REPLACE_TRIGGER_TEXT BHNALLA ~Global("CDFakeSharT","GLOBAL",1)~ ~Kit(Player1,A#SHAR)~

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Nightcloaks
IF ~Kit(Player1,A#SHAR)~ THEN GOTO Shar
END

APPEND BHNALLA
IF ~~ Shar SAY @10623
  IF ~~ THEN GOTO 2
END
END
