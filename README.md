# Example Frontend with Kong Sidecar
Example Frontend with [kong sidecar](https://github.com/ScaleIT-Org/kong-sidecar). You can follow the linked instruction to guard your own application with [Kong](https://getkong.org) or you can just use this stack.

## Usage
Run `docker-compose up -d` to start the stack. You can reach the frontend via [localhost:8000/example](localhost:8000/example). If everything works, a ScaleIT picture is displayed.

### Settings
You can apply your own settings in "kong-apis.json". The file is using the same format as the [Kong API](https://getkong.org/docs/0.12.x/admin-api/#add-api).

To enable a plugin, see [Enabling Plugins](https://getkong.org/docs/0.12.x/getting-started/enabling-plugins/).