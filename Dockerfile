FROM kylemanna/openvpn

CMD ["sh", "-c", "ovpn_genconfig -u tcp://${HOSTNAME} --dev null && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     openvpn --config /etc/openvpn/openvpn.conf"]
