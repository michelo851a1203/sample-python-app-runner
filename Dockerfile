FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

RUN apt-get update && apt-get install -y \
  curl \
  gcc \
  && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir . 

COPY . .  

RUN adduser --disabled-password --gecos '' appuser
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 8080

# health check

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080 || exit 1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
