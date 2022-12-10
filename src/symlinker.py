from argparse import ArgumentParser
import json
import os


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('--mock-map-file', '-f', type=str, required=True, help='json file with all mocking maps.')
    parser.add_argument('--mock-dir', type=str, required=True)

    args = parser.parse_args()
    if not os.path.isfile(args.mock_map_file):
        raise Exception(f'{args.mock_map_file} does not exist.')

    with open(args.mock_map_file, 'r') as f:
        data = json.loads(f.read())

    for (command, data) in data.items():
        mocker_path = os.path.join(args.mock_dir, 'cli_mocker.py')
        mocked_command = os.path.join(args.mock_dir, command)
        os.symlink(mocker_path, mocked_command)
