# Server Performance Stats (`https://roadmap.sh/projects/server-stats`)   



Bash automation script to analyze and display Linux system performance metrics in the terminal and desktop GUI pop-up.

---

## Features

- **CPU Usage:** Calculates real-time system load average.
- **Memory Stats:** Displays total, used, free, and swap memory in human-readable format (`free -h`).
- **Disk Space:** Monitors storage capacity and percentage used on the root partition (`/`).
- **Top 5 CPU Processes:** Cleanly lists top CPU-consuming programs without messy arguments.
- **Top 5 Memory Processes:** Cleanly lists top RAM-consuming programs.
- **System Info (Stretch Goals):** Displays OS version, system uptime, and logged-in user counts.
- **Dual Display Mode:** Output is rendered directly in the terminal as well as inside a GUI pop-up window using **Zenity**.

---

## Requirements

- **Linux Environment:** Tested on Linux Mint / Ubuntu-based distributions.
- **Dependencies:**
  - `bash`
  - `zenity` (for desktop GUI notifications, pre-installed on Linux Mint)
  - Core utilities (`ps`, `df`, `free`, `uptime`, `lsb_release`)

---
