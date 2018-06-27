#!/bin/bash

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= fetch upstream =\033[0m"

git fetch upstream; echo
git submodule foreach --recursive "git fetch upstream; echo"

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= merge upstream =\033[0m"

git merge upstream/master
cd contracts/libc++/upstream && git merge upstream/eosio ; cd -
cd contracts/musl/upstream && git merge upstream/eosio ; cd -
cd externals/binaryen && git merge upstream/eosio ; cd -
cd externals/binaryen/test/emscripten && git merge upstream/incoming ; cd -
cd externals/binaryen/test/spec && git merge upstream/master ; cd -
cd externals/binaryen/test/waterfall && git merge upstream/master ; cd -
cd externals/magic_get && git merge upstream/develop ; cd -
cd libraries/appbase && git merge upstream/master ; cd -
cd libraries/chainbase && git merge upstream/master ; cd -
cd libraries/fc && git merge upstream/master ; cd -
cd libraries/softfloat && git merge upstream/master ; cd -

echo -e "\033[42;37m============================================================\033[0m"

