FROM python:3.12-slim
WORKDIR /theapp
COPY Docker3/ .
RUN pip install flask
ENV APP_MODE=production
ENV APP_REGION=canada-west
EXPOSE 8080
CMD ["python", "app.py"]
