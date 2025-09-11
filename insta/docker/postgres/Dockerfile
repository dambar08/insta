FROM postgres:16.3

RUN apt-get update && \
    apt-get install -y postgresql-server-dev-16 gcc make git && \
    apt-get clean

# Install pgvector
RUN git clone https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make && \
    make install && \
    cd .. && \
    rm -rf pgvector

# Expose the PostgreSQL port
EXPOSE 5432