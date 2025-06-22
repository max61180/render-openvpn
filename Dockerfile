FROM kylemanna/openvpn

# Используем TCP и отключаем TUN устройство
CMD ["sh", "-c", "ovpn_genconfig -u tcp://${HOSTNAME} --dev null && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     openvpn --config /etc/openvpn/openvpn.conf"]
