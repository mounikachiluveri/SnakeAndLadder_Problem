#!/bin/bash -x
echo "=============Welcome to Snake and ladder program=============="
positionOfPlayer=0
NO_PLAY=0
LADDER=1
SNAKE=2
function noPlay(){
   positionOfPlayer=$((positionOfPlayer+0))
}

function ladder(){
   positionOfPlayer=$((positionOfPlayer+$dieResult))
}

function snake(){
  positionOfPlayer=$((positionOfPlayer-$dieResult))
}

function diceRoll(){
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
diceRoll
echo $positionOfPlayer
