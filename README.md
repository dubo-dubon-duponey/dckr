# dckr

Lets you easily and transparently run your project build / test / random command inside containers.

For example, assuming you have a project where you would typically run:

`ls -lA`

`cat foo`

(or more likely `make thing`)

Just call:

`dckr ls -lA`

`dckr cat foo`

`dckr make thing`

Or without the noise:

`dckr ls -lA 2>/dev/null`

That's it.

No boilerplate, no monkeying around.

## Controlling the base image

You can control what base operating system will be used for the container using the `TARGET` environment variable:

`TARGET=ubuntu-lts-current dckr make all`

`TARGET` values provided by default are visible in `dckr.Dockerfile`.

## Using your own image

You can taylor this to your needs (probably you want your favorite language runtime and tools installed) by creating a `Dockerfile` anywhere (start by copying `dckr.Dockerfile.example`), and invoking dckr with the `DOCKERFILE` variable:

`DOCKERFILE=thingie/Dockerfile TARGET=some-target dckr ls -lA`

Be sure to inherit one of the base `com.dbdbdp.dckr:FOO` images (defined in `dckr.Dockerfile`).

## Containers are "live"

After the first invocation, the container is "live" (eg: kept around), and changes in your project folder are reflected inside the container immediately.

This means a couple of important things:

 * commands are cumulative... just like they are on your local system...
 * calling on further commands after the first one is very fast (in a shell, the overhead is the cost of exec-ing and docker IO)

## How to install

`brew install dubo-dubon-duponey/brews/dckr` if you are on macOS.

Otherwise (or if you don't brew):
 
  * clone "somewhere"
  * add "somewhere" to your path

## Gotcha

Expect running complicated shell commands to be challenging (you have to get your escaping right).

Keep it simple.

This is mostly meant to be used for stuff like:

`dckr make test thingie`
