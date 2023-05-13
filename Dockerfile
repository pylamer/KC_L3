FROM python
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY main.py main.py
COPY wsgi.py wsgi.py
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers=10", "wsgi:app"]