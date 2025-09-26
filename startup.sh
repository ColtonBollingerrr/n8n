#!/bin/sh
set -e

# Map Cloud Run's $PORT to n8n
if [ -n "$PORT" ]; then
  export N8N_PORT="$PORT"
fi

# Cloud Run is HTTPS by default
export N8N_PROTOCOL=${N8N_PROTOCOL:-https}
export N8N_HOST=${N8N_HOST:-0.0.0.0}

# Start n8n
exec n8n start
