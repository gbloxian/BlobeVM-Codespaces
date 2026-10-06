# BlobeVM Codespaces

BlobeVM is a browser-accessible Linux desktop based on [Blobby-Boi/BlobeVM](https://github.com/Blobby-Boi/BlobeVM). This repository adds a Codespaces configuration that builds and starts the desktop automatically.

## Use in GitHub Codespaces

1. Open this repository on GitHub and choose **Code > Codespaces > Create codespace on main**.
2. Wait for the first container image build to finish. The image includes KDE and the apps selected in `options.json`; the first build can take several minutes and needs substantial disk space.
3. Codespaces forwards port `3000` and opens the BlobeVM desktop in your browser.

When the Codespace starts again, the startup script reuses the existing BlobeVM container. Your desktop configuration is stored in `Save/` and is intentionally excluded from Git.

## Run with Docker

From a machine with Docker installed and its daemon running, run:

```bash
bash install.sh
```

Open `http://localhost:3000`. The first run builds the image; later runs start the existing container. Stop it with `docker stop BlobeVM` and start it again with `docker start BlobeVM`.

## Configure

Change `options.json` before the first build to select the desktop environment and bundled apps. Rebuild after changing it:

```bash
docker build -t blobevm .
```

The active container keeps using its existing image until it is recreated. Keep personal files, Steam data, certificates, and other runtime state in `Save/`; do not commit that directory.

## Performance notes

The desktop is served through KasmVNC. Performance depends on the Codespace or Docker host. Codespaces has limited CPU and does not pass a GPU into this container by default, so demanding 3D games may not run smoothly. This setup is best suited to desktop apps and lighter games.

This project is based on Blobby-Boi/BlobeVM; see [LICENSE](LICENSE) for license terms.
