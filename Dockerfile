FROM ubuntu:26.04

ARG VTA_VERSION=0.9.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL "https://fpp.ic3.dev/vta-k8s/${VTA_VERSION}/vta" -o /usr/local/bin/vta && \
    chmod 0755 /usr/local/bin/vta

WORKDIR /app/vta

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
