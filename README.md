# Example Frontend with Kong Sidecar
Example Frontend with [kong sidecar](https://github.com/ScaleIT-Org/kong-sidecar). You can follow the linked instruction to guard your own application with [Kong](https://getkong.org) or you can just use this stack. 

For this to work, you must have an image called `teco/kong-sidecar:0.12.1-0` (or other tag specified in the docker-compose.yml) in your local registry. You can get instructions to build that image from (here)[https://github.com/ScaleIT-Org/kong-sidecar].

## Usage
Run `docker-compose up -d` to start the stack. You can reach the frontend via http://localhost:8000/example. If everything works, a ScaleIT picture is displayed:
![ScaleIT](html/scaleIt.jpg)

### Settings
You can apply your own settings in "kong-apis.json". The file is using the same format as the [Kong API](https://getkong.org/docs/0.12.x/admin-api/#add-api).

To enable a plugin, see [Enabling Plugins](https://getkong.org/docs/0.12.x/getting-started/enabling-plugins/).