#!/bin/bash

networksetup -setairportnetwork en0 ’Mozilla Guest’


WirelessPort=$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')
networksetup -removepreferredwirelessnetwork $WirelessPort Mozilla

security delete-generic-password -D "802.1X Password" -s com.apple.network.eap.user.item.wlan.ssid.Mozilla
