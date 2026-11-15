FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 4000

# Production default. docker-compose.yml overrides this with --reload for development.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "4000", "--proxy-headers", "--forwarded-allow-ips=*"]
