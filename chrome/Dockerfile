FROM jess/chrome:latest

RUN apt-get update && apt-get install -y pulseaudio gstreamer0.10-alsa
RUN echo enable-shm=no >> /etc/pulse/client.conf
ENV PULSE_SERVER /run/pulse/native
