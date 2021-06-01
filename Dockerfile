FROM debian:buster-slim

LABEL maintainer "Chaojun Tan <https://github.com/tcjj3>"

ADD entrypoint.sh /opt/entrypoint.sh

RUN export DIR_TMP="$(mktemp -d)" \
  && cd $DIR_TMP \
  && chmod +x /opt/*.sh \
  && sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
  && sed -i "s/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
  && apt-get update \
  || echo "continue..." \
  && apt-get install --no-install-recommends -y wget \
                                                curl \
                                                unzip \
                                                procps \
                                                psmisc \
                                                cron \
  && if [ "$(dpkg --print-architecture)" = "armhf" ]; then \
        ARCH="arm"; \
     else \
        ARCH=$(dpkg --print-architecture); \
     fi \
  && curl -L -o ${DIR_TMP}/ngrok-stable-linux.tar.gz https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-${ARCH}.zip \
  && unzip -o ${DIR_TMP}/ngrok-stable-linux.tar.gz -d /usr/local/bin \
  && rm -rf ${DIR_TMP} \
  && apt-get autoremove --purge unzip -y











ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]











