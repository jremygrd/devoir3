FROM python:latest

RUN pip install psycopg2
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /
RUN chmod +x /wait-for-it.sh

ENTRYPOINT ["/wait-for-it.sh", "db:5432", "--"]
COPY manager manager_module
CMD python -m manager_module