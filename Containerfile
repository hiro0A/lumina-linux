FROM scratch AS ctx
COPY build_files /
COPY system_files /system_files

FROM ghcr.io/ublue-os/bazzite:stable@sha256:b923f92d5a5b59eb992e269383eba2744601052da9d3d1595f76e79aa6ce2df0

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint

LABEL org.opencontainers.image.title="Lumina Linux"
LABEL org.opencontainers.image.description="Bazzite personalizado para desenvolvimento, uso diário e jogos em hardware AMD"
LABEL org.opencontainers.image.source="https://github.com/hiro0A/lumina-linux"
