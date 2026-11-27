# Liam's Satisfactory server — a clone of wolveix/satisfactory-server
# with one adjustment: longer join/connection timeouts, seeded into the
# server's config on first boot, so players stop getting dropped with
# "ConnectionTimeout" while loading into the world.
# Everything else is stock wolveix.

FROM wolveix/satisfactory-server:latest

COPY defaults/Engine.ini /defaults/Engine.ini
COPY entrypoint.sh /liam-entrypoint.sh
RUN chmod +x /liam-entrypoint.sh

ENTRYPOINT ["/liam-entrypoint.sh"]
