all:
	cleaver ./presentation.md --output ./presentation.html

watch:
	cleaver watch ./presentation.md --output ./presentation.html
