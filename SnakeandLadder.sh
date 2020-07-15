#!/bin/bash -x
echo "=============Welcome to Snake and ladder program=============="
function diceRoll(){
    dieResult=$((RANDOM % 6 + 1))
    positionOfPlayer=$(($positionOfPlayer+$dieResult))
    echo "positionOfPlayer:$positionOfPlayer"
}
diceRoll
