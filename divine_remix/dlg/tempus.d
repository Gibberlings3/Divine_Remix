REPLACE_TRIGGER_TEXT BHNALLA ~Global("CDFakeTempusT","GLOBAL",1)~ ~Kit(Player1,A#TEMP)~

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Battleguards
IF ~Kit(Player1,A#TEMP)~ THEN GOTO Tempus
END

APPEND BHNALLA
IF ~~ Tempus SAY @10916
  IF ~~ THEN GOTO 2
END
END
