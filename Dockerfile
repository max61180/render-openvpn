FROM kylemanna/openvpn

# Устанавливаем cloudflared в Alpine Linux
RUN apk add --no-cache wget && \
    wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

# Запускаем OpenVPN через Cloudflare Tunnel
CMD ["sh", "-c", "ovpn_genconfig -u tcp://$HOSTNAME --dev null && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     cloudflared tunnel --url tcp://localhost:1194 & \
     openvpn --config /etc/openvpn/openvpn.conf"]
