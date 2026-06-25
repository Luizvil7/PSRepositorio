import sqlite3
import os # lib para acessar o módulo "os" da biblioteca padrão do Python

BASE_DIR = os.path.dirname(os.path.abspath(__file__)) # onde está o init_db
DB_PATH = os.path.join(BASE_DIR, "database.db") # onde está o DB
SQL_PATH = os.path.join(BASE_DIR, "create_db.sql") # onde está o SQL

def init_db():
    conn = sqlite3.connect(DB_PATH)
    cursor = conn.cursor()
    
    with open(SQL_PATH, "r", encoding="utf-8") as arquivo:
        sql = arquivo.read()
        cursor.executescript(sql)
    
    conn.commit()
    conn.close()
    print("Banco criado com sucesso parceiro!")

if __name__ == "__main__":
    init_db()