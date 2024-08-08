import sys
sys.path.append('..')
sys.path.append('../..')

import unittest, random, os, time, io
from unittest.mock import patch
from functools import wraps
from simulation import get_config_boundaries, draw_config, execute_simulation, generate_simulation_data, generate_script_input_file
import simulation

class TestUtil(unittest.TestCase):
    def setUp(self):
        random.seed(time.time())
    
    def tearDown(self):
        if os.path.exists('input.txt'):
            os.remove('input.txt')

    def test_get_config_boundaries(self):
        expected_bondaries = {
            f'SET_{i+1}': {
                'deterministic_calls': {'min': i*1000, 'max': (i+1)*1000},
                'cache_miss_rate': {'min': 0, 'max': 20}
            } for i in range(1, 20, 1)
        }
        expected_bondaries['SET_1'] = {
            'deterministic_calls': {'min': 500, 'max': 1000},
            'cache_miss_rate': {'min': 0, 'max': 20}
        }
        
        boundaries = get_config_boundaries()
        self.assertDictEqual(boundaries, expected_bondaries)

    def test_draw_config(self):
        first_config_expected = {
            'SET_1': {
                'deterministic_calls': 741,
                'cache_miss_rate': 0.17
            },
            'SET_2': {
                'deterministic_calls': 1864,
                'cache_miss_rate': 0.12
            },
            'SET_3': {
                'deterministic_calls': 2776,
                'cache_miss_rate': 0.13,
            }
        }

        random.seed(0)
        first_confing = draw_config()
        for k, v in first_config_expected.items():
            self.assertIn(k, first_confing)
            self.assertDictEqual(first_confing[k], v)

    @patch('sys.stdout', new_callable=io.StringIO)
    @patch('os.system')
    def test_execute_simulation_commands_executed(self, mock_system, mock_stdout):
        num_dict = random.choice(['0', '1', '2', '2-fast'])
        mock_system.commands = []
        mock_system.side_effect = lambda cmd: mock_system.commands.append(cmd)
        expected_commands = [
            'python speedupy/setup_exp/setup.py script.py',
            f'python script.py fast --exec-mode manual --num-dict {num_dict} -s db',
            f'python script.py slow --exec-mode manual --num-dict {num_dict} -s db',
            'rm -rf .speedupy/'
        ]

        execute_simulation([], [], num_dict)
        self.assertEqual(mock_system.commands, expected_commands)

    @patch('sys.stdout', new_callable=io.StringIO)
    @patch('os.system')
    @patch('simulation.generate_script_input_file')
    def test_execute_simulation_input_files_correctly_generated(self, mock_generate_script_input_file, mock_os_system, mock_stdout):
        written_data = []
        mock_generate_script_input_file.side_effect = lambda data: written_data.append(data)
        mock_os_system.return_value = 0  # Mock successful command execution

        cached_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3']
        all_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3', 'hash4', '4.4', 'hash5', '5.5', 'hash6', '6.6']
        num_dict = 5

        execute_simulation(cached_data, all_data, num_dict)

        self.assertEqual(len(written_data), 2)
        self.assertEqual(written_data[0], cached_data)
        self.assertEqual(written_data[1], all_data)  

    def test_generate_script_input_file(self):
        self.assertFalse(os.path.isfile('input.txt'))

        data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3', 'hash0', '0.0']
        generate_script_input_file(data)

        self.assertTrue(os.path.isfile('input.txt'))

        with open('input.txt', 'rt') as f:
            content = f.read()

        expected_content = '\n'.join(data) + '\n'
        self.assertEqual(content, expected_content)

        


    # @patch('simulation.generate_data')
    # def test_generate_simulation_data(self, mock_generate_data):
    #     mock_generate_data.side_effect = [
    #         {'hash0': '0.0', 'hash2': '2.2', 'hash28': '28.28', 'hash-7': '7.7'},  # First call for new_data
    #         {'hash5': '5.5', 'hash-3': '-3.3', 'hash42': '42.42'}   # Second call for cached_data
    #     ]
        
    #     random.seed(0)
    #     cached_data, all_data = generate_simulation_data(2, 3)

    #     self.assertEqual(cached_data, ['hash42', '42.42', 'hash-3', '-3.3', 'hash5', '5.5'])
    #     self.assertEqual(all_data, ['hash2', '2.2', 'hash42', '42.42', 'hash-3', '-3.3', 'hash5', '5.5', 'hash28', '28.28', 'hash0', '0.0', 'hash-7', '7.7'])

if __name__ == '__main__':
    unittest.main()
