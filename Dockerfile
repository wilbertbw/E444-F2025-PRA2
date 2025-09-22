FROM python:3.13

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . ./src
WORKDIR /src
EXPOSE 5000

RUN useradd app
USER app

ENV FLASK_APP=hello.py
CMD ["flask", "run", "--host", "0.0.0.0"]