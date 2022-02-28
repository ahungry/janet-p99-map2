info:
	$(info Usage: make run ARGS="/path/to/log.txt PlayerName")

deps-local:
	IUP=linux jpm --local deps

deps:
	IUP=linux jpm deps

clean:
	jpm --local clean

run-local:
	jpm --local janet ./src/app.janet $(ARGS)

run:
	jpm janet ./src/app.janet $(ARGS)

.PHONY: info clean
