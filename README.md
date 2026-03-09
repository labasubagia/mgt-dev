## Overview

This repository runs a local Magento / CloudPanel development container (`mgt-dev`) that exposes web, SSH, database, and admin ports. It provides small helper scripts for preparing ports and showing the dashboard URL.

**Files:**
- [allow_port.sh](allow_port.sh): makes low-numbered ports available to non-root users (uses `sysctl`).
- [compose.yml](compose.yml): Podman/Docker Compose service definition for the `mgt-dev` container.
- [composer_auth.example.json](composer_auth.example.json): example Composer auth JSON for repo.magento.com credentials.
- [composer_auth.json](composer_auth.json): local Composer auth (contains secrets — keep out of VCS).
- [show_url.sh](show_url.sh): prints the dashboard URL (handles WSL specially).

## Prerequisites

- Podman or Docker installed and usable from your shell.
- Enough resources available (compose.yml sets memory limits).

## Quick start

1. From the project root, make helper scripts executable and allow ports:

```bash
./allow_port.sh
```

2. Create Composer auth (do not commit your credentials):

```bash
cp composer_auth.example.json composer_auth.json
# edit composer_auth.json and set repo.magento.com username/password
```

3. Start containers (choose one):

```bash
# Podman
podman compose up -d

# or Docker
docker compose up -d
```

4. Show dashboard URL:

```bash
./show_url.sh
```

## Useful commands

- Stop containers: `podman compose down` or `docker compose down`
- View logs: `podman compose logs -f` or `docker compose logs -f`

## Notes

- The service maps these ports (see [compose.yml](compose.yml)):
	- 80, 443 (web), 22 (SSH), 8443 (admin/dashboard), 3306 (MySQL), 9200, 15672
- Volumes include an external volume `mgt_data` and a bind mount for `composer_auth.json`. The compose file uses `:Z` labels for SELinux compatibility.
- `privileged: true` is set in the compose file to allow required permissions for some container operations; when running rootless Podman this gives the maximum permissions available to the user.
- `composer_auth.json` contains sensitive credentials — keep it local and out of version control.
- If you run under WSL, follow the message printed by `show_url.sh` to update Windows hosts.

## Troubleshooting

- If ports fail to bind, ensure `allow_port.sh` was run and your user has permission to bind unprivileged ports.
- If services fail to start, inspect logs and ensure you have sufficient memory and CPU as defined in [compose.yml](compose.yml).