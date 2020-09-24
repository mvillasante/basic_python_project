all: mutants

.PHONY: all clean format install lint mutants tests

module = dummy_transformations
codecov_token = 6c56bccb-1758-4ed9-8161-97c845591c26

clean:
	rm --force .mutmut-cache
	rm --recursive --force ${module}.egg-info
	rm --recursive --force ${module}/__pycache__
	rm --recursive --force test/__pycache__

format:
	black --check --line-length 100 ${module}
	black --check --line-length 100 tests

install:
	pip install --editable .

lint:
	flake8 --max-line-length 100 ${module}
	flake8 --max-line-length 100 tests
	pylint \
        --disable=bad-continuation \
        --disable=missing-class-docstring \
        --disable=missing-function-docstring \
        --disable=missing-module-docstring \
        ${module}
	pylint \
        --disable=bad-continuation \
        --disable=missing-class-docstring \
        --disable=missing-function-docstring \
        --disable=missing-module-docstring \
        test

mutants:
	mutmut run --paths-to-mutate ${module}

tests: install
	pytest --cov=${module} --cov-report=xml --verbose && \
	codecov --token=${codecov_token}
