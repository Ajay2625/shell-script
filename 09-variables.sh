#!/bin/bash

NUMBER=$1

if[ $NUMBER -gt 100 ]
then
    echo "Number is greater than 100"
else
    echo "Number is less than or equal to 100"
fi