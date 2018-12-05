# dckr

Lets you easily and transparently run your project build / test / random command inside containers.

For example, assuming you have a project where you would typically run:

`ls -lA`

Just call:

`dckr ls -lA`

Or without the noise:

`dckr ls -lA 2>/dev/null`

## Controlling the base image

You can control what base operating system will be used for the container using the TARGET environment variable:

`TARGET=ults-current dckr make all`

TARGET values provided as a courtesy are visible in `dckr.Dockerfile`.

## Using your own image

You can taylor this to your needs by creating a `Dockerfile` anywhere matching your expectations (start with `dckr.Dockerfile.example`), and invoking dckr with the DOCKERFILE variable:

`DOCKERFILE=thingie/Dockerfile TARGET=some-target dckr ls -lA`

Be sure to inherit one of the base `com.dbdbdp.dckr:` images.

## Containers are "live"

After the first invocation, the container is "live" (eg: kept around).

This means a couple of important things:

 * commands are cumulative... just like they are on your local system...
 * calling on further commands is very fast (in a shell, the overhead is the cost of exec-ing and docker IO)

## How to install

`brew install dubo-dubon-duponey/brews/dckr` if you are on macOS.

Otherwise (or if you don't brew):
 
  * clone somewhere
  * add somewhere to your path.

## Gotcha

Expect running complicated shell commands to be challenging (you have to get your escaping right).

Keep it simple.

This is mostly meant to be for stuff like:

`dckr make test thingie whatever`
