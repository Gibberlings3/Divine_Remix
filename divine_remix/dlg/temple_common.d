REPLACE_ACTION_TEXT BHNALLA // set var for working for talos, like we already have for arval and oisig
~SetGlobal("BeholderPlot","GLOBAL",1)~
~SetGlobal("BeholderPlot","GLOBAL",1)
SetGlobal("CDWorkingForTalos","GLOBAL",1)~

/////                                                  \\\\\
///// Stuff for Borinall (thief of the dawn ring)      \\\\\
/////                                                  \\\\\

REPLACE BORINALL

  // replaced so we can keep the response order the same
  IF ~~ THEN BEGIN 8 SAY #37575
     // legit talos
    IF ~Global("CDWorkingForTalos","GLOBAL",1)
        Global("Stripped","GLOBAL",0)~ THEN REPLY #37577 GOTO 9

    // was legit talos, but no longer
    IF ~Global("CDWorkingForTalos","GLOBAL",1)
        !Global("Stripped","GLOBAL",0)~ THEN REPLY #37577 DO ~SetGlobal("TalosStrike","LOCALS",1)~ EXIT

    // pretending to be talos
    IF ~!Global("CDWorkingForTalos","GLOBAL",1)~ THEN REPLY #37577 DO ~SetGlobal("TalosStrike","LOCALS",1)~ EXIT

    // generic copout
    IF ~~ THEN REPLY #37578 GOTO 10

    // angry lathander dude
    IF ~Global("Stripped","GLOBAL",0)
        Kit(PLAYER1,GODLATHANDER)~ THEN REPLY #37579 GOTO 11

    // slightly different response for someone who's only working for lathander
    IF ~OR(2)
          !Global("Stripped","GLOBAL",0) 
          !Kit(PLAYER1,GODLATHANDER)~ THEN REPLY @10001 GOTO 11
  END

END
