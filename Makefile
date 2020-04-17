nope:
	$(error Not a valid target)

check-env-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

# Inner commands -------------------------------------------------------------------------------------------------------

unicorn:
	pipenv run unicorn \
		--access-logfile - \
		--bind 0.0.0.0:8000 \
		--backlog 100 \
		--chdir /app \
		--error-logfile - \
		--reload \
		--workers 4 \
		app:app

shell:
	pipenv run flask shell

req:
	pipenv install

req-dev:
	pipenv sync --dev

# Utility --------------------------------------------------------------------------------------------------------------
lint:
	sh scripts/lint.sh

black-check:
	pipenv run black --check --diff .

black:
	pipenv run black .
