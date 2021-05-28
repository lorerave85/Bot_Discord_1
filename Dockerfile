FROM ubuntu:20.04

RUN apt update && apt -y install gcc wget build-essential software-properties-common python3-pip

RUN pip install yfinance==0.1.44

RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz \
  && tar -xzf ta-lib-0.4.0-src.tar.gz \
  && rm ta-lib-0.4.0-src.tar.gz \
  && cd ta-lib/ \
  && ./configure --prefix=/usr \
  && make \
  && make install \
  && cd ~ \
  && rm -rf ta-lib/ \
  && pip install ta-lib



COPY . /home

CMD ["python", "one.py"]
