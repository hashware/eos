#!/bin/bash

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= branch =\033[0m"

git submodule foreach --recursive "git branch"

git submodule foreach --recursive "git checkout -b eos-zh origin/eos-zh | true"
git submodule foreach --recursive "git checkout eos-zh"

git submodule foreach --recursive "git branch"

echo -e "\033[42;37m============================================================\033[0m"

