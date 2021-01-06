#!/bin/bash

cp ~/.gitconfig data

rm -fr data/autokey

mkdir -p data/autokey/data

cp ~/.config/autokey/autokey.json data/autokey
cp -R ~/.config/autokey/data/* data/autokey/data