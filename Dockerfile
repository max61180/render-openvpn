FROM kylemanna/openvpn

# Генерация конфига и ключей без пароля
CMD ["sh", "-c", "ovpn_genconfig -u udp://${HOSTNAME} && EASYRSA_BATCH=1 EASYRSA_REQ_CN='OpenVPN-CA' ovpn_initpki nopass && ovpn_run"]
