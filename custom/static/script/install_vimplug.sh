#!/bin/bash

nvim +'PlugInstall --sync' +qall
nvim +'CocInstall -sync coc-yaml coc-json coc-clangd' +qall

