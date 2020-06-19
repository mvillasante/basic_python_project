mutants:
	mutmut run --paths-to-mutate dummy_transformations

.PHONY: install lint mutants tests

install:
	pip install --editable .

tests: install
	pytest --verbose

lint:
	black --check dummy_transformations
