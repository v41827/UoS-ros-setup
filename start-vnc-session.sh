#!/bin/bash
vncserver :1 -geometry 1280x800 -depth 24
/usr/share/novnc/utils/launch.sh --vnc localhost:5901 --listen 6080
