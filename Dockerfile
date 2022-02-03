FROM selenium/node-chrome:4.1.1-20220121
LABEL authors=SeleniumHQ

USER root

RUN mkdir -p /colds
RUN printf "#!/bin/bash \
\necho "BROWSER=/usr/bin/google-chrome-stable" >> ~/.bashrc \
\n/usr/bin/X11/google-chrome-stable https://coldstorage.com.sg --start-fullscreen \
\nwait" > /colds/chromecolds
RUN chmod 777 /colds/chromecolds

USER 1200

#====================================
# Set necessary environment variables
#====================================
# Boolean value, maps "--relax-checks"
ENV SE_RELAX_CHECKS true

# Run the VNC server without password
ENV VNC_NO_PASSWORD=1
#====================================

EXPOSE 4444
