FROM kylemanna/openvpn:2.4

# Режим TCP-прокси без TUN (единственный вариант для Free)
CMD ["sh", "-c", "\
  ovpn_genconfig -u tcp://$HOSTNAME -d && \
  EASYRSA_BATCH=1 ovpn_initpki nopass && \
  echo 'Это НЕ полноценный VPN! Только TCP-прокси' && \
  openvpn --config /etc/openvpn/openvpn.conf"]
