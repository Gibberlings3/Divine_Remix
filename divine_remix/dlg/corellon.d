REPLACE_TRIGGER_TEXT BHARVAL ~Global("CDFakeCorellonF","GLOBAL",0)~ ~!Kit(Player1,A#FEYWARDEN)~

EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Feywardens
IF ~Kit(Player1,A#FEYWARDEN)~ THEN GOTO Feywarden
END

APPEND BHARVAL
IF ~~ Feywarden SAY @12711
  IF ~~ THEN GOTO 2
END
END
