SRC=drago.dev
OUT=site

build: clean
	@marmite ${SRC} ${OUT} -v

b: build

watch: clean
	@marmite ${SRC} ${OUT} --watch --serve

w: watch

clean:
	rm -rf site

c: clean
