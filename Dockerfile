FROM python:3.9-slim

ENV ANSIBLE_HOST_KEY_CHECKING=False

# Install required libraries
RUN apt-get -qq update > /dev/null && \
    apt-get install -y -qq curl jq openssh-client > /dev/null && \
    python3 -m pip install --no-cache-dir --quiet -U pip && \
    python3 -m pip install --no-cache-dir --quiet ansible==2.10.1 ansible-modules-hashivault==4.5.6 && \
    apt autoremove -y --quiet

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
