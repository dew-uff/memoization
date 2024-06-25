import sys
sys.path.append('..')

import unittest, os
import sqlite3

from DBStorage import DBStorage

class TestDBStorage(unittest.TestCase):

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

        query = "SELECT COUNT(*) FROM CACHE"
        self.storage.cursor.execute(query)
        count = self.storage.cursor.fetchone()[0]
        self.assertEqual(count, 3)
        
        query = "SELECT key, value FROM CACHE"
        self.storage.cursor.execute(query)
        result = self.storage.cursor.fetchall()

        data_2 = [(k, v) for k, v in data]
        for res in result:
            self.assertIn(res, data_2)

    ######TODO:!!!!
    def test_restore_data(self):
        # Test restoring all data
        restored_data = self.storage.restore_all_data()
        self.assertEqual(restored_data, data)

        # Test restoring part of the data
        keys_to_restore = ['key1', 'key3']
        restored_partial_data = self.storage.restore_part_of_data(keys_to_restore)
        expected_partial_data = {
            'key1': 10.5,
            'key3': 15.7
        }
        self.assertEqual(restored_partial_data, expected_partial_data)

    def test_close_connection(self):
        # Test closing the connection
        self.storage.close_connection()

        # Attempting to perform an operation after closing should raise an exception
        with self.assertRaises(sqlite3.ProgrammingError):
            self.storage.restore_all_data()

if __name__ == '__main__':
    unittest.main()

