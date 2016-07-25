Docker Xulrunner
================

Usage
-----

### Prepare the xauth cookie

```bash
xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
```

### Pull the image

```bash
docker pull jokester/xulrunner
```

### Use it

```bash
docker-compose up -d
```

Developping
-----------

Modify whatever you like, then build:

```bash
docker build . -t jokester/xulrunner
```
