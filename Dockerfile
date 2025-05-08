FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    wget \
    libmariadb-dev \
    libpq-dev \
    unixodbc \
    && rm -rf /var/lib/apt/lists/*

# Create working directories
RUN mkdir -p /opt/sphinx/log /opt/sphinx/index /opt/sphinx/conf

WORKDIR /opt/sphinx

# Download and extract the glibc-based binary
RUN wget http://sphinxsearch.com/files/sphinx-3.3.1-b72d67b-linux-amd64-glibc2.12.tar.gz -O sphinx.tar.gz && \
    tar -xzf sphinx.tar.gz && \
    rm sphinx.tar.gz

# Add Sphinx to PATH
ENV PATH="/opt/sphinx/sphinx-3.3.1/bin:$PATH"

# Redirect logs
RUN ln -sv /dev/stdout /opt/sphinx/log/query.log && \
    ln -sv /dev/stdout /opt/sphinx/log/searchd.log

EXPOSE 36307

VOLUME /opt/sphinx/index
VOLUME /opt/sphinx/conf

CMD ["searchd", "--nodetach", "--config", "/opt/sphinx/conf/sphinx.conf"]
