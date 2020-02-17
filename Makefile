mutation:
	mutmut run --paths-to-mutate dummy_transformations

.PHONY: mutation tests

tests:
	pytest --verbose