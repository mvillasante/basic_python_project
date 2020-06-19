FROM python:3

RUN pip install \
    black \
    mutmut \
    pytest==5.0.1

WORKDIR /workdir
