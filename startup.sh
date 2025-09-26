#!/bin/sh
# Map Cloud Run's $PORT to n8n's port if present
if [ -n "$PORT" ]; then
  export N8N_PORT="$PORT"
fi

# If you deploy behind HTTPS, set protocol accordingly (Cloud Run is HTTPS)
export N8N_PROTOCOL=${N8N_PROTOCOL:-https}
# Bind host
export N8N_HOST=${N8N_HOST:-0.0.0.0}

# Start n8n
exec n8n start
