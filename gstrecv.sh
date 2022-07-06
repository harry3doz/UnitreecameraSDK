#!/bin/bash

#gst-launch-1.0 udpsrc address=192.168.123.15 port=9205 ! application/x-rtp,media=video,encoding-name=H264 ! rtph264depay name=hoge ! h264parse ! queue ! omxh264dec ! nvvidconv flip-method=2 ! videoconvert ! autovideosink
gst-launch-1.0 udpsrc address=192.168.123.15 port=9205 ! application/x-rtp,encoding-name=H264 ! rtph264depay ! h264parse ! queue ! omxh264dec ! autovideosink sync=false async=false

