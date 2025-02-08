// want to force firewalkers into the 'low rep' dialogue tree
ADD_STATE_TRIGGER BHARVAL 3 ~!Kit(Player1,A#KOSS)~ // forces them into state 5
ADD_TRANS_TRIGGER BHARVAL ~%CDOisigRefer%~ ~!Kit(Player1,A#KOSS)~ DO 0 2 4 // block off 'good' replies
ALTER_TRANS BHARVAL BEGIN ~%CDOisigRefer%~ END BEGIN 1 3 5 END BEGIN       // enable 'meh' replies
  ~TRIGGER~ ~OR(2) ReputationLT(Player1,15) Kit(Player1,A#KOSS)~ 
END

EXTEND_BOTTOM BHARVAL 0 // a specific welcome for Firewalkers
  IF ~Kit(Player1,A#KOSS)~ THEN GOTO Kossuth
END

APPEND BHARVAL
  IF ~~ Kossuth SAY @11512 = @11513
    COPY_TRANS BHARVAL 1
  END
END

EXTEND_BOTTOM BHNALLA 0 // a specific welcome for Firewalkers
  IF ~Kit(Player1,A#KOSS)~ THEN GOTO Kossuth
END

APPEND BHNALLA
  IF ~~ Kossuth SAY @11514
    COPY_TRANS BHNALLA 1
  END
END

EXTEND_BOTTOM BHOISIG 0 // a specific welcome for Firewalkers
  IF ~Kit(Player1,A#KOSS)~ THEN GOTO Kossuth
END

APPEND BHOISIG
  IF ~~ Kossuth SAY @11515
    COPY_TRANS BHOISIG 1
  END
END
