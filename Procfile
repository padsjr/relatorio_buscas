web: gunicorn app:app --workers 1 --threads 4 --timeout 300 --worker-class sync --max-requests 100 --max-requests-jitter 10 --bind 0.0.0.0:$PORT

