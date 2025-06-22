FROM kylemanna/openvpn:2.4

# 1. Предварительно генерируем DH-параметры (экономит время деплоя)
RUN openssl dhparam -out /etc/openvpn/dh.pem 2048

# 2. Готовый конфиг с быстрым стартом
CMD ["sh", "-c", "\
  ovpn_genconfig -u tcp://$HOSTNAME -d && \
  EASYRSA_BATCH=1 ovpn_initpki nopass && \
  echo 'Запускаем OpenVPN...' && \
  openvpn --config /etc/openvpn/openvpn.conf \
"]
