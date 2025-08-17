import mysql.connector

def create_database():
    connection = None
    cursor = None
    try:
        connection = mysql.connector.connect(
            host="localhost",
            user="root",             
            password="Takashi169$1991"  
        )
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        if cursor is not None:
            try:
                cursor.close()
            except mysql.connector.Error:
                pass
        if connection is not None and connection.is_connected():
            try:
                connection.close()
            except mysql.connector.Error:
                pass

if __name__ == "__main__":
    create_database()
