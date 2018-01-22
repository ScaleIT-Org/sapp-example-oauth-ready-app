FROM kong:0.11

ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr

# Install jq
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /usr/bin/jq && chmod +x /usr/bin/jq

RUN mkdir /config
WORKDIR /config

COPY apply-config.sh /config/apply-config.sh
COPY entrypoint.sh /config/entrypoint.sh
ENTRYPOINT ["/config/entrypoint.sh"]

CMD ["/usr/local/openresty/nginx/sbin/nginx", "-c", "/usr/local/kong/nginx.conf", "-p", "/usr/local/kong/"]