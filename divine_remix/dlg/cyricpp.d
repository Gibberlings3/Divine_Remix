APPEND CHALCY01

IF WEIGHT #-1 ~Kit(Player1,A#CYRIC)
Global("BeginChallenge4","GLOBAL",3)~ THEN BEGIN a1
  SAY @13026
    = @13027
    = @13013
    IF ~~ THEN REPLY @13014 GOTO a2
    IF ~~ THEN REPLY @13015 GOTO a3
END

IF ~~ THEN BEGIN a2
  SAY @13016
  IF ~~ THEN REPLY #72286 /* ~If I was a threat to you, why wouldn't you just kill me?~ */ GOTO a4
END

IF ~~ THEN BEGIN a3
  SAY @13017
  IF ~~ THEN REPLY #72286 /* ~If I was a threat to you, why wouldn't you just kill me?~ */ GOTO a4
END

IF ~~ THEN BEGIN a4
  SAY #72289 /* ~Ahhhh, if only things were so easy as that.  But if I get involved in the whole Bhaalspawn mess, then my own opponents amongst the gods would intervene.  Mystra... or Kelemvor, perhaps.~ [CYRIC05] */
    = #72291 /* ~And it seems that Ao, the Overfather, has an interest in this as well... which is very odd.  He wishes this little climactic end for the Bhaalspawn to play itself out without interference from the rest of us.~ [CYRIC06] */
    = #72292 /* ~And so I, the great Cyric, am restricted to watching and observing.  And yet if there is anyone who should feel threatened by a child of the former Lord of Murder, it is *me*.  There is just no justice anymore.~ [CYRIC07] */
    IF ~~ THEN REPLY @13018 GOTO a5
    IF ~~ THEN REPLY @13019 GOTO a6
    IF ~~ THEN REPLY @13020 GOTO a6
END

IF ~~ THEN BEGIN a5
  SAY #72312 /* ~I see.  I would have expected you to say as much, <CHARNAME>.~ [CYRIC09] */
    = @13021
    = @13022
    IF ~~ THEN DO ~ReallyForceSpellRES("SPCL234",Player1)~ GOTO 19
END

IF ~~ THEN BEGIN a6
  SAY #72312 /* ~I see.  I would have expected you to say as much, <CHARNAME>.~ [CYRIC09] */
    = @13023
    = @13024
    = #72319 /* ~I think you need to be tested.  That *is* what you created these little rooms for, isn't it?  To test yourself?  Mystra and Ao couldn't fault me for aiding you towards that end, now, could they?~ [CYRIC15] */
    = @13025
    IF ~~ THEN DO ~SetGlobal("BeginChallenge4","GLOBAL",4)
ClearAllActions()
StartCutSceneMode()
StartCutScene("cutch4c")~ EXIT
END

END
