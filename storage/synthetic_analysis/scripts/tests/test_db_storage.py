import sys
sys.path.append('..')

import unittest, os
import sqlite3

from DBStorage import DBStorage

class TestDBStorage(unittest.TestCase):
    def assert_data_correctly_inserted_on_db(self, expected_data):
        query = "SELECT COUNT(*) FROM CACHE"
        self.storage.cursor.execute(query)
        count = self.storage.cursor.fetchone()[0]
        self.assertEqual(count, len(expected_data))
        
        query = "SELECT key, value FROM CACHE"
        self.storage.cursor.execute(query)
        result = self.storage.cursor.fetchall()
        aux = [(k, v) for k, v in expected_data.items()]
        for res in result:
            self.assertIn(res, aux)

    def manually_insert_data(self, data):
        query = "INSERT INTO CACHE(key, value) VALUES " + len(data) * "(?, ?), "
        query = query[:-2]
        params = []
        for k, v in data.items():
            params.append(k)
            params.append(v)
        self.storage.cursor.execute(query, params)

    def setUp(self):
        self.db_path = 'test_db.sqlite'
        self.storage = DBStorage(self.db_path)

    def tearDown(self):
        self.storage.close_connection()
        os.system(f'rm -rf {self.db_path}')

    def test_db_creation_when_db_storage_is_instantiated(self):
        os.system(f'rm -rf {self.db_path}')
        
        self.assertFalse(os.path.exists(self.db_path))
        self.storage = DBStorage(self.db_path)
        self.assertTrue(os.path.exists(self.db_path))
    
        table_name = 'CACHE'
        query = f"SELECT name FROM sqlite_master WHERE type='table' AND name='{table_name}'"
        self.storage.cursor.execute(query)
        result = self.storage.cursor.fetchone()[0]
        self.assertEqual(result, 'CACHE')

    def test_persist_data(self):
        data = {'key1': 10.5,
                'key2': 20.3,
                'key3': 15.7}
        
        self.storage.persist_data(data)
        self.assert_data_correctly_inserted_on_db(data)
        
        data_2 = {'key10': -1232.123,
                  'key11': 346.435}
        data.update(data_2)
        self.storage.persist_data(data_2)
        self.assert_data_correctly_inserted_on_db(data)

    def test_restore_part_of_data(self):
        data = {'key1': 10.5,
                'key2': 20.3,
                'key3': 15.7,
                'key4': 112345.7,
                'key5': 15.712312}
        self.manually_insert_data(data)
        restored_data = self.storage.restore_part_of_data(['key2', 'key5', 'key9'])
        self.assertDictEqual(restored_data, {'key2': 20.3, 'key5': 15.712312})

        restored_data = self.storage.restore_part_of_data(['key20', 'key25'])
        self.assertDictEqual(restored_data, {})

        restored_data = self.storage.restore_part_of_data(['key3'])
        self.assertDictEqual(restored_data, {'key3': 15.7})

if __name__ == '__main__':
    unittest.main()