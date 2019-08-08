FROM python:3.6-slim
RUN mkdir /app
WORKDIR /app
ADD requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
ENV FLASK_APP=server/app.py
CMD ["flask", "run", "--host", "0.0.0.0"]
# CMD ["python3", "server/app.py"]