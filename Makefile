all: mutants

.PHONY: all clean format install lint mutants tests

repo = dummy_transformations

clean:
	rm --force .mutmut-cache
	rm --recursive --force ${repo}.egg-info
	rm --recursive --force ${repo}/__pycache__
	rm --recursive --force test/__pycache__

format:
	black --check --line-length 100 ${repo}
	black --check --line-length 100 tests

install:
	pip install --editable .

lint:
	flake8 --max-line-length 100 ${repo}
	flake8 --max-line-length 100 tests
	pylint ${repo}
	pylint tests

mutants:
	mutmut run --paths-to-mutate ${repo}

tests: install
	pytest --cov=${repo} --cov-report=xml --verbose && \
	codecov --token=6c56bccb-1758-4ed9-8161-97c845591c26
