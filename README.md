# cloady-xray

Self-use Xray node for Cloady (VLESS + WebSocket, container port 3000, TLS terminated by the platform HTTPS入口).

This repository contains NO credentials. The node UUID and WebSocket path are supplied at deploy time as environment variables in Cloady:

- `UUID` — VLESS user ID (required, no default)
- `WSPATH` — WebSocket path, e.g. `/your-random-path` (default `/ray`)

Deploy on Cloady: New application → paste this repository URL → region USE1 → set the two environment variables above → keep resources within the free allowance (0.5 vCPU / 1 GB RAM / 5 GB SSD, backups off) → Deploy.
