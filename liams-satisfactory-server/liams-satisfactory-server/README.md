# Liam's Satisfactory Server (Docker)

A clone of the `wolveix/satisfactory-server` Docker setup, adjusted for
playing on the same PC that hosts it:

- **Longer connection timeouts** baked in — fixes the "your connection
  to the host has been lost" / ConnectionTimeout drop while joining.
- **Fixed ports** (7777 UDP + TCP, 15000 UDP, 15777 UDP) — no random
  port mismatch.
- **Reuses your existing `satisfactory` Docker volume**, so the server
  you already claimed (and its world) carries over.

## Upload it to GitHub (optional)

1. On github.com, create a new repository (any name, e.g.
   `satisfactory-server`).
2. Upload all the files in this folder (not the .zip — the files).
   The repo works exactly the same whether it lives on GitHub or just
   on your PC; GitHub is just a place to keep it.

## Run it on your PC

1. Get this folder onto your PC (download it from GitHub, or unzip the
   copy Geekbar gave you) and open **Command Prompt inside the folder**.
2. Remove the old container first:
   ```
   docker stop mine
   docker rm mine
   ```
3. **The one line** — builds the container and starts it (it shows up
   in Docker Desktop like any other container):
   ```
   docker compose up -d --build
   ```
4. Give it a minute or two to boot, then in Satisfactory:
   **Server Manager → 127.0.0.1, port 7777** → Confirm the certificate.
   Your server should already be claimed, with your name and password
   from before.

## If joins STILL drop with ConnectionTimeout

Docker Desktop's network translation is the last suspect. Switch the
server to host networking:

1. Docker Desktop → Settings → Resources → Network → turn on
   **Enable host networking** → Apply & restart.
2. In Command Prompt in this folder:
   ```
   docker compose down
   docker compose -f docker-compose.yml -f docker-compose.host.yml up -d --build
   ```
3. Join again at 127.0.0.1, port 7777.

## Day to day

- Stop: `docker compose down`
- Start: `docker compose up -d`
- Logs: `docker compose logs -f`
- Update the game: `docker compose up -d --build` (the startup update
  check only downloads what changed — it does not stack 20 GB copies)
- More players: change `MAXPLAYERS` in docker-compose.yml, then start
  it again.
