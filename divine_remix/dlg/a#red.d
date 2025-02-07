// want to force holy stragegists on transition 0 (don't offer chance to work for lathander)
ADD_TRANS_TRIGGER BHOISIG 3 ~!Kit(Player1,A#RED)~                              // disable all transitions...
REPLACE_TRANS_TRIGGER BHOISIG BEGIN 3 END BEGIN 0 END ~!Kit(Player1,A#RED)~ ~~ // except 0

EXTEND_BOTTOM BHOISIG 0 // a specific welcome for Holy Strategists
  IF ~Kit(Player1,A#RED)~ THEN GOTO Red
END

APPEND BHOISIG
  IF ~~ Red SAY @10717
    COPY_TRANS BHOISIG 1
  END
END
