#!/bin/sh
set -eu

# Cloud Run sets $PORT (usually 8080). Map to n8n's port.
if [ -n "${PORT:-}" ]; then
  export N8N_PORT="$PORT"
fi

# Bind correctly in Cloud Run
export N8N_LISTEN_ADDRESS="${N8N_LISTEN_ADDRESS:-0.0.0.0}"
export N8N_HOST="${N8N_HOST:-0.0.0.0}"
export N8N_PROTOCOL="${N8N_PROTOCOL:-https}"

# Optional: reduce noise/telemetry in logs
export N8N_DIAGNOSTICS_ENABLED="${N8N_DIAGNOSTICS_ENABLED:-false}"
export N8N_HIRING_BANNER_ENABLED="${N8N_HIRING_BANNER_ENABLED:-false}"

echo "[startup] PORT=${PORT:-unset}  -> N8N_PORT=$N8N_PORT"
echo "[startup] N8N_LISTEN_ADDRESS=$N8N_LISTEN_ADDRESS  N8N_PROTOCOL=$N8N_PROTOCOL"

# Start n8n and fail fast if it exits
exec n8n start
