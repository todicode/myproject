set -euo pipefail
THRESHOLD=80

echo "System Health Check $(date)"

DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
  echo "Alert: Disk usage is at ${DISK_USAGE}%"
else
  echo "Disk usage is at ${DISK_USAGE}%"
fi

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')
echo "Memory usage is at ${MEMORY_USAGE}%"
if [ "$MEMORY_USAGE" -gt "$THRESHOLD" ]; then
    echo "Alert: Memory usage is at ${MEMORY_USAGE}%"
fi

CPU_CORES=$(nproc)
LOAD=$(awk '{print $1}' /proc/loadavg)
echo "CPU Load(1m): ${LOAD} on ${CPU_CORES} cores"
echo "Check completed."