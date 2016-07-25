FROM buildpack-deps:jessie-curl

ARG deps="bzip2 \
          libasound2 \
          libatk1.0-0 \
          libatomic1 \
          libc6 \
          libcairo2 \
          libdbus-1-3 \
          libdbus-glib-1-2 \
          libevent-2.0-5 \
          libffi6 \
          libfontconfig1 \
          libfreetype6 \
          libgcc1 \
          libgdk-pixbuf2.0-0 \
          libglib2.0-0 \
          libgtk2.0-0 \
          libhunspell-1.3-0 \
          libpango-1.0-0 \
          libsqlite3-0 \
          libstartup-notification0 \
          libstdc++6 \
          libx11-6 \
          libxcomposite1 \
          libxdamage1 \
          libxext6 \
          libxfixes3 \
          libxrender1 \
          libxt6 \
          zlib1g \
          procps \
          debianutils \
          fontconfig \
          gstreamer1.0-libav \
          gstreamer1.0-plugins-good"

ARG xul="xulrunner-41.0.2.en-US.linux-x86_64.tar.bz2"

RUN	apt-get update \
    && apt-get install -qqy ${deps} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && wget -q https://ftp.mozilla.org/pub/xulrunner/releases/latest/runtimes/${xul} \
    && tar xvfj ${xul} \
    && rm -rf ./${xul} \
    && ln -s /xulrunner/xulrunner /usr/bin/xulrunner

ENV XAUTHORITY /tmp/.docker.xauth
ENV DISPLAY :0

CMD [ "xulrunner" ]
