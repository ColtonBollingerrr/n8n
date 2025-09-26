# Use the official n8n image
FROM n8nio/n8n:latest

# Cloud Run needs the app to bind on 0.0.0.0
ENV N8N_LISTEN_ADDRESS=0.0.0.0
# Default (will be overridden by $PORT at runtime)
ENV N8N_PORT=5678

# Use root just to place the script, then drop back to non-root
USER root
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod 0755 /usr/local/bin/startup.sh
USER node

# Use /bin/sh explicitly to avoid any shebang/exec edge cases
ENTRYPOINT ["/bin/sh", "/usr/local/bin/startup.sh"]
