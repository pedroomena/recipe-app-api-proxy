[![pipeline status](https://gitlab.com/pedroomena/recipe-app-api-proxy/badges/main/pipeline.svg)](https://gitlab.com/pedroomena/recipe-app-api-proxy/-/commits/main)

# Recipe App API Proxy

NGINX proxy app

## Usage

### Environment Variables

 - `LISTEN_PORT` - Port to listen on (default: `8000`)
 - `APP_HOST` - Hostname of the app to forward requests to (default: `app`)
 - `APP_PORT` - Port of the app to forward requests to (default: `9000`)
