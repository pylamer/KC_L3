FROM python
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY main.py main.py
COPY wsgi.py wsgi.py
EXPOSE 8000
RUN apt-get update && apt-get install -y --no-install-recommends gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers=10", "wsgi:app"]