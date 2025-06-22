FROM kylemanna/openvpn

# Открываем порты
EXPOSE 1194/udp
EXPOSE 443/tcp

# Команда запуска
CMD ["sh", "-c", "ovpn_genconfig -u udp://${HOSTNAME} && EASYRSA_BATCH=1 ovpn_initpki nopass && openvpn --config /etc/openvpn/openvpn.conf"]
