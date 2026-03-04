#!/bin/bash

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

echo "script executed in :$(($END_TIME-$START_TIME))"