FROM kylemanna/openvpn:2.4

# Добавьте в папку с Dockerfile предварительно сгенерированный dh.pem:
# openssl dhparam -out dh.pem 2048
COPY dh.pem /etc/openvpn/

CMD ["sh", "-c", "ovpn_genconfig -u tcp://$HOSTNAME -d && \
     EASYRSA_BATCH=1 ovpn_initpki nopass && \
     openvpn --config /etc/openvpn/openvpn.conf"]
