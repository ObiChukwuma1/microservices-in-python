FROM python:3.12-rc-alpine
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY src src
EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=30s --start-period=30s --retries=5 \
            CMD curl -f http://localhost/health || exit

ENTRYPOINT ["python", "./src/app.py"]
