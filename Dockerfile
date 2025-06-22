FROM kylemanna/openvpn

# Установка прав и создание устройства TUN
RUN mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod 600 /dev/net/tun

# Добавьте привилегированный режим (необходим для TUN)
CMD ["sh", "-c", "ovpn_genconfig -u udp://${HOSTNAME} && EASYRSA_BATCH=1 ovpn_initpki nopass && openvpn --config /etc/openvpn/openvpn.conf"]
