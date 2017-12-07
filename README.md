# Steam 2FA Auth Code Generator

## Introduction

This wraps up the [Steam 2FA Server](https://github.com/DoctorMcKay/steam-twofactor-server) code in a convenient Docker container for easy deployment. This can be used as a HTTP endpoing for recieving SteamGuard 2FA codes for use in scripts.

## Usage

### Pre-requisites
By default this is very insecure. You should not use this for a Steam Account you care about as anyone could use this webservice. If you are using this for running a Site License Server then you can just use a new Steam Account for it and there will be no risk.

You will need to obtain the JSON token from an authenticator. The easiest way to do this is to use the [Steam Desktop Authenticator](https://github.com/Jessecar96/SteamDesktopAuthenticator). When you complete the process, there is a `maFiles` directory. The `.maFile` in here is your JSON secret. Rename it to your `username.json`.

The container requires a volume mounted for secrets. This should be mounted to /var/secrets inside the container and it should have your username JSON files in it. This should be kept as secure as possible.

### Running the Container

To run the container, it's quite simple:

```
docker run \
    --restart=unless-stopped \
    --name steamcache-authcode \
    -p 80:80 \
    -v /data/secrets:/var/secrets \
    steamcache/steamcache-authcode:latest
```

In this example, the path `/data/secrets` on the host will be mapped to the secrets directory in the container.

### Supported Environment Variables

The following variables are supported to allow configuration:

 - **STEAM_FETCH_TIME** - Defaults to true, whether to fetch the time from Valve for calculating the token
 - **STEAM_IP_WHITELIST** - A comma separated list of IPs to allow. If left blank, this will allow all IPs.

### Getting a code

Just make a request to http://`address`/index.php/code/`username` to fetch the code for the user. For all other usage, please check [the documentation](https://github.com/DoctorMcKay/steam-twofactor-server).

## License

The MIT License (MIT)

Copyright (c) 2017 Jessica Smith

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
