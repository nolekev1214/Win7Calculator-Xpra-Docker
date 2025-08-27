`docker build -t="win7calc:latest" .`
`docker run -d -p 8080:10000 -e XPRA_PASSWORD="password" --privileged win7calc:latest`