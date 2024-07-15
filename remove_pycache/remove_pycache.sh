#!/bin/bash

find -name "__pycache__" -type d -execdir rm -r '{}' '+'
