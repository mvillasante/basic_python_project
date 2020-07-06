FROM python:3
WORKDIR /workdir
COPY . .
RUN pip install \
    black \
    codecov \
    flake8 \
    mutmut \
    pylint \
    pytest-cov \
    pytest==5.0.1
