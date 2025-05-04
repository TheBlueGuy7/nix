#!/bin/bash

# Low urgency test
dunstify -u low "Low Urgency" "This is a low urgency notification."

# Normal urgency test
dunstify -u normal "Normal Urgency" "This is a normal urgency notification."

# Critical urgency test
dunstify -u critical "Critical Urgency" "This is a critical urgency notification."

# Progress bar test (e.g., 40% progress)
dunstify -h int:value:40 "Progress Bar" "This shows a 40% progress bar."

# Sticky history test
dunstify -h string:x-dunst-stack-tag:sticky "Sticky Notification" "This should stay in history."

