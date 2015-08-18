# reference:
# 	http://linuxg.net/how-to-install-wireshark-1-12-on-ubuntu-14-04-and-derivatives-from-sources/
#	/usr/local/bin/wireshark 

FROM ubuntu

RUN apt-get update
RUN apt-get build-dep wireshark -y

RUN cd ~
RUN wget https://1.as.dl.wireshark.org/src/wireshark-1.12.7.tar.bz2 && \
	tar xvfj wireshark-1.12.7.tar.bz2 && \
	cd wireshark-1.12.7 && \
	./configure --with-qt=no --with-gtk3=yes && \
	make && make install && \
	cd .. && rm -rf wireshark*

ADD run /usr/local/bin/wireshark

USER wireshark
ENV HOME /home/wireshark
WORKDIR /home/wireshark

CMD ["wireshark"]
