#!/bin/bash

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= status =\033[0m"

git status
git submodule foreach --recursive "git status; echo"

echo -e "\033[42;37m============================================================\033[0m"

