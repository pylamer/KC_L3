FROM python
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip && pip install -r requirements.txt
COPY main.py main.py
EXPOSE 7500
CMD ["gunicorn", "--bind", "0.0.0.0:7500", "--workers=2", "--threads=20", "main:app"]