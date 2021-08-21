#!/bin/bash

npx moduleserve static/ --host 0.0.0.0 --port 3000 --spa &
npx rescript build -verbose -w -ws 0.0.0.0:5000
