git remote add origin https://github.com/TessTea/Pentaho-Data-Integration-over-noVNC-image.git
===============================

## Supported tags and respective `Dockerfile` links

- [`latest`][Dockerfile]

## Whats in the box

As long as PDI is a desktop application, you need x-server to run it.
But I didn't  want to configure my entire server for using X each time as I need a PDI.
So I decided to build an image with VNC x-server, and use web-based protocol, such as noVNC
to simplify process of configuring and using this tool.

The image based on [consol/ubuntu-xfce-vnc][1], and supports all its features.

## How to use this image

To run PDIonoV server just start the container: 
```bash
docker run -d --name pdi-server -p 5901:5901 -p 6901:6901 tesslime/pdionov
```

To link data-folder use this:
```bash
docker run -d --name pdi-server -p 5901:5901 -p 6901:6901 -v /your/server/path:/headless/data-integration/DATA tesslime/pdionov
```

### ENV-variable options

Image supports all [consol/ubuntu-xfce-vnc][1] variables, such as:

   * VNC_COL_DEPTH, default: 24
   * VNC_RESOLUTION, default: 1280x1024
   * VNC_PW, default: vncpassword


### For what purpose ports opened

port 5901 needed as a vnc-api for noVNC client.
port 6901 needed as endpoint of noVNC server for users.

### Connect & Control

If the container is started like mentioned above, connect via one of these options:

   * connect via VNC viewer localhost:5901, default password: vncpassword
   * connect via noVNC HTML5 full client: http://localhost:6901/vnc.html, default password: vncpassword
   * connect via noVNC HTML5 lite client: http://localhost:6901/?password=vncpassword

### Run the PDI

Open terminal

```bash
cd ./data-integration
./spoon.sh
```

[1]: https://hub.docker.com/r/consol/ubuntu-xfce-vnc/
[Dockerfile]: https://github.com/TessTea/Pentaho-Data-Integration-over-noVNC-image/blob/main/Dockerfile