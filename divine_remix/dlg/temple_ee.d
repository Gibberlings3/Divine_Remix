// making state triggers for oisig and nalla to stop checking alignments and kits
// basically, if they spawn, they're driving the quest
// alignment/kit checks in ar0900.bcs will handle it
REPLACE_TRIGGER_TEXT BHNALLA
~OR(4)[ %TAB%%LNL%%MNL%%WNL%]+Alignment(Player1,CHAOTIC_NEUTRAL)[ %TAB%%LNL%%MNL%%WNL%]+Alignment(Player1,NEUTRAL_EVIL)[ %TAB%%LNL%%MNL%%WNL%]+Alignment(Player1,CHAOTIC_EVIL)[ %TAB%%LNL%%MNL%%WNL%]+Kit(Player1,GODTALOS)~ ~~

REPLACE_TRIGGER_TEXT BHOISIG
~OR(2)[ %TAB%%LNL%%MNL%%WNL%]+Alignment(Player1,MASK_LAWFUL)[ %TAB%%LNL%%MNL%%WNL%]+Alignment(Player1,NEUTRAL)~ ~~

// purge rep checks (letting weighting handle this
REPLACE_TRIGGER_TEXT BHOISIG // getting rid of rep check in states 5, 7
~InPartySlot(LastTalkedToBy,0)[ %TAB%%LNL%%MNL%%WNL%]+ReputationLT(Player1,15)~ ~InPartySlot(LastTalkedToBy,0)~

REPLACE_TRIGGER_TEXT BHARVAL // getting rid of rep check in state 5
~InPartySlot(LastTalkedToBy,0)[ %TAB%%LNL%%MNL%%WNL%]+ReputationLT(Player1,15)~ ~InPartySlot(LastTalkedToBy,0)~

// missing state triggers
ADD_STATE_TRIGGER BHOISIG 4 ~InPartySlot(LastTalkedToBy,0)~
ADD_STATE_TRIGGER BHOISIG 5 ~Global("CDWorkingForLathander","GLOBAL",0)~
