FROM python:latest
ADD . /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt \
    && wget https://storage.yandexcloud.net/cloud-certs/CA.pem -O /app/CA.pem
ENTRYPOINT ["python"]
CMD ["app.py"]
EXPOSE 8080