SRC=.
OUT=site

build: clean
	@marmite ${SRC} ${OUT} -v --url ""

b: build

watch: clean
	@marmite ${SRC} ${OUT} --watch --serve --url ""

w: watch

clean:
	rm -rf site

c: clean
