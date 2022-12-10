#!/bin/bash

# this will create all necessary symlinks to mock commands in "cli_mock_map.json"
python3 /usr/local/climate/symlinker.py --mock-map-file=/usr/local/climate/cli_mock_map.json --mock-dir=/usr/local/climate

exec "$@"