# Deploy and Host

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/BV1O-V)

> **Canonical code:** `BV1O-V` — deploy URL: https://railway.app/template/BV1O-V

![OG Image](https://raw.githubusercontent.com/INAPP-Mobile/railway-arcane/main/og-image.svg)

Arcane is a modern, web-based Docker management interface. Manage containers, images, volumes, and networks from a clean UI — deploy it on Railway in minutes.

## About Hosting

Arcane runs as a single container with SQLite for persistence. Railway provides the compute, TLS at the edge, and a public URL. The service restarts automatically on failures. No external database is required — everything runs in one container.

## Why Deploy

- **Modern Docker UI** — Manage containers, images, volumes, and networks from a clean, intuitive web interface.
- **Zero external dependencies** — SQLite-based, no PostgreSQL or Redis required. Single container with a persistent volume.
- **5.9K+ GitHub stars** — Active community, fast-growing alternative to Portainer.
- **Built-in health check** — `/app/arcane health` monitored by Railway for automatic restarts.
- **MIT licensed** — Fully open source with no restrictions.

## Common Use Cases

- **Container management** — Start, stop, restart, and inspect containers from a browser.
- **Image management** — Pull, build, and remove Docker images with a visual interface.
- **Volume & network management** — Manage persistent storage and Docker networks.
- **Log viewing** — Stream container logs in real-time from the UI.
- **Quick deployment dashboard** — Monitor all your Docker services from one pane of glass.

## Dependencies for Arcane

### Deployment Dependencies

Arcane requires no external dependencies on Railway. It uses embedded SQLite for storage and runs entirely within its container. Optional: access to the Docker socket (`/var/run/docker.sock`) for managing containers on the host.

---

## Features

- Modern, responsive web UI for Docker management
- Container lifecycle management (start, stop, restart, logs)
- Image management (pull, build, remove)
- Volume and network management
- SQLite backend — no external database needed
- Pinned version (v2.2.0)
- One-click deploy

## Quick Start

1. Click **Deploy on Railway** above
2. Set `ENCRYPTION_KEY` and `JWT_SECRET` (generate with `openssl rand -hex 32`)
3. Set `APP_URL` to your Railway domain
4. Deploy — Arcane starts in ~30s
5. Open your Railway URL to access the Docker management UI

## Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `APP_URL` | Yes | — | Public URL of your Arcane instance |
| `ENCRYPTION_KEY` | Yes | — | 32-byte hex string for encryption |
| `JWT_SECRET` | Yes | — | 32-byte hex string for JWT signing |
| `PUID` | No | `65532` | User ID for file ownership |
| `PGID` | No | `65532` | Group ID for file ownership |

## Local Development

```bash
git clone https://github.com/INAPP-Mobile/railway-arcane && cd railway-arcane
cp .env.example .env && $EDITOR .env
docker build -t railway-arcane .
docker run -d -p 3552:3552 -v arcane-data:/app/data --env-file .env railway-arcane
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| UI not loading | Verify `APP_URL` matches your Railway domain |
| Login fails | Regenerate `ENCRYPTION_KEY` and `JWT_SECRET` |
| Docker socket errors | Mount `/var/run/docker.sock` if managing host containers |

## License

Arcane is MIT licensed. Template by [INAPP-Mobile](https://github.com/INAPP-Mobile).
