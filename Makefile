mutation:
	mutmut run --paths-to-mutate dummy_transformations

.PHONY: install mutation tests

install:
	pip install --editable .

tests: install
	pytest --verbose
