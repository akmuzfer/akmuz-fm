FROM nginx:1.17

RUN apt-get update && \
    apt-get install -y --no-install-recommends vlc sudo && \
    useradd -ms /bin/bash -G sudo vlc && \
    echo "vlc ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

COPY default.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/
COPY entrypoint /

ENTRYPOINT ["/entrypoint"]
CMD ["nginx", "-g", "daemon off;"]
