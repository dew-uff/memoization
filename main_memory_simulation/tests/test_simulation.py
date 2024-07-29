import sys
sys.path.append('..')
sys.path.append('../..')

import unittest, random, os
from unittest.mock import patch
from functools import wraps
from simulation import get_config_boundaries, draw_config, execute_simulation

class TestUtil(unittest.TestCase):
    def setUp(self): pass
        # self.log_file = 'test_log.txt'
        # self.num_repetitions = random.randint(3, 1000)

    def tearDown(self): pass
        # os.system(f'rm {self.log_file}')

    def test_get_config_boundaries(self):
        expected_bondaries = {
            'SET_1': {
                'cache_size': {'min': 60e3, 'max': 120e3},
                'deterministic_calls': {'min': 660e3, 'max': 1300e3},
                'cache_miss_rate': {'min': 0, 'max': 5}
            },
            'SET_2': {
                'cache_size': {'min': 1, 'max': 3},
                'deterministic_calls': {'min': 10, 'max': 20},
                'cache_miss_rate': {'min': 0, 'max': 5}
            },
            'SET_3': {
                'cache_size': {'min': 60e3, 'max': 120e3},
                'deterministic_calls': {'min': 660e3, 'max': 1300e3},
                'cache_miss_rate': {'min': 50, 'max': 100}
            }
        }
        boundaries = get_config_boundaries()
        self.assertDictEqual(boundaries, expected_bondaries)

    def test_draw_config(self):
        first_config_expected = {
            'SET_1': {
                'cache_size': 115340,
                'deterministic_calls': 1063958,
                'cache_miss_rate': 0.03
            },
            'SET_2': {
                'cache_size': 1,
                'deterministic_calls': 14,
                'cache_miss_rate': 0.04
            },
            'SET_3': {
                'cache_size': 91845,
                'deterministic_calls': 1084604,
                'cache_miss_rate': 1.0
            }
        }
        second_config_expected = {
            'SET_1': {
                'cache_size': 114385,
                'deterministic_calls': 978046,
                'cache_miss_rate': 0.03},
            'SET_2': {
                'cache_size': 2,
                'deterministic_calls': 19,
                'cache_miss_rate': 0.01},
            'SET_3': {
                'cache_size': 93075,
                'deterministic_calls': 806039,
                'cache_miss_rate': 0.68}
        }

        random.seed(0)
        first_confing = draw_config()
        second_confing = draw_config()
        self.assertDictEqual(first_confing, first_config_expected)
        self.assertDictEqual(second_confing, second_config_expected)

    @patch('os.system')
    def test_execute_simulation(self, mock_system):
        # Prepare mock to capture calls
        mock_system.side_effect = lambda cmd: mock_system.call_args_list.append(cmd)

        # Define test data
        cached_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3']
        all_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3', 'hash4', '4.4', 'hash5', '5.5', 'hash6', '6.6']
        num_dict = 2

        # Define the expected commands
        expected_commands = [
            'python speedupy/setup_exp/setup.py script.py',
            'python script.py fast hash1 1.1 hash2 2.2 hash3 3.3 --exec-mode manual --num-dict 2 -s db',
            'python script.py slow hash1 1.1 hash2 2.2 hash3 3.3 hash4 4.4 hash5 5.5 hash6 6.6 --exec-mode manual --num-dict 2 -s db',
            'rm -rf .speedupy/'
        ]

        execute_simulation(cached_data, all_data, num_dict)

        print(mock_system.call_args_list)

        actual_commands = [call[0][0] for call in mock_system.call_args_list]
        self.assertEqual(actual_commands, expected_commands)


























    # def assert_log_file_content(self, expected_content):
    #     with open(self.log_file, 'rt') as file:
    #         self.assertEqual(file.read(), expected_content)

    # def test_append_to_log_file(self):
    #     os.system(f'rm {self.log_file}')
    #     self.assertFalse(os.path.exists(self.log_file))

    #     storage_type = 'test_storage'
    #     data_size = 10
    #     exec_time = 1.2
    #     append_to_log_file(self.log_file, storage_type, data_size, 
    #     exec_time)

    #     expected_content = ('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n'
    #                         f'Storage: {storage_type}\n'
    #                         f'Data Size: {data_size}\n'
    #                         f'Execution time: {exec_time:.6f} seconds\n\n')
    #     self.assertTrue(os.path.exists(self.log_file))
    #     self.assert_log_file_content(expected_content)

    #     storage_type = 'test_storage'
    #     data_size = 10
    #     exec_time = 1.2
    #     append_to_log_file(self.log_file, storage_type, data_size, 
    #     exec_time)
    #     expected_content += ('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n'
    #                          f'Storage: {storage_type}\n'
    #                          f'Data Size: {data_size}\n'
    #                          f'Execution time: {exec_time:.6f} seconds\n\n')
    #     self.assert_log_file_content(expected_content)

    # def test_decorator(self):
    #     self.call_count = 0

    #     def count_main_function_calls(func):
    #         @wraps(func)
    #         def wrapper(*args, **kwargs):
    #             self.call_count += 1
    #             return func(*args, **kwargs)
    #         return wrapper
    
    #     @measure_performance(self.num_repetitions, self.log_file)
    #     @count_main_function_calls
    #     def aux(data):
    #         return len(data)
        
    #     with patch('util.append_to_log_file') as append_func:
    #         args = [1, 3, 5]
    #         aux(args)
    #         append_func.assert_called_once_with(self.log_file, 'TestUtil.test_decorator.<locals>.aux', len(args), len(args))
    #     self.assertEqual(self.call_count, self.num_repetitions)

    # def test_decorator(self):
    #     @measure_performance(self.num_repetitions, self.log_file)
    #     def aux(data, x1, x2, x3, x4):
    #         y1 = x1
    #         y2 = x2
    #         y3 = x3
    #         y4 = x4
    #         return len(data)
        
    #     with patch('util.append_to_log_file') as append_func:
    #         args = [[1, 3, 5], 'test', False, -31.124, {1, 3, 2}]
    #         aux(*args)
    #         append_func.assert_called_once_with(self.log_file, 'TestUtil.test_decorator.<locals>.aux', 3, 3)

if __name__ == '__main__':
    unittest.main()
