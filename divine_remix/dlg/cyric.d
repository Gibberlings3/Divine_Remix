REPLACE_TRIGGER_TEXT BHNALLA ~Global("CDFakeCyricT","GLOBAL",1)~ ~Kit(Player1,A#CYRIC)~

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Strifeleaders
IF ~Kit(Player1,A#CYRIC)~ THEN GOTO Cyric
END

APPEND BHNALLA
IF ~~ Cyric SAY @13012
  IF ~~ THEN GOTO 2
END
END
