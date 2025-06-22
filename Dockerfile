FROM kylemanna/openvpn

# Создаем TUN устройство (требует Privileged Mode)
RUN mkdir -p /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod 0666 /dev/net/tun  # Более либеральные права для Render

# Автоматическая инициализация PKI и запуск сервера
CMD ["sh", "-c", "ovpn_genconfig -u ${PROTOCOL}://${HOSTNAME} && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     openvpn --config /etc/openvpn/openvpn.conf"]
