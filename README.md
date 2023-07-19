# A DJANGO API REST TO MACHINE LEARNING
A API REST with docker-compose, django, postgres, pgadmin, swagger and jwt token

## Docker Compose File:

```version: '3'

services:
  app:
    build:
      context: .
    ports:
      - "8000:8000"
    volumes:
      - ./app:/app
    command: >
      sh -c "python3 manage.py migrate && python3 manage.py wait_for_db && python3 manage.py runserver 0.0.0.0:8000"
    env_file:
      - ./.env
    depends_on:
      - db
  
  db: 
    image: postgres:13.1-alpine
    env_file:
      - ./.env
    ports:
      - "5432:5432"
    volumes: 
      - ./database.sql:/docker-entrypoint-initdb.d/database.sql


  pgadmin:
    image: dpage/pgadmin4
    restart: always
    env_file:
      - ./.env
    ports:
      - "8080:80"
    depends_on:
      - db
```
## Files 

```
├── app
│   ├── application
│   │   ├── admin.py
│   │   ├── apps.py
│   │   ├── __init__.py
│   │   ├── intelligence
│   │   │   └── __init__.py
│   │   ├── management
│   │   │   ├── commands
│   │   │   │   ├── __init__.py
│   │   │   │   └── wait_for_db.py
│   │   │   └── __init__.py
│   │   ├── migrations
│   │   │   └── __init__.py
│   │   ├── models.py
│   │   ├── serializers
│   │   │   └── __init__.py
│   │   ├── tests
│   │   │   └── __init__.py
│   │   └── views
│   │       └── __init__.py
│   ├── core
│   │   ├── asgi.py
│   │   ├── __init__.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── wsgi.py
│   └── manage.py
├── database.sql
├── docker-compose.yaml
├── Dockerfile
├── README.md
└── requirements.txt

```
