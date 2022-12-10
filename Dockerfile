FROM python:3.8

RUN mkdir -p /usr/local/climate/

COPY cli_mocker.py /usr/local/climate/
COPY cli_mock_map.json /usr/local/climate/
COPY symlinker.py /usr/local/climate/

ENV PATH="/usr/local/climate/:${PATH}"

COPY startup.sh /
RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]