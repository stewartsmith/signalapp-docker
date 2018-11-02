#!/bin/bash -x
xhost +SI:localuser:$(id -un)
sudo docker run -ti -e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix:z \
	-e XDG_RUNTIME_DIR=/tmp \
	-e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
	-v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY:z \
	--user=$(id -u):$(id -g) \
	-v $HOME/signaldata:/home:z signalapp
