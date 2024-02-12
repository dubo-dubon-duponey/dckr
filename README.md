# dckr

dckr is a simple, no dependency shell-script that transparently lets you develop your project inside containers.

For example, assuming you have a project where you would typically run:

```bash
ls -lA
cat foo
make thing
yarn test
```

Just call:

```bash
dckr ls -lA
dckr cat foo
dckr make thing
dckr yarn test
```

Or without the noise:

```bash
dckr ls -lA 2>/dev/null
```

That's it.

No boilerplate, no container setup, no monkeying around.

## Controlling the base image

You can control what base operating system will be used for the container using the `TARGET` environment variable:

`TARGET=ubuntu-lts-current dckr make all`

`TARGET` values provided by default are visible in `dckr.Dockerfile`.

If `TARGET` is not specified, the latest current Debian is going to be used.

## Using your own images

You can taylor this to your needs (probably you want your favorite language runtime and tools installed) by creating a `Dockerfile` 
anywhere (start by copying `dckr.Dockerfile.example`), and invoking dckr with the `DOCKERFILE` variable:

`DOCKERFILE=thingie/Dockerfile TARGET=some-target dckr ls -lA`

Be sure to either inherit one of the base `com.dbdbdp.dckr:FOO` images (defined in `dckr.Dockerfile`), or add the following to your custom image:

```bash
WORKDIR /dckr-project-mount
VOLUME /dckr-project-mount
```

You may also want to downgrade to `USER dckr` in your custom dockerfile after you are done installing packages for example.

## "Live" containers

After the first invocation, the container is "live" (eg: kept around), and changes in your project 
folder are reflected inside the container immediately.

This means a couple of important things:

 * commands are cumulative... just like they are on your local system...
 * calling on further commands after the first one is very fast (in a shell, the overhead is the cost of exec-ing and docker IO)

## How to install

On macOS:

```bash
brew install dubo-dubon-duponey/brews/dckr
```

Otherwise (or if you don't brew):

  * clone "somewhere"
  * add "somewhere" to your path

## CI

In order to avoid rebuilding all the base images at each CI run, you can leverage `dckr` cache:

```base
CACHE_DIR=somewhere dckr
```

And instruct your CI to cache `somewhere`.

## Gotcha

Expect running complicated shell commands to be challenging (you have to get your escaping right).

Keep it simple.

This is mostly meant to be used for stuff like:

```bash
dckr make test thingie
```

Also, the very first run of `dckr` will be SLOW (as it will download all base images).

## Develop dckr

You need `docker`, `shellcheck` and `hadolint` installed.

`./test.sh` must pass.

## This project is not...

 * the proper way to docker-ize your application for production
 * meant to be used to reproduce complex, multi-containers applications
 * a replacement for compose
