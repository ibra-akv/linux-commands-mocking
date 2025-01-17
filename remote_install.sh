
TEMP_DIR="/tmp/linux-commands-mocking"
TARGET_DIR="/usr/local/climate"

# git clone
git clone https://github.com/ibra-akv/linux-commands-mocking.git $TEMP_DIR

# make dirs
mkdir -p $TARGET_DIR

# copy files
cp $TEMP_DIR/src/cli_mocker.py $TARGET_DIR/
cp $TEMP_DIR/src/symlinker.py $TARGET_DIR/
cp $TEMP_DIR/src/cli_mock_map.json $TARGET_DIR/

# permissions
chmod +x $TARGET_DIR/cli_mocker.py
chmod +x $TARGET_DIR/symlinker.py

# creating symlinks
python3 $TARGET_DIR/symlinker.py --mock-map-file=$TARGET_DIR/cli_mock_map.json --mock-dir=$TARGET_DIR

# modifying $PATH env var so that for each linux command executed, $TARGET_DIR is checked first
echo "export PATH=$TARGET_DIR:$PATH" >> /root/.bashrc
