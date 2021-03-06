#!/bin/bash -x
echo "=============Welcome to Snake and ladder program=============="
NO_PLAY=0
LADDER=1
SNAKE=2
positionOfPlayer=0
chance=1
WINNING_POSITION=100
dieResult=0
checkOptions=0
STARTINGPOSITION=0
numberOfTimesPlayer1Diceroll=0
numberOfTimesPlayer2Diceroll=0
playerOne=0
playerTwo=0
declare -a playerOne
declare -a playerTwo

function noPlay(){
   positionOfPlayer=$((positionOfPlayer+0))
   return $positionOfPlayer
}

function ladder(){
   if [ $((positionOfPlayer+$dieResult)) -gt $WINNING_POSITION ]
   then
        positionOfPlayer=$((positionOfPlayer-$dieResult))
   else
        positionOfPlayer=$((positionOfPlayer+$dieResult))
   fi
   return $positionOfPlayer
   #diceRoll $playerOne
}

function snake(){
   if [ $((positionOfPlayer-$dieResult)) -lt $STARTINGPOSITION ]
   then
       positionOfPlayer=$STARTINGPOSITION
   else
        positionOfPlayer=$((positionOfPlayer-$dieResult))
   fi
   return $positionOfPlayer
}

function diceRoll(){
 positionOfPlayer=$1
 dieResult=$((RANDOM % 6 + 1))
 checkOptions=$((RANDOM % 3))
   case $checkOptions in
        $NO_PLAY)
               noPlay;;
        $LADDER)
               ladder;;
        $SNAKE)
               snake;;
        esac
}

function switchToPlayer(){
   while [ $positionOfPlayer -le $WINNING_POSITION ]
   do
      if [ $chance -eq 1 ]
      then
         ((numberOfTimesPlayer1Diceroll++))     
      diceRoll $playerOne
      playerOne=$?
      playerOne[$numberOfTimesDiceRoll]=$playerOne
      echo "Player1 position :" $playerOne
         if [ $playerOne -eq $WINNING_POSITION ]
         then
         echo "player1 win"
         break
      else
         ((numberOfTimesPlayer2Diceroll++))
         diceRoll $playerTwo
         playerTwo=$?
         playerTwo[$numberOfTimesDiceRoll]=$playerTwo
         echo "Player2 position :" $playerTwo
            if [ $playerTwo -eq $WINNING_POSITION ]
            then
               echo "player2 win"
            break
            fi
              chance=1
          fi
        fi
     done
}
switchToPlayer
echo "Numberoftimesplayer1diesrolled= $numberOfTimesPlayer1Diceroll Numberoftimesplayer2diesrolled= $numberOfTimesPlayer1Diceroll"


