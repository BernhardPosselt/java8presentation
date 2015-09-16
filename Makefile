all:
	cleaver ./presentation.md --output ./presentation.html

watch:
	fswatch -o -0 ./presentation.md | xargs -0 -n1 -I{} make all
