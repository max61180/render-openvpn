FROM kylemanna/openvpn

# 1. Генерируем конфиг и сертификаты при старте
CMD ["sh", "-c", " \
     ovpn_genconfig -u tcp://$HOSTNAME -d && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     echo 'Запускаем OpenVPN...' && \
     openvpn --config /etc/openvpn/openvpn.conf \
     "]
