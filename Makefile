all: mutants

.PHONY: all clean format install lint mutants tests

clean:
	rm --force .mutmut-cache
	rm --recursive --force dummy_transformations.egg-info
	rm --recursive --force dummy_transformations/__pycache__
	rm --recursive --force test/__pycache__

format:
	black --check --line-length 100 dummy_transformations
	black --check --line-length 100 tests

install:
	pip install --editable .

lint:
	flake8 --max-line-length 100 dummy_transformations
	flake8 --max-line-length 100 tests
	pylint dummy_transformations
	pylint tests

mutants:
	mutmut run --paths-to-mutate dummy_transformations

tests: install
	pytest --cov=dummy_transformations --cov-report=xml --verbose && \
	codecov --token=6c56bccb-1758-4ed9-8161-97c845591c26
