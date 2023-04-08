FROM python:3.11.3-alpine AS base
WORKDIR /app
COPY . /app

RUN apk update \
&& apk --no-cache --update add gcc musl-dev linux-headers python3-dev
RUN python -m venv /opt/venv
# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install --upgrade pip \
&& pip install --no-cache-dir -r requirements.txt


# dev 
FROM python:3.11.3-alpine AS dev
COPY --from=base /opt/venv /opt/venv
COPY --from=base /app /app

WORKDIR /app 

# Make sure we use the virtualenv:
ENV PATH="/opt/venv/bin:$PATH"
ENV FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD [ "flask","run" ]
