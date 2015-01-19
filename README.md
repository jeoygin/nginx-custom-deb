# nginx-custom-deb

This is used to make customized nginx debian package.

To build:

```
docker build -t nginx-custom-deb .
```

To run:

```
docker run -i -t -v /tmp:/tmp nginx-custom-deb /bin/bash
```

Then you can copy debian package to /tmp folder.
