#!/usr/bin/env bash

set -xeu

source .env

function assert_directory
{
    directory="$1"
    user="$2"
    group="$3"
    perms="$4"

    mkdir -p "$directory"
    chown "$user:$group" "$directory"
    chmod "$perms" "$directory"
}

# Assert container data directories
assert_directory "$DATA_ROOT/jellyfin" "$JELLYFIN_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/jellyseerr" "$JELLYSEERR_UID" "$JELLYSEERR_UID" 700
assert_directory "$DATA_ROOT/postgres" 999 999 700
assert_directory "$DATA_ROOT/postgres-init" 999 999 700
assert_directory "$DATA_ROOT/prowlarr" "$PROWLARR_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/radarr" "$RADARR_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/sabnzbd" "$SABNZBD_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/secrets" root root 700
assert_directory "$DATA_ROOT/sonarr" "$SONARR_UID" "$MEDIA_GID" 700

# Assert media filesystem structure
assert_directory "$MEDIA_ROOT/library" root "$MEDIA_GID" 770
assert_directory "$MEDIA_ROOT/library/movies" root "$MEDIA_GID" 770
assert_directory "$MEDIA_ROOT/library/series" root "$MEDIA_GID" 770
assert_directory "$MEDIA_ROOT/usenet" root "$MEDIA_GID" 770

# Template out the config files
export PROWLARR_API_KEY="$(openssl rand -hex 16)"
export RADARR_API_KEY="$(openssl rand -hex 16)"
export SONARR_API_KEY="$(openssl rand -hex 16)"

export JELLYSEERR_DB_PASSWORD="$(openssl rand -hex 16)"
export POSTGRES_ROOT_PASSWORD="$(openssl rand -hex 16)"
export PROWLARR_DB_PASSWORD="$(openssl rand -hex 16)"
export RADARR_DB_PASSWORD="$(openssl rand -hex 16)"
export SONARR_DB_PASSWORD="$(openssl rand -hex 16)"

envsubst < templates/prowlarr-config.xml > "$DATA_ROOT/prowlarr/config.xml"
envsubst < templates/radarr-config.xml > "$DATA_ROOT/radarr/config.xml"
envsubst < templates/sonarr-config.xml > "$DATA_ROOT/sonarr/config.xml"
envsubst < templates/postgres-init.sql > "$DATA_ROOT/postgres-init/init.sql"
envsubst < templates/compose-override.yml > ./compose.override.yml

# Fix file perms
chown -R "$PROWLARR_UID:$MEDIA_GID" "$DATA_ROOT/prowlarr"
chown -R "$RADARR_UID:$MEDIA_GID" "$DATA_ROOT/radarr"
chown -R "$SONARR_UID:$MEDIA_GID" "$DATA_ROOT/sonarr"
chown -R 999:999 "$DATA_ROOT/postgres-init"
