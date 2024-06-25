import sys
sys.path.append('..')

import unittest, os
from FileSystemStorage import FileSystemStorage

class TestFileSystemStorage(unittest.TestCase):
    def assert_data_correctly_inserted_on_fs(self, expected_data):
        restored_keys = os.listdir(self.cache_folder)
        self.assertSetEqual(set(restored_keys), set(expected_data.keys()))
        for key in restored_keys:
            with open(os.path.join(self.cache_folder, key), 'rt') as f:
                restored_value = float(f.read())
                self.assertEqual(restored_value, expected_data[key])

    def manually_insert_data(self, data):
        for k, v in data.items():
            with open(os.path.join(self.cache_folder, k), 'wt') as f:
                f.write(str(v))

    def setUp(self):
        self.cache_folder = 'test_filesystem'
        self.storage = FileSystemStorage(self.cache_folder)

    def tearDown(self):
        os.system(f'rm -rf {self.cache_folder}')

    def test_folder_creation_when_filesystem_storage_is_instantiated(self):
        os.system(f'rm -rf {self.cache_folder}')
        self.assertFalse(os.path.exists(self.cache_folder))

        self.storage = FileSystemStorage(self.cache_folder)
        self.assertTrue(os.path.exists(self.cache_folder))
        self.assertListEqual(os.listdir(self.cache_folder), [])

    def test_persist_data(self):
        data = {'key1': 10.5,
                'key2': 20.3,
                'key3': 15.7}
        
        self.storage.persist_data(data)
        self.assert_data_correctly_inserted_on_fs(data)
        
        data_2 = {'key10': -1232.123,
                  'key11': 346.435}
        data.update(data_2)
        self.storage.persist_data(data_2)
        self.assert_data_correctly_inserted_on_fs(data)

    def test_restore_all_data(self):
        data = {'key1': 10.5,
               'key2': 20.3,
               'key3': 15.7}
        self.manually_insert_data(data)
        restored_data = self.storage.restore_all_data()
        self.assertDictEqual(restored_data, data)

        data2 = {'key23': 1241.5,
                 'key47': 216312}
        data.update(data2)
        self.manually_insert_data(data2)
        restored_data = self.storage.restore_all_data()
        self.assertDictEqual(restored_data, data)

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

    def test_get_file_content(self):
        data = {'key1': 10.5,
                'key2': 20.3,
                'key3': 15.7}
        self.manually_insert_data(data)
        for k, v in data.items():
            restored_value = self.storage.get_file_content(os.path.join(self.cache_folder, k))
            self.assertEqual(restored_value, v)

if __name__ == '__main__':
    unittest.main()
