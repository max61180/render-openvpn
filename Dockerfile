FROM kylemanna/openvpn:2.4

# 1. Используем старую версию с совместимыми параметрами
# 2. Генерируем конфиг с правильным синтаксисом
CMD ["sh", "-c", "\
  ovpn_genconfig -u tcp://$HOSTNAME -d && \
  EASYRSA_BATCH=1 ovpn_initpki nopass && \
  echo 'Запускаем OpenVPN с конфигом:' && \
  cat /etc/openvpn/openvpn.conf && \
  openvpn --config /etc/openvpn/openvpn.conf \
"]
