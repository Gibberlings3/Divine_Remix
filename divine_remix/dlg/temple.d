/*
Have to rework the original temple leaders a bit. The major ideas here:

* Remove most alignment checks. The temple leader should already exclusively spawn for correct alignments and kits via ar0900.bcs; 
  duplicating them here just adds another potential point of failure (and place to update, grr)
* Remove most kit checks. A few kit checks remain for kit-specific dialogue, otherwise ^^ the above applies here as well. If 
  they spawn, you're working for them.
* Set CDWorkingForLathander/Helm/Talos globals for tracking later, so we don't have to keep checking kits and alignments
  after the UnseeingEye quest is completed. 
* LG and TN clerics, under most circumstances, can work for either Helm or Lathander. As such dialogue is added for Arval
  to refer you to Oisig and new dialogue for Oisig if this is the case, as well as the inverse. 
* Where possible, replaced paired RepGT(14)/RepLT(15) checks. Instead just use RepGT(14) and let weighting drive the PC
  to the other replies or states. This is mainly because we want some kits (Kossuth) to always get the low rep dialogue trees
  and it's easier to patch it in later with just the one check. 
* Borinall, the contact in the Dawn Ring side quest, has to get reworked to match the updated temple requirements. 

*/

/////                                                  \\\\\
///// Stuff for Arval (Lathander)                      \\\\\
/////                                                  \\\\\

