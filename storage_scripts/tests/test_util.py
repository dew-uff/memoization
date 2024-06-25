import sys
sys.path.append('..')

import unittest, os
from util import append_to_log_file

class TestUtil(unittest.TestCase):
    def setUp(self):
        self.log_file = 'test_log.txt'

    def tearDown(self):
        os.system(f'rm {self.log_file}')

    def assert_log_file_content(self, expected_content):
        with open(self.log_file, 'rt') as file:
            self.assertEqual(file.read(), expected_content)

    def test_append_to_log_file(self):
        os.system(f'rm {self.log_file}')
        self.assertFalse(os.path.exists(self.log_file))

        storage_type = 'test_storage'
        data_size = 10
        exec_time = 1.2
        append_to_log_file(self.log_file, storage_type, data_size, 
        exec_time)

        expected_content = ('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n'
                            f'Storage: {storage_type}\n'
                            f'Data Size: {data_size}\n'
                            f'Execution time: {exec_time:.6f} seconds\n\n')
        self.assertTrue(os.path.exists(self.log_file))
        self.assert_log_file_content(expected_content)

        storage_type = 'test_storage'
        data_size = 10
        exec_time = 1.2
        append_to_log_file(self.log_file, storage_type, data_size, 
        exec_time)
        expected_content += ('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n'
                             f'Storage: {storage_type}\n'
                             f'Data Size: {data_size}\n'
                             f'Execution time: {exec_time:.6f} seconds\n\n')
        self.assert_log_file_content(expected_content)

if __name__ == '__main__':
    unittest.main()
