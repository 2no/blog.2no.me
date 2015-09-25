bind=$(or $(HUGO_BIND), localhost)
port=$(or $(HUGO_PORT), 1313)
theme=$(or $(HUGO_THEME), '')
override title:=`echo $(title) | tr "A-Z" "a-z" | tr " " "-" | sed "s/\.//g"`

preview-draft:
	hugo server --bind=$(bind) --port=$(port) --theme=$(theme) -D

preview:
	hugo server --bind=$(bind) --port=$(port) --theme=$(theme)

new:
	hugo new post/"`date +%Y/%m`/$(title).md"
