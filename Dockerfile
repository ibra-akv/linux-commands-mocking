FROM python:3.8

RUN mkdir -p /usr/local/climate/

COPY src/cli_mocker.py /usr/local/climate/
COPY src/cli_mock_map.json /usr/local/climate/
COPY src/symlinker.py /usr/local/climate/

ENV PATH="/usr/local/climate/:${PATH}"

COPY src/startup.sh /
RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]