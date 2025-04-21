#!/bin/bash
FOLLOWER_SERIAL=5970072862
LEADER_SERIAL=5970073472

# Map serial ports
sudo tee /etc/udev/rules.d/99-lerobot-serial.rules > /dev/null <<EOF
SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d3", ATTRS{serial}=="$FOLLOWER_SERIAL", SYMLINK+="ttyFollower"
SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d3", ATTRS{serial}=="$LEADER_SERIAL", SYMLINK+="ttyLeader"
EOF


#sudo cp $PWD/docs/bin/99-usb-serial.rules /etc/udev/rules.d/99-serial.rules
sudo udevadm control --reload-rules
sudo udevadm trigger


# Start the container
docker run  -it --rm \
    --privileged \
    -v /dev:/dev \
    -v .:/lerobot \
    lerobot_cpu