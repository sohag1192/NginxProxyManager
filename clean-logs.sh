#!/bin/bash
# Script to clean Nginx Proxy Manager log files and Docker container logs

LOG_DIR="./data/logs"

echo "🧹 Cleaning Nginx Proxy Manager logs..."

# 1. Truncate Nginx Proxy Manager log files if directory exists
if [ -d "$LOG_DIR" ]; then
    echo "  - Truncating log files in $LOG_DIR..."
    find "$LOG_DIR" -type f -name "*.log" -exec truncate -s 0 {} +
    find "$LOG_DIR" -type f -name "*.log.*" -delete
    echo "  - Done cleaning $LOG_DIR"
else
    echo "  - $LOG_DIR does not exist. Skipping."
fi

# 2. Truncate Docker container logs if container exists
CONTAINER_ID=$(docker ps -q -f name=nginx-proxy-manager)
if [ -z "$CONTAINER_ID" ]; then
    CONTAINER_ID=$(docker ps -q -f name=app)
fi

if [ -n "$CONTAINER_ID" ]; then
    CONTAINER_LOG=$(docker inspect --format='{{.LogPath}}' "$CONTAINER_ID" 2>/dev/null)
    if [ -n "$CONTAINER_LOG" ] && [ -f "$CONTAINER_LOG" ]; then
        echo "  - Truncating Docker container log ($CONTAINER_LOG)..."
        truncate -s 0 "$CONTAINER_LOG"
    fi

    echo "  - Reloading Nginx..."
    docker exec "$CONTAINER_ID" nginx -s reload 2>/dev/null || true
fi

echo "✅ Log cleanup completed successfully!"
