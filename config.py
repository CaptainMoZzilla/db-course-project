import os

HOST_NAME = os.environ.get('DB_HOST')
DATABASE = os.environ.get('DB_NAME')

USER_NAME = os.environ.get('DB_USER')
PASSWORD = os.environ.get('DB_PASSWORD')

# if True, programm will add test data into database
IS_COLD_START = False