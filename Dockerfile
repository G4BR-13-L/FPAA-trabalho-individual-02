FROM rust:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    bash \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN python3 -m venv venv
RUN /bin/bash -c "source venv/bin/activate && pip install -r selecao_simultanea_python/requirements.txt"

CMD ["/bin/bash", "-c", "source venv/bin/activate && pytest selecao_simultanea_python && cargo test --manifest-path selecao_simultanea_rust/Cargo.toml"]