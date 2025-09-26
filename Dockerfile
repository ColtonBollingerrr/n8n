# Use the official n8n image
FROM n8nio/n8n:latest

# Ensure n8n listens on all interfaces (Cloud Run requirement)
ENV N8N_LISTEN_ADDRESS=0.0.0.0

# Default port (Cloud Run injects $PORT, mapped in startup.sh)
ENV N8N_PORT=5678

# Copy startup script
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Entrypoint
CMD ["/usr/local/bin/startup.sh"]
