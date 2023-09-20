#!/bin/bash

#GST_DEBUG=3 \
gst-launch-1.0 udpsrc address=192.168.123.33 port=9205 \
! "application/x-rtp,media=(string)video,encoding-name=(string)H264" \
! rtph264depay name=hoge \
! h264parse \
! queue \
! nvv4l2decoder \
! nvvidconv flip-method=2 \
! videoconvert \
! tee name=t \
t. ! queue \
! autovideosink \
t. ! queue \
! autovideosink \
t. ! queue \
! v4l2sink device="/dev/CameraAbdomen" \

