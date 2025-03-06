import sqlite3
class DBStorage():
    def __init__(self, db_path):
        self.conexao = sqlite3.connect(db_path)
        self.cursor = self.conexao.cursor()
        self.cursor.execute('CREATE TABLE CACHE( \
                            key TEXT NOT NULL PRIMARY KEY, \
                            value REAL NOT NULL)')

    def restore_part_of_data(self, keys):
        sql_stmt = "SELECT key, value FROM CACHE WHERE key IN (" + len(keys)*"?, "
        sql_stmt = sql_stmt[:-2] + ")"
        self.cursor.execute(sql_stmt, keys)
        results = self.cursor.fetchall()
        
        data = {}
        for k, v in results:
            data[k] = v
        return data

    def persist_data(self, data) -> None:
        sql_params = []
        for key, value in data.items():
            sql_params.append(key)
            sql_params.append(value)
        sql_stmt = "INSERT OR IGNORE INTO CACHE(key, value) VALUES" + len(data) * " (?, ?),"
        sql_stmt = sql_stmt[:-1]
        
        self.cursor.execute(sql_stmt, sql_params)
    
    def commit(self):
        self.conexao.commit()

    def close_connection(self):
        self.conexao.close()