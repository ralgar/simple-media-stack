-- Create Jellyseerr DB
CREATE USER jellyseerr WITH PASSWORD '${JELLYSEERR_DB_PASSWORD}';
CREATE DATABASE jellyseerr;
ALTER DATABASE jellyseerr OWNER TO jellyseerr;
GRANT ALL PRIVILEGES ON DATABASE jellyseerr TO jellyseerr;

-- Create Prowlarr DB
CREATE USER prowlarr WITH PASSWORD '${PROWLARR_DB_PASSWORD}';
CREATE DATABASE "prowlarr-main";
CREATE DATABASE "prowlarr-log";
ALTER DATABASE "prowlarr-main" OWNER TO prowlarr;
ALTER DATABASE "prowlarr-log" OWNER TO prowlarr;
GRANT ALL PRIVILEGES ON DATABASE "prowlarr-main" TO prowlarr;
GRANT ALL PRIVILEGES ON DATABASE "prowlarr-log" TO prowlarr;

-- Create Radarr DB
CREATE USER radarr WITH PASSWORD '${RADARR_DB_PASSWORD}';
CREATE DATABASE "radarr-main";
CREATE DATABASE "radarr-log";
ALTER DATABASE "radarr-main" OWNER TO radarr;
ALTER DATABASE "radarr-log" OWNER TO radarr;
GRANT ALL PRIVILEGES ON DATABASE "radarr-main" TO radarr;
GRANT ALL PRIVILEGES ON DATABASE "radarr-log" TO radarr;

-- Create Sonarr DB
CREATE USER sonarr WITH PASSWORD '${SONARR_DB_PASSWORD}';
CREATE DATABASE "sonarr-main";
CREATE DATABASE "sonarr-log";
ALTER DATABASE "sonarr-main" OWNER TO sonarr;
ALTER DATABASE "sonarr-log" OWNER TO sonarr;
GRANT ALL PRIVILEGES ON DATABASE "sonarr-main" TO sonarr;
GRANT ALL PRIVILEGES ON DATABASE "sonarr-log" TO sonarr;
