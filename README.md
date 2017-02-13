# blog.2no.me

This blog was created by [Hugo](https://gohugo.io/).

## Create a new page.

```sh
$ make new title=[page title]
```
Create a file in the following path. `./content/post/[year]/[month]/[page title].md`

## Preview

### unpublished

```sh
$ make preview-draft
```

### published

```sh
$ make preview
```

Supported environment variables of Hugo.

* `HUGO_BIND`
* `HUGO_PORT`
* `HUGO_THEME`

```sh
$ HUGO_BIND=[ip or hostname] HUGO_PORT=[port] HUGO_THEME=[theme] make preview
```
