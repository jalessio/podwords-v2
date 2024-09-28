FROM python:3.12.6-bookworm

WORKDIR /code

RUN apt update \
  && apt install -y \
  pipx \
  build-essential \
  python3-dev \
  python3-poetry \
  ; \
  rm -rf /var/lib/apt/lists/*

COPY poetry.lock pyproject.toml /code/
RUN poetry install

COPY . /code/

CMD ["./run.sh"]
