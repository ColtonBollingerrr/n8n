# Use the official n8n image
FROM n8nio/n8n:latest

# Ensure n8n listens on all interfaces (Cloud Run requirement)
ENV N8N_LISTEN_ADDRESS=0.0.0.0

# Optional: set a sane default; Cloud Run passes $PORT and we map it below
ENV N8N_PORT=5678

# Copy a tiny wrapper that maps Cloud Run's $PORT to N8N_PORT and starts n8n
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Cloud Run sends SIGTERM; n8n handles graceful shutdown internally
CMD ["/usr/local/bin/startup.sh"]
