FROM kylemanna/openvpn

RUN apt-get update && apt-get install -y wget && \
    wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/bin/cloudflared && \
    chmod +x /usr/bin/cloudflared

CMD ["sh", "-c", "ovpn_genconfig -u tcp://$HOSTNAME --dev null && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     cloudflared tunnel --url tcp://localhost:1194 & \
     openvpn --config /etc/openvpn/openvpn.conf"]
