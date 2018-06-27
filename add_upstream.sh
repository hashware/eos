#!/bin/bash

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= add upstream =\033[0m"
git remote add upstream https://github.com/EOSIO/eos.git

cd libraries/chainbase && \
git remote add upstream https://github.com/EOSIO/chainbase.git ; cd -

cd  libraries/appbase && \
git remote add upstream https://github.com/EOSIO/appbase.git ; cd -

cd contracts/musl/upstream && \
git remote add upstream https://github.com/EOSIO/musl.git ; cd -

cd contracts/libc++/upstream && \
git remote add upstream https://github.com/EOSIO/libcxx.git ; cd -

cd externals/binaryen && \
git remote add upstream https://github.com/EOSIO/binaryen ; cd -

cd externals/binaryen/test/spec && \
git remote add upstream https://github.com/WebAssembly/testsuite.git ; cd -

cd externals/binaryen/test/waterfall && \
git remote add upstream https://github.com/WebAssembly/waterfall.git ; cd -

cd externals/binaryen/test/emscripten && \
git remote add upstream https://github.com/kripken/emscripten.git ; cd -

cd libraries/softfloat && \
git remote add upstream https://github.com/EOSIO/berkeley-softfloat-3.git ; cd -

cd externals/magic_get && \
git remote add upstream https://github.com/EOSIO/magic_get ; cd -

cd libraries/fc && \
git remote add upstream https://github.com/EOSIO/fc.git ; cd -

git submodule foreach --recursive "pwd; git config -l | grep remote.upstream; echo"

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= branch =\033[0m"
git submodule foreach --recursive "git branch"

git submodule foreach --recursive "git checkout -b eos-zh origin/eos-zh | true"
git submodule foreach --recursive "git checkout eos-zh"

git submodule foreach --recursive "git branch"

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= fetch upstream =\033[0m"
git submodule foreach --recursive "git fetch upstream"

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
echo -e "\033[42;37m= status =\033[0m"
git status
git submodule foreach --recursive "git status; echo"

echo -e "\033[42;37m============================================================\033[0m"
echo -e "\033[42;37m= push =\033[0m"
git submodule foreach --recursive "git push; echo"



