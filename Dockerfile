# Use the official n8n image
FROM n8nio/n8n:latest

# Ensure n8n listens on all interfaces (Cloud Run requirement)
ENV N8N_LISTEN_ADDRESS=0.0.0.0
ENV N8N_PORT=5678

# Temporarily escalate to root to place the startup script
USER root

# Copy startup script and make it executable
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod 0755 /usr/local/bin/startup.sh

# Drop back to the default non-root user for runtime
USER node

# Entrypoint
CMD ["/usr/local/bin/startup.sh"]
