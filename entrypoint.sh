#!/bin/bash

fastfetch --pipe

bash -e $INPUT_SCRIPT || exit $?
