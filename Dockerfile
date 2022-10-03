FROM mono:6.12.0.182

EXPOSE 8989

ARG VERSION=3.0.9.1549
ARG SBRANCH=main
ARG PACKAGE_VERSION=${VERSION}

RUN mkdir -p "/sonarr/bin" && \
    curl -fsSL "https://download.sonarr.tv/v3/${SBRANCH}/${VERSION}/Sonarr.${SBRANCH}.${VERSION}.linux.tar.gz" | tar xzf - -C "/sonarr/bin" --strip-components=1 && \
    rm -rf "/sonarr/bin/Sonarr.Update" && \
    chmod -R u=rwX,go=rX "/sonarr"

CMD ["mono", "/sonarr/bin/Sonarr.exe", "-data=/config"]
