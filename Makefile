mutants:
	mutmut run --paths-to-mutate dummy_transformations

.PHONY: install format mutants tests

install:
	pip install --editable .

tests: install
	pytest --verbose

format:
	black --check dummy_transformations
	black --check tests
