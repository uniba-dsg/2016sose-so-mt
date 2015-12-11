#!/bin/bash

#run in a root shell!

# Default Image Stack
cd Default
sh buildStack.sh
cd ..

# Minimal-Base Image Stack
cd Minimal_Base
sh buildStack.sh
cd ..

# Minimal-Runtime Image Stack
cd Minimal_Runtime
sh buildStack.sh
cd ..

# API-only-Management
cd Api_only_Management
sh buildStack.sh
cd ..


