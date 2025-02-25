import sys
sys.path.append('..')

import unittest, random, os
from unittest.mock import patch
from functools import wraps
from util import append_to_log_file, measure_performance

class TestUtil(unittest.TestCase):
    def setUp(self):
        self.log_file = 'test_log.txt'
        self.num_repetitions = random.randint(3, 1000)

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

    def test_decorator(self):
        self.call_count = 0

        def count_main_function_calls(func):
            @wraps(func)
            def wrapper(*args, **kwargs):
                self.call_count += 1
                return func(*args, **kwargs)
            return wrapper
    
        @measure_performance(self.num_repetitions, self.log_file)
        @count_main_function_calls
        def aux(data):
            return len(data)
        
        with patch('util.append_to_log_file') as append_func:
            args = [1, 3, 5]
            aux(args)
            append_func.assert_called_once_with(self.log_file, 'TestUtil.test_decorator.<locals>.aux', len(args), len(args))
        self.assertEqual(self.call_count, self.num_repetitions)

    def test_decorator(self):
        @measure_performance(self.num_repetitions, self.log_file)
        def aux(data, x1, x2, x3, x4):
            y1 = x1
            y2 = x2
            y3 = x3
            y4 = x4
            return len(data)
        
        with patch('util.append_to_log_file') as append_func:
            args = [[1, 3, 5], 'test', False, -31.124, {1, 3, 2}]
            aux(*args)
            append_func.assert_called_once_with(self.log_file, 'TestUtil.test_decorator.<locals>.aux', 3, 3)

if __name__ == '__main__':
    unittest.main()
