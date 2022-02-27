#!/bin/bash

nvim +'PlugInstall --sync' +qall
nvim +'CocInstall -sync coc-yaml coc-json coc-clangd' +qall
nvim /tmp/dummy.cpp +'CocCommand clangd.install' 'sleep 10' +qall

