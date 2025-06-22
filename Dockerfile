FROM kylemanna/openvpn

# Используем правильный синтаксис без --
CMD ["sh", "-c", "ovpn_genconfig -u tcp://$HOSTNAME -d && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     openvpn --config /etc/openvpn/openvpn.conf"]
