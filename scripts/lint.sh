#!/usr/bin/env bash

set -e
set -x


pipenv run flake8 app --exclude=app/db/migrations
pipenv run mypy app

pipenv run black --check app --diff
pipenv run isort --recursive --check-only app