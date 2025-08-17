import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",            
            password="Takashi169$1991" 
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        # Close connection properly
        if connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()
