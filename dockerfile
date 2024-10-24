version: '3'
services:
  s3:
    image: localstack/localstack
    environment:
      - SERVICES=s3,ec2,dynamodb
      - DEBUG=1
      - DATA_DIR=/tmp/localstack
      - DEFAULT_REGION=eu-west-1
      - AWS_ACCESS_KEY_ID=testkey
      - AWS_SECRET_ACCESS_KEY=testsecret
    ports:
      - "4566-4599:4566-4599"
  djangoProject: 
    image: python
    environment:
      - DJANGO_PORT=8000
    volumes:
      - ./Django:/var/www/Django
    ports:
      - "8000:8000"
