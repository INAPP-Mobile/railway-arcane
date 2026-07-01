FROM ghcr.io/getarcaneapp/manager:v2.2.0

LABEL org.opencontainers.image.source="https://github.com/INAPP-Mobile/railway-arcane"

# Arcane listens on port 3552.
# Railway injects PORT for health checks and routing.
ENV PORT=3552

# Health check via the built-in CLI command
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD /app/arcane health || exit 1

EXPOSE 3552
