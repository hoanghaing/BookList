FROM python:3.6-slim
RUN mkdir /app
WORKDIR /app
ADD requirements.txt ./
RUN pip install -r requirements.txt
ADD ./ ./
# CMD ["python3", "app.py"]