FROM kylemanna/openvpn

# Запускаем OpenVPN на локальном порту 1194, а затем проксируем через WS
CMD ["sh", "-c", "ovpn_genconfig -u tcp://$HOSTNAME -p 'port 1194' -d && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     socat TCP-LISTEN:8080,fork TCP:127.0.0.1:1194 & \
     openvpn --config /etc/openvpn/openvpn.conf"]
