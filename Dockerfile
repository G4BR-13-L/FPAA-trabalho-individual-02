# Use uma imagem base com Python e Rust instalados
FROM rust:latest

# Instale Python, bash e outras dependências
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /app

# Copie o código para o container
COPY . .

# Instale as dependências do Python
RUN python3 -m venv venv
RUN /bin/bash -c "source venv/bin/activate && pip install -r selecao_simultanea_python/requirements.txt"

# Execute os testes
CMD ["/bin/bash", "-c", "source venv/bin/activate && pytest selecao_simultanea_python && cargo test --manifest-path selecao_simultanea_rust/Cargo.toml"]