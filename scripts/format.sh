#!/usr/bin/env bash

set -e

pipenv run autoflake --recursive --remove-all-unused-imports --remove-unused-variables --in-place app tests --exclude=__init__.py
pipenv run black app tests
pipenv run isort --recursive app tests