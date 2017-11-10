
//When adding a new kit, you don't need to modify this file unless the deity can potentially work for more than one temple.
//In that case, you need to insert dummy variables here and then REPLACE them later in a .d file with a !Kit or Kit check.
//Look at kossuth.d or tempus.d in the appropriate folder for details.

/////                                                  \\\\\
///// Stuff for Arval (Lathander)                      \\\\\
/////                                                  \\\\\

REPLACE_STATE_TRIGGER BHARVAL 0
~NumTimesTalkedTo(0)
Global("CDSpawnArval","GLOBAL",0)
AreaCheck("AR0900")
OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Global("BeholderPlot","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHARVAL 3
~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Global("CDSpawnArval","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
ReputationGT(Player1,14)
Global("CDFakeKossF","GLOBAL",0)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
Global("CDWorkingForHelm","GLOBAL",0)
Global("CDWorkingForTalos","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHARVAL 5
~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Global("CDSpawnArval","GLOBAL",0)
InPartySlot(LastTalkedToBy,0)
OR(2)
  ReputationLT(Player1,15)
  Global("CDFakeKossT","GLOBAL",1)
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
IF ~!Kit(Player1,GODLATHANDER)
    OR(2)
      Alignment(Player1,LAWFUL_GOOD)
      Alignment(Player1,NEUTRAL)
    !Kit(Player1,GODLATHANDER)
    Global("CDFakeSeluneF","GLOBAL",0)
    OR(6)
      Class(Player1,CLERIC)
      Class(Player1,FIGHTER_CLERIC)
      Class(Player1,CLERIC_MAGE)
      Class(Player1,CLERIC_THIEF)
      Class(Player1,FIGHTER_MAGE_CLERIC)
      Class(Player1,CLERIC_RANGER)~ THEN GOTO PerhapsHelpHelm
END

APPEND BHARVAL
IF WEIGHT #-100 ~Global("CDSpawnArval","GLOBAL",2)
                 OR(6)
                   Class(Player1,CLERIC)
                   Class(Player1,FIGHTER_CLERIC)
                   Class(Player1,CLERIC_MAGE)
                   Class(Player1,CLERIC_THIEF)
                   Class(Player1,FIGHTER_MAGE_CLERIC)
                   Class(Player1,CLERIC_RANGER)
                 InPartySlot(LastTalkedToBy,0)
                 Global("BeholderPlot","GLOBAL",0)
                 Global("NoHelpBeholder","GLOBAL",0)~ THEN BEGIN CDOisigRefer SAY @10195
  IF ~ReputationGT(Player1,14)
      Global("CDFakeKossF","GLOBAL",0)~ THEN REPLY @10196 GOTO CDGood
  IF ~OR(2)
        ReputationLT(Player1,15)
        Global("CDFakeKossT","GLOBAL",1)~ THEN REPLY @10196 GOTO CDMeh
  IF ~ReputationGT(Player1,14)
      Global("CDFakeKossF","GLOBAL",0)~ THEN REPLY @10197 GOTO CDGoodWait
  IF ~OR(2)
        ReputationLT(Player1,15)
        Global("CDFakeKossT","GLOBAL",1)~ THEN REPLY @10197 GOTO CDMehWait
  IF ~ReputationGT(Player1,14)
      Global("CDFakeKossF","GLOBAL",0)~ THEN REPLY @10198 GOTO CDGood
  IF ~OR(2)
        ReputationLT(Player1,15)
        Global("CDFakeKossT","GLOBAL",1)~ THEN REPLY @10198 GOTO CDMeh
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
///// Stuff for Borinall (thief of the dawn ring)      \\\\\
/////                                                  \\\\\

ADD_TRANS_TRIGGER BORINALL 8 ~False()~ DO 0 1 3 // eliminates existing responses

EXTEND_BOTTOM BORINALL 8 // replaces them with new triggers
  IF ~Global("Stripped","GLOBAL",0) Kit(PLAYER1,GODTALOS)~ THEN REPLY #37576 GOTO 9
  IF ~OR(2) !Global("Stripped","GLOBAL",0) !Kit(PLAYER1,GODTALOS)~ THEN REPLY #37576 DO ~SetGlobal("TalosStrike","LOCALS",1)~ EXIT
  IF ~Global("Stripped","GLOBAL",0) Kit(PLAYER1,GODLATHANDER)~ THEN REPLY #37579 GOTO 11
  IF ~OR(2) !Global("Stripped","GLOBAL",0) !Kit(PLAYER1,GODLATHANDER)~ THEN REPLY @10001 GOTO 11
END


/////                                                  \\\\\
///// Stuff for Nallabir (Talos)                       \\\\\
/////                                                  \\\\\

REPLACE_STATE_TRIGGER BHNALLA 0
~NumTimesTalkedTo(0)
OR(6)
  Alignment(Player1,CHAOTIC_NEUTRAL)
  Alignment(Player1,NEUTRAL_EVIL)
  Alignment(Player1,CHAOTIC_EVIL)
  Kit(Player1,GODTALOS)
  Global("CDFakeSharT","GLOBAL",1)
  Global("CDFakeTempusT","GLOBAL",1)
OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Global("BeholderPlot","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHNALLA 3
~OR(6)
  Alignment(Player1,CHAOTIC_NEUTRAL)
  Alignment(Player1,NEUTRAL_EVIL)
  Alignment(Player1,CHAOTIC_EVIL)
  Kit(Player1,GODTALOS)
  Global("CDFakeSharT","GLOBAL",1)
  Global("CDFakeTempusT","GLOBAL",1)
OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

ADD_TRANS_ACTION BHNALLA BEGIN 21 END BEGIN 3 END ~EraseJournalEntry(@10133) EraseJournalEntry(@10130)~

/////                                                  \\\\\
///// Stuff for Oisig (Watcher)                        \\\\\
/////                                                  \\\\\

REPLACE_STATE_TRIGGER BHOISIG 4
~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
ReputationGT(Player1,14)
OR(3)
  Alignment(Player1,MASK_LAWFUL)
  Alignment(Player1,NEUTRAL)
  Global("CDFakeXvimT","GLOBAL",1)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
!Kit(Player1,GODLATHANDER)
Global("CDWorkingForLathander","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHOISIG 5
~OR(6)
  Class(Player1,CLERIC)
  Class(Player1,FIGHTER_CLERIC)
  Class(Player1,CLERIC_MAGE)
  Class(Player1,CLERIC_THIEF)
  Class(Player1,FIGHTER_MAGE_CLERIC)
  Class(Player1,CLERIC_RANGER)
ReputationLT(Player1,15)
OR(3)
  Alignment(Player1,MASK_LAWFUL)
  Alignment(Player1,NEUTRAL)
  Global("CDFakeXvimT","GLOBAL",1)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)
!Kit(Player1,GODLATHANDER)~

REPLACE_STATE_TRIGGER BHOISIG 6
~!Class(Player1,CLERIC)
!Class(Player1,FIGHTER_CLERIC)
!Class(Player1,CLERIC_MAGE)
!Class(Player1,CLERIC_THIEF)
!Class(Player1,FIGHTER_MAGE_CLERIC)
!Class(Player1,CLERIC_RANGER)
ReputationGT(Player1,14)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

REPLACE_STATE_TRIGGER BHOISIG 7
~!Class(Player1,CLERIC)
!Class(Player1,FIGHTER_CLERIC)
!Class(Player1,CLERIC_MAGE)
!Class(Player1,CLERIC_THIEF)
!Class(Player1,FIGHTER_MAGE_CLERIC)
!Class(Player1,CLERIC_RANGER)
ReputationLT(Player1,15)
Global("BeholderPlot","GLOBAL",0)
Global("NoHelpBeholder","GLOBAL",0)~

ADD_STATE_TRIGGER BHOISIG 0  ~AreaCheck("AR0900")~

REPLACE_ACTION_TEXT BHOISIG
~SetGlobal("BeholderPlot","GLOBAL",1)~
~SetGlobal("BeholderPlot","GLOBAL",1)
SetGlobal("CDWorkingForHelm","GLOBAL",1)~

ADD_TRANS_ACTION BHOISIG BEGIN 24 END BEGIN 3 END ~EraseJournalEntry(@10133) EraseJournalEntry(@10130)~

EXTEND_BOTTOM BHOISIG 0
IF ~Class(Player1,CLERIC_RANGER)~ THEN GOTO 1
END

EXTEND_BOTTOM BHOISIG 3 // gives vanilla LG & TN vanilla/Kossuth/Oghma/Ilmater clerics an option for Lathander
IF ~!Kit(Player1,GODHELM)
    OR(2)
      Alignment(Player1,LAWFUL_GOOD)
      Alignment(Player1,NEUTRAL)
    !Kit(Player1,GODHELM)
    Global("CDFakeXvimF","GLOBAL",0)
    OR(6)
      Class(Player1,CLERIC)
      Class(Player1,FIGHTER_CLERIC)
      Class(Player1,CLERIC_MAGE)
      Class(Player1,CLERIC_THIEF)
      Class(Player1,FIGHTER_MAGE_CLERIC)
      Class(Player1,CLERIC_RANGER)~ THEN GOTO PerhapsHelpLathander
END

EXTEND_BOTTOM BHOISIG 30
IF ~Class(Player1,CLERIC_RANGER)
    OR(2)
      Alignment(Player1,MASK_LAWFUL)
      Alignment(Player1,NEUTRAL)
    Global("PlayerHasStronghold","GLOBAL",0)~ THEN GOTO 31
END

APPEND BHOISIG
IF WEIGHT #-100 ~Global("CDSpawnOisig","GLOBAL",2)
                 OR(6)
                   Class(Player1,CLERIC)
                   Class(Player1,FIGHTER_CLERIC)
                   Class(Player1,CLERIC_MAGE)
                   Class(Player1,CLERIC_THIEF)
                   Class(Player1,FIGHTER_MAGE_CLERIC)
                   Class(Player1,CLERIC_RANGER)
                 OR(2)
                   Alignment(Player1,MASK_LAWFUL)
                   Alignment(Player1,NEUTRAL)
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
