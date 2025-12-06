import psycopg
from psycopg.rows import dict_row

# REPLACE CONFIG WITH YOUR INFORMATION
config = "dbname=phone_app user=user"

class Database:
    def __init__(self):
        self.connection=None
        try:
            self.connection = psycopg.connect(config)
            print("Database was connected correctly")
        except psycopg.Error as e:
            print(f"Failed to connect to database: {e}")
            raise
        finally:
            print(f"With Config: {config}")

    def disconnect(self):
        try:
            self.connection.close()
            print("Database connect was closed correctly")
        except psycopg.Error as e:
            print(f"Failed to disconnect from database: {e}")
            raise

    def query(self, query="", data=None, fetch=False):
        with self.connection.cursor(row_factory=dict_row) as cursor:
            cursor.execute(query, data)
            self.connection.commit()
            if fetch:
                return cursor.fetchall()
            
    def fetchPhones(self, simplified=False, limit=100):
        if simplified:
            phones = self.query(query="SELECT modelname, rating, price FROM phonemodel", fetch=True)
        else:
            phones = self.query(query="SELECT * FROM phonemodel", fetch=True)
        return phones