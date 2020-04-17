import os
import secrets
from typing import List

from environs import Env
from pydantic import AnyHttpUrl
from pydantic import BaseSettings
from pydantic import HttpUrl

env = Env()
env.read_env()

basedir = os.path.abspath(os.path.dirname(__file__))


class Settings(BaseSettings):

    DEBUG: bool = env.bool("DEBUG", default=False)
    SECRET_KEY: str = secrets.token_urlsafe(32)
    API_PREFIX: str = env.str("API_PREFIX", "/api/v1")

    JWT_TOKEN_PREFIX = "Token"
    VERSION = "0.0.0"

    SERVER_NAME: str
    SERVER_HOST: AnyHttpUrl

    BACKEND_CORS_ORIGINS: List[AnyHttpUrl] = env.list("BACKEND_CORS_ORIGINS", [])

    SQLALCHEMY_DATABASE_URI = env.str("DATABASE_URL", "sqlite:///" + os.path.join(basedir, "../app.db"))

    PROJECT_NAME: str = ""
    SENTRY_DSN: HttpUrl

    class Config:
        case_sensitive = True


settings = Settings()
