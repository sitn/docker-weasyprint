# docker-weasyprint

This is a very simple Dockerfile based on [Alpine Linux](https://www.alpinelinux.org).  It creates a very small (105MB+) [weasyprint](https://github.com/Kozea/WeasyPrint) service.  It uses a wsgi server by [aquavitae](https://github.com/aquavitae/docker-weasyprint) to provide weasyprint as a web service.

To use, `POST` some HTML to `localhost:5001/pdf`.  The response will be a rendered pdf file.

### Deploy

Choose your production docker context, clone this repository, then:
```powershell
docker-compose up -d
```

### Health Checks

A `GET` to `localhost:5001/health` should result in an `ok` response.

A `GET` to `localhost:5001/version` should output the weasyprint version (currently `0.39`).

### Fonts

In order to make fonts available to weasyprint, simply copy them into `./fonts` and build the image.
