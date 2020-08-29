# singularity-asciidoctor

Thin [singularity](https://sylabs.io/guides/3.6/user-guide/introduction.html) wrapper around [asciidoctor/docker-asciidoctor](https://github.com/asciidoctor/docker-asciidoctor) to ease use of [asciidoctor](https://asciidoctor.org/).

*N.B. images based on this configuration cannot be distributed [until docker-asciidoctor has a license](https://github.com/asciidoctor/docker-asciidoctor/issues/158)*

## Usage

1. [Install singularity](https://sylabs.io/guides/3.6/user-guide/quick_start.html#quick-installation-steps) N.B. Many OSs have `singularity` in their package repositories - use that if you can
2. Pull this image: `singularity pull adoc.sif library://clbarnes/singularity-asciidoctor`
3. Use it like an executable to run [asciidoctor commands](https://asciidoctor.org/man/asciidoctor/): `./adoc.sif asciidoctor index.adoc`

## Why would you do this?

Asciidoctor is a great light markup language to write almost any kind of document in.
Lots of people who write documents are not software developers.
Therefore, there should be an easy on-ramp to setting up asciidoctor where the conversation does not have to start with

> In 1995, an interpreted language called Ruby...

`docker-asciidoctor` currently represents the easiest path to a complete asciidoctor environment.
However, docker has plenty of pitfalls on the usability front: if you're comfortable enough to use docker,
you may as well just build your own ruby environment to use asciidoctor.

Such pitfalls include:

- UID and GID mapping
- Volume mounting to access source and target directories
- Administrative privileges

To build some asciidoctor document using docker, the command looks like this:

```sh
docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor --user "$(shell id -u):$(shell id -g)" asciidoctor index.adoc
```

To do the same with singularity looks like this:

```sh
singularity exec clbarnes/singularity-asciidoctor asciidoctor index.adoc
```

or even

```sh
# do this once
singularity pull ~/bin/adoc library://clbarnes/singularity-asciidoctor

# do this to build
adoc asciidoctor index.adoc
```

Singularity also gives you a lot more flexibility,
allowing you to navigate around your own file system and run asciidoctor on whatever you want,
rather than having to mount and be constrained to a single specific directory.

## Credit

All credit for making this work goes to the maintainers of [asciidoctor/docker-asciidoctor](https://github.com/asciidoctor/docker-asciidoctor).
