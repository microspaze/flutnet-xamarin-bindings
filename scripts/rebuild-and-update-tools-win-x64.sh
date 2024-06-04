#!/usr/bin/env bash

# Define paths
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TOOLS_SRC_DIR=$SCRIPT_DIR/../toolsSrc
TOOLS_DIR=$SCRIPT_DIR/../tools
TOOLS_PRJ=$TOOLS_SRC_DIR/FlutterSync/FlutterSync.csproj

# Clean the output of the previous builds 
# (ignore any error, the clean will still complete successfully)
dotnet clean "$TOOLS_PRJ" -c Release -f net8.0 -r win-x64 -v quiet --nologo

# Publish executable for macOS
dotnet publish "$TOOLS_PRJ" -c Release -f net8.0 -o "$TOOLS_DIR/FlutterSync" -p:PublishSingleFile=true -r win-x64 --no-self-contained -v minimal --nologo