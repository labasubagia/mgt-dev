## Setup

1. Prerequisites: podman or docker installed and run commands from the project root.

2. Make port script executable and run it:
```bash
./allow_port.sh
```

3. Create and edit Composer auth:
```bash
cp composer_auth.example.json composer_auth.json
# edit composer_auth.json and set the required auth information
```

4. Start containers (choose one):
```bash
# Podman
podman compose up -d

# or Docker
docker compose up -d
```

5. Show url
```bash
./show_url.sh
```