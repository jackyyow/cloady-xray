FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip tzdata && \
    case "$(uname -m)" in \
      x86_64) pkg="Xray-linux-64.zip" ;; \
      aarch64) pkg="Xray-linux-arm64-v8a.zip" ;; \
      *) echo "unsupported arch: $(uname -m)" && exit 1 ;; \
    esac && \
    curl -fsSL -o /tmp/xray.zip "https://github.com/XTLS/Xray-core/releases/latest/download/${pkg}" && \
    mkdir -p /usr/local/bin/xray-core && \
    unzip -q /tmp/xray.zip -d /usr/local/bin/xray-core && \
    chmod +x /usr/local/bin/xray-core/xray && \
    rm /tmp/xray.zip
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 3000
ENTRYPOINT ["/entrypoint.sh"]
