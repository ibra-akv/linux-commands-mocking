Linux command mocking
=====================
> This simple **python** app allows you to mock linux commands for your testing purposes.

**Warning**  
The `remote_install.sh` script edits the `$PATH` env var so only use it in docker containers or
re-edit your `$PATH` back to original value after your done.

## Usage

cli_mock_map.json:
```json
{
    "ls": [
        {
            "input": [ "/home/user" ],
            "output": "list.py                 file.boot"
        },
        {
            "input": [ "/var/log" ],
            "output": "syslog\nlastlog\nsecure.log"
        },
        {
            "input": ["/tmp"],
            "output": {
                "file": "/var/log/alternatives.log"
            }
        }
    ]
}
```

more docs coming soon...

## Source
This repo is a fork of [**wacekdziewulski/climate**](https://github.com/wacekdziewulski/climate)