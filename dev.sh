#!/bin/bash

npx webpack serve --mode development &
npx rescript build -w
