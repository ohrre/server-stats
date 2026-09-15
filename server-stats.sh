#!/bin/bash

# Clear screen for a clean view
clear

echo "=========================================="
echo "         SERVER PERFORMANCE STATS         "
echo "=========================================="
echo ""

# System Info 
echo "--- SYSTEM INFO ---"
echo "OS Version : $(lsb_release -d | cut -f2)"
echo "Uptime     : $(uptime -p)"
echo "Users Logged In: $(who | wc -l)"
echo ""

# CPU Usage
echo "--- CPU USAGE ---"
echo "Current CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

# Memory Usage (Free vs Used)
echo "--- MEMORY USAGE (MB) ---"
free -h
echo ""

# Disk Usage
echo "--- DISK USAGE ---"
df -h /
echo ""

# Top 5 Processes by CPU 
echo "--- TOP 5 PROCESSES BY CPU ---"
ps -eo pid,%cpu,%mem,comm --sort=-%cpu | head -n 6
echo ""

# Top 5 Processes by Memory (Clean output using 'comm')
echo "--- TOP 5 PROCESSES BY MEMORY ---"
ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6
echo ""

echo "=========================================="

# Display results in a pop-up window
if command -v zenity &> /dev/null && [ -n "$DISPLAY" ]; then
    # Run commands and capture output for the window
    STATS_TEXT=$(
        echo "=== SYSTEM INFO ==="
        echo "Uptime: $(uptime -p)"
        echo ""
        echo "=== MEMORY USAGE ==="
        free -h
        echo ""
        echo "=== DISK USAGE ==="
        df -h /
        echo ""
        echo "=== TOP 5 CPU PROCESSES ==="
        ps -eo pid,%cpu,%mem,comm --sort=-%cpu | head -n 6
        echo ""
        echo "=== TOP 5 MEMORY PROCESSES ==="
        ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6
    )
    
    zenity --info --title="Server Stats" --text="$STATS_TEXT" --width=500 2>/dev/null || true
fi