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
assert_directory "$DATA_ROOT/prowlarr" "$PROWLARR_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/radarr" "$RADARR_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/sabnzbd" "$SABNZBD_UID" "$MEDIA_GID" 700
assert_directory "$DATA_ROOT/sonarr" "$SONARR_UID" "$MEDIA_GID" 700

# Assert media filesystem structure
assert_directory "$MEDIA_ROOT/library" root "$MEDIA_GID" 770
assert_directory "$MEDIA_ROOT/library/movies" root "$MEDIA_GID" 770
assert_directory "$MEDIA_ROOT/library/series" root "$MEDIA_GID" 770
assert_directory "$MEDIA_ROOT/usenet" root "$MEDIA_GID" 770
