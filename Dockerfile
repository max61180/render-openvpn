FROM kylemanna/openvpn
CMD ["sh", "-c", "ovpn_genconfig -u udp://${HOSTNAME} && (echo -e '\\n\\n\\n' | ovpn_initpki) && ovpn_run"]
