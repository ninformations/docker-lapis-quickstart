FROM openresty/openresty:1.9.15.1-xenial

MAINTAINER Sebastian Ruml <sebastian@sebastianruml.name>
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y --force-yes libssl-dev
RUN /usr/local/openresty/luajit/bin/luarocks install lapis

RUN mkdir /app
WORKDIR /app

ENV LAPIS_OPENRESTY "/usr/local/openresty/bin/openresty"

VOLUME /app

EXPOSE 8080 80

ENTRYPOINT ["/usr/local/openresty/luajit/bin/lapis"]

CMD ["server", "development"]
