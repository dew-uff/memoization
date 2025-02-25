import sys
sys.path.append('..')
sys.path.append('../..')

import unittest, os
from unittest.mock import patch

from DBStorageWithADictionary import DBStorageWithADictionary
from storage_scripts.DBStorage import DBStorage

class TestDBStorageWithADictionary(unittest.TestCase):
    def setUp(self):
        self.db_path = 'test_db.sqlite'
        self.storage = DBStorageWithADictionary(self.db_path)

    def tearDown(self):
        self.storage.close_connection()
        os.system(f'rm -rf {self.db_path}')

    def test_instantiate_with_empty_dict(self):
        os.system(f'rm -rf {self.db_path}')
        
        self.assertFalse(os.path.exists(self.db_path))
        self.storage = DBStorageWithADictionary(self.db_path)
        self.assertTrue(os.path.exists(self.db_path))
        self.assertDictEqual(self.storage.dictionary, {})
    
    def test_restore_part_of_data_with_empty_dict(self):
        args = ['key1', 'key2', 'key3']
        expected_return = {'key1': 10.12, 'key2': False, 'key3': 'test'}
        with patch.object(DBStorage, 'restore_part_of_data', return_value=expected_return) as superclass_restore_method:
            self.assertDictEqual(self.storage.dictionary, {})
            
            data = self.storage.restore_part_of_data(args)
            self.assertDictEqual(data, expected_return)
            self.assertDictEqual(self.storage.dictionary, expected_return)
            superclass_restore_method.assert_called_once_with(args)

    def test_restore_part_of_data_using_dict_and_db(self):
        args = ['key1', 'key2', 'key3']
        expected_return = {'key1': 10.12, 'key2': False, 'key3': 'test'}
        with patch.object(DBStorage, 'restore_part_of_data', return_value=expected_return) as superclass_restore_method:
            self.storage.dictionary = {'key2': False, 'key3': 'test'} 
            data = self.storage.restore_part_of_data(args)
            self.assertDictEqual(data, expected_return)
            self.assertDictEqual(self.storage.dictionary, expected_return)
            superclass_restore_method.assert_called_once_with(['key1'])

    def test_restore_part_of_data_using_only_dict(self):
        args = ['key1', 'key2', 'key3']
        expected_return = {'key1': 10.12, 'key2': False, 'key3': 'test'}
        with patch.object(DBStorage, 'restore_part_of_data', return_value=expected_return) as superclass_restore_method:
            self.storage.dictionary = expected_return
            data = self.storage.restore_part_of_data(args)
            self.assertDictEqual(data, expected_return)
            self.assertDictEqual(self.storage.dictionary, expected_return)
            superclass_restore_method.assert_not_called()

if __name__ == '__main__':
    unittest.main()

