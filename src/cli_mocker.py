#!/usr/bin/python3

import os
import sys
import json

CONFIG_PATH = "/usr/local/climate/cli_mock_map.json"
OUTPUT_LOG_STREAM = sys.stderr


def normalize_path(path):
    if path.startswith("./"):
        return path[2:]
    else:
        return path


with open(CONFIG_PATH) as f:
    config = json.load(f)

application_name = os.path.basename(sys.argv[0])
if application_name in config:
    for mock_inputs in config[application_name]:
        if mock_inputs["input"] == sys.argv[1:]:
            if type(mock_inputs['output']) is str:
                print(mock_inputs["output"])
            else:
                with open(mock_inputs['output']['file']) as fo:
                    print(fo.read())
