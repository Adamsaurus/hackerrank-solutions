#!/bin/bash

read X
read Y
read Z
 
if [ "$X" -eq "$Y" ]; then
    if [ "$Y" -eq "$Z" ]; then
        echo EQUILATERAL
    else
        echo ISOSCELES
    fi
else
    echo SCALENE
fi
