bind=$(or $(HUGO_BIND), localhost)
port=$(or $(HUGO_PORT), 1313)
override title:=`echo $(title) | tr "A-Z" "a-z" | tr " " "-" | sed "s/\.//g"`

preview-draft:
	hugo server --bind=$(bind) --port=$(port) -w -D

preview:
	hugo server --bind=$(bind) --port=$(port) -w

new:
	@hugo new post/"`date +%Y/%m`/$(title).md"
