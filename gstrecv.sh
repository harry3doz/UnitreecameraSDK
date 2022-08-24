#!/bin/bash

gst-launch-1.0 v4l2src device=/dev/video0 ! image/jpeg,width=1856,height=800,framerate=30/1 ! nvv4l2decoder mjpeg=1 ! nvvidconv ! video/x-raw,width=1856,height=800,format=I420,framerate=30/1 ! omxh264enc ! video/x-h264,stream-format=byte-stream ! h264parse ! rtph264depay ! udpsink host=192.168.123.33 port=9205
#gst-launch-1.0 udpsrc address=192.168.123.15 port=9205 ! application/x-rtp,media=video,encoding-name=H264 ! rtph264depay name=hoge ! h264parse ! queue ! omxh264dec ! nvvidconv flip-method=2 ! videoconvert ! autovideosink
#gst-launch-1.0 udpsrc address=192.168.123.15 port=9205 ! application/x-rtp,encoding-name=H264 ! rtph264depay ! h264parse ! queue ! omxh264dec ! autovideosink sync=false async=false

