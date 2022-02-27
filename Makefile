deps:
	IUP=linux jpm --local deps

clean:
	jpm --local clean

run:
	jpm --local janet ./src/app.janet