REPLACE_STATE_TRIGGER BHARVAL 0
~NumTimesTalkedTo(0)
Global("CDSpawnArval","GLOBAL",0)
AreaCheck("AR0900")
Class(Player1,CLERIC_ALL)
Global("BeholderPlot","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHARVAL 3
~Class(Player1,CLERIC_ALL)
Global("CDSpawnArval","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
Global("CDWorkingForHelm","GLOBAL",0)
Global("CDWorkingForTalos","GLOBAL",0)
ReputationGT(Player1,14)~

REPLACE_STATE_TRIGGER BHARVAL 5 // remove rep check--only get here if 3 doesn't fire, so condition that one on rep
~Class(Player1,CLERIC_ALL)
Global("CDSpawnArval","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
Global("CDWorkingForHelm","GLOBAL",0)~

ADD_STATE_TRIGGER BHARVAL 22
~Global("CDWorkingForHelm","GLOBAL",0)~

REPLACE_ACTION_TEXT BHARVAL
~SetGlobal("BeholderPlot","GLOBAL",1)~
~SetGlobal("BeholderPlot","GLOBAL",1)
SetGlobal("CDWorkingForLathander","GLOBAL",1)~

ADD_TRANS_ACTION BHARVAL BEGIN 22 END BEGIN 3 END ~EraseJournalEntry(@10133) EraseJournalEntry(@10130)~

EXTEND_BOTTOM BHARVAL 2 // vanilla LG & TN vanilla/Kossuth/Oghma/Ilmater clerics an option for Helm
IF ~OR(2)
      Alignment(Player1,LAWFUL_GOOD)
      Alignment(Player1,NEUTRAL)
    !Kit(Player1,GODLATHANDER)
    Class(Player1,CLERIC_ALL)~ THEN GOTO PerhapsHelpHelm
END

APPEND BHARVAL
  IF WEIGHT #-100 ~Global("CDSpawnArval","GLOBAL",2)
                   Class(Player1,CLERIC_ALL)
                   InPartySlot(LastTalkedToBy,0)
                   Global("BeholderPlot","GLOBAL",0)
                   Global("NoHelpBeholder","GLOBAL",0)~ THEN BEGIN CDOisigRefer SAY @10195
    IF ~ReputationGT(Player1,14)~ THEN REPLY @10196 GOTO CDGood
    IF ~ReputationLT(Player1,15)~ THEN REPLY @10196 GOTO CDMeh
    IF ~ReputationGT(Player1,14)~ THEN REPLY @10197 GOTO CDGoodWait
    IF ~ReputationLT(Player1,15)~ THEN REPLY @10197 GOTO CDMehWait
    IF ~ReputationGT(Player1,14)~ THEN REPLY @10198 GOTO CDGood
    IF ~ReputationLT(Player1,15)~ THEN REPLY @10198 GOTO CDMeh
  END

  IF ~~ THEN BEGIN CDGood SAY @10199
    IF ~~ THEN GOTO 4
  END

  IF ~~ THEN BEGIN CDMeh SAY @10120
    IF ~~ THEN GOTO 4
  END

  IF ~~ THEN BEGIN CDGoodWait SAY @10121
    IF ~~ THEN GOTO 4
  END

  IF ~~ THEN BEGIN CDMehWait SAY @10122
    IF ~~ THEN GOTO 4
  END

  IF ~~ PerhapsHelpHelm SAY @10131
    IF ~~ THEN DO ~OpenDoor("DOR0902b")
                   EscapeAreaMove("AR0902",577,650,14)
                   SetGlobal("CDSpawnOisig","GLOBAL",1)~ UNSOLVED_JOURNAL @10133 EXIT
  END
END

/////                                                  \\\\\
///// Stuff for Nallabir (Talos)                       \\\\\
/////                                                  \\\\\

REPLACE_STATE_TRIGGER BHNALLA 0
~NumTimesTalkedTo(0)
Class(Player1,CLERIC_ALL)
Global("BeholderPlot","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHNALLA 3
~InPartySlot(LastTalkedToBy,0)
Class(Player1,CLERIC_ALL)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

ADD_TRANS_ACTION BHNALLA BEGIN 21 END BEGIN 3 END ~EraseJournalEntry(@10133) EraseJournalEntry(@10130)~

/////                                                  \\\\\
///// Stuff for Oisig (Watcher)                        \\\\\
/////                                                  \\\\\

REPLACE_STATE_TRIGGER BHOISIG 4
~Class(Player1,CLERIC_ALL)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
!Kit(Player1,GODLATHANDER)
Global("CDWorkingForLathander","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
ReputationGT(Player1,14)~

REPLACE_STATE_TRIGGER BHOISIG 5 // remove rep checks (state 4 is weighted higher)
~Class(Player1,CLERIC_ALL)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
!Kit(Player1,GODLATHANDER)
Global("CDWorkingForLathander","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)~

REPLACE_STATE_TRIGGER BHOISIG 6
~!Class(Player1,CLERIC_ALL)
InPartySlot(LastTalkedToBy,0)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
ReputationGT(Player1,14)~

REPLACE_STATE_TRIGGER BHOISIG 7 // remove rep checks (state 6 is weighted higher)
~!Class(Player1,CLERIC_ALL)
InPartySlot(LastTalkedToBy,0)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

ADD_STATE_TRIGGER BHOISIG 0  ~AreaCheck("AR0900")~

REPLACE_ACTION_TEXT BHOISIG
~SetGlobal("BeholderPlot","GLOBAL",1)~
~SetGlobal("BeholderPlot","GLOBAL",1)
SetGlobal("CDWorkingForHelm","GLOBAL",1)~

ADD_TRANS_ACTION BHOISIG BEGIN 24 END BEGIN 3 END ~EraseJournalEntry(@10133) EraseJournalEntry(@10130)~

EXTEND_BOTTOM BHOISIG 0
IF ~Class(Player1,CLERIC_RANGER) !Kit(Player1,GODHELM)~ THEN GOTO 1
END

EXTEND_BOTTOM BHOISIG 3 // gives vanilla LG & TN vanilla/Kossuth/Oghma/Ilmater clerics an option for Lathander
IF ~OR(2)
      Alignment(Player1,LAWFUL_GOOD)
      Alignment(Player1,NEUTRAL)
    !Kit(Player1,GODHELM)
    Class(Player1,CLERIC_ALL)~ THEN GOTO PerhapsHelpLathander
END

EXTEND_BOTTOM BHOISIG 30
IF ~Class(Player1,CLERIC_RANGER)
    Global("PlayerHasStronghold","GLOBAL",0)~ THEN GOTO 31
END

APPEND BHOISIG
  IF WEIGHT #-100 ~Global("CDSpawnOisig","GLOBAL",2)
                   Class(Player1,CLERIC_ALL)
                   Global("BeholderPlot","GLOBAL",0)
                   Global("NoHelpBeholder","GLOBAL",0)
                   !Kit(Player1,GODLATHANDER)~ THEN BEGIN CDArvalRefer SAY @10123
    IF ~ReputationGT(Player1,14)~ THEN REPLY @10124 GOTO CDGood
    IF ~ReputationLT(Player1,15)~ THEN REPLY @10124 GOTO CDMeh
    IF ~ReputationGT(Player1,14)~ THEN REPLY @10197 GOTO CDGoodWait
    IF ~ReputationLT(Player1,15)~ THEN REPLY @10197 GOTO CDMehWait
    IF ~ReputationGT(Player1,14)~ THEN REPLY @10125 GOTO CDGood
    IF ~ReputationLT(Player1,15)~ THEN REPLY @10125 GOTO CDMeh
  END

  IF ~~ THEN BEGIN CDGood SAY @10126
    IF ~~ THEN GOTO 8
  END

  IF ~~ THEN BEGIN CDMeh SAY @10127
    IF ~~ THEN GOTO 8
  END

  IF ~~ THEN BEGIN CDGoodWait SAY @10128
    IF ~~ THEN GOTO 8
  END

  IF ~~ THEN BEGIN CDMehWait SAY @10129
    IF ~~ THEN GOTO 8
  END

  IF ~~ PerhapsHelpLathander SAY @10132
    IF ~~ THEN DO ~OpenDoor("DOOR0901")
                   EscapeAreaMove("AR0901",690,565,2)
                   SetGlobal("CDSpawnArval","GLOBAL",1)~ UNSOLVED_JOURNAL @10130 EXIT
  END
END
