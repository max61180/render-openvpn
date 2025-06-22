FROM kylemanna/openvpn

# 1. Создаем директорию и файл конфига заранее
RUN mkdir -p /etc/openvpn && touch /etc/openvpn/openvpn.conf

# 2. Генерация конфига и ключей с проверками
CMD ["sh", "-c", "\
  echo 'Генерируем конфигурацию...' && \
  ovpn_genconfig -u tcp://$HOSTNAME --dev null > /etc/openvpn/openvpn.conf && \
  echo 'Конфиг создан. Содержимое:' && \
  cat /etc/openvpn/openvpn.conf && \
  echo 'Инициализируем PKI...' && \
  EASYRSA_BATCH=1 ovpn_initpki nopass && \
  echo 'Запускаем OpenVPN...' && \
  openvpn --config /etc/openvpn/openvpn.conf \
"]
