# docker-weasyprint

This is a very simple Dockerfile based on [Alpine Linux](https://www.alpinelinux.org).  It creates a very small (105MB+) [weasyprint](https://github.com/Kozea/WeasyPrint) service.  It uses a wsgi server by [aquavitae](https://github.com/aquavitae/docker-weasyprint) to provide weasyprint as a web service.

To use, `POST` some HTML to `localhost:5001/pdf`.  The response will be a rendered pdf file.

### Deploy

Open Powershell and clone this repository:
```powershell
git clone https://github.com/sitn/docker-weasyprint.git
cd docker-weasyprint
```

Choose your production docker context: replace `<USER>` and `<SERVER_ADDRESS>` with your server address:

```powershell
$env:DOCKER_HOST="ssh://<USER>@<SERVER_ADDRESS>.ne.ch"
```

Then down and up the service:
```powershell
docker-compose down
docker-compose up -d
```

Finally, reset your docker host back to normal:
```powershell
$env:DOCKER_HOST=""
```

### Health Checks

A `GET` to `localhost:5001/health` should result in an `ok` response.

A `GET` to `localhost:5001/version` should output the weasyprint version (currently `0.39`).

### Fonts

In order to make fonts available to weasyprint, simply copy them into `./fonts` and build the image.
