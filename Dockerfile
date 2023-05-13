FROM python
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY main.py main.py
COPY wsgi.py wsgi.py
EXPOSE 5000
RUN apt-get update && apt-get install -y --no-install-recommends gunicorn
CMD python wsgi.py