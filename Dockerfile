FROM kylemanna/openvpn

# Удаляем попытку создания TUN в RUN (оставляем только CMD)
CMD ["sh", "-c", "mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200 && \
     chmod 0666 /dev/net/tun && \
     ovpn_genconfig -u udp://${HOSTNAME} && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     openvpn --config /etc/openvpn/openvpn.conf"]
