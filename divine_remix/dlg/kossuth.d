REPLACE_TRIGGER_TEXT BHARVAL ~Global("CDFakeKossF","GLOBAL",0)~ ~!Kit(Player1,A#KOSS)~
REPLACE_TRIGGER_TEXT BHARVAL ~Global("CDFakeKossT","GLOBAL",1)~ ~Kit(Player1,A#KOSS)~

EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Firewalkers
IF ~Kit(Player1,A#KOSS)~ THEN GOTO Kossuth
END

APPEND BHARVAL
IF ~~ Kossuth SAY @11512 = @11513
  IF ~~ THEN GOTO 2
END
END

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Firewalkers
IF ~Kit(Player1,A#KOSS)~ THEN GOTO Kossuth
END

APPEND BHNALLA
IF ~~ Kossuth SAY @11514
  IF ~~ THEN GOTO 2
END
END

EXTEND_BOTTOM BHOISIG 0
IF ~Kit(Player1,A#KOSS)~ THEN GOTO Kossuth
END

APPEND BHOISIG
IF ~~ Kossuth SAY @11515
  IF ~~ THEN GOTO 3
END
END
