import sys
sys.path.append('..')
sys.path.append('../..')

import unittest, random, os, time
from unittest.mock import patch
from functools import wraps
from simulation import get_config_boundaries, draw_config, execute_simulation, generate_simulation_data

class TestUtil(unittest.TestCase):
    def setUp(self):
        random.seed(time.time())

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
    def test_execute_simulation_1_dict(self, mock_system):
        # Prepare mock to capture calls
        mock_system.commands = []
        mock_system.side_effect = lambda cmd: mock_system.commands.append(cmd)

        # Define test data
        cached_data = ['hash0', '0.0', 'hash3', '3.3']
        all_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3', 'hash0', '0.0']
        num_dict = 1

        expected_commands = [
            'python speedupy/setup_exp/setup.py script.py',
            'python script.py fast hash0 0.0 hash3 3.3 --exec-mode manual --num-dict 1 -s db',
            'python script.py slow hash1 1.1 hash2 2.2 hash3 3.3 hash0 0.0 --exec-mode manual --num-dict 1 -s db',
            'rm -rf .speedupy/'
        ]

        execute_simulation(cached_data, all_data, num_dict)

        self.assertEqual(mock_system.commands, expected_commands)

    @patch('os.system')
    def test_execute_simulation_2_dicts(self, mock_system):
        # Prepare mock to capture calls
        mock_system.commands = []
        mock_system.side_effect = lambda cmd: mock_system.commands.append(cmd)

        # Define test data
        cached_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3']
        all_data = ['hash1', '1.1', 'hash2', '2.2', 'hash3', '3.3', 'hash4', '4.4', 'hash5', '5.5', 'hash6', '6.6']
        num_dict = 2

        expected_commands = [
            'python speedupy/setup_exp/setup.py script.py',
            'python script.py fast hash1 1.1 hash2 2.2 hash3 3.3 --exec-mode manual --num-dict 2 -s db',
            'python script.py slow hash1 1.1 hash2 2.2 hash3 3.3 hash4 4.4 hash5 5.5 hash6 6.6 --exec-mode manual --num-dict 2 -s db',
            'rm -rf .speedupy/'
        ]

        execute_simulation(cached_data, all_data, num_dict)

        self.assertEqual(mock_system.commands, expected_commands)

    @patch('simulation.generate_data')
    def test_generate_simulation_data(self, mock_generate_data):
        mock_generate_data.side_effect = [
            {'hash0': '0.0', 'hash2': '2.2', 'hash28': '28.28', 'hash-7': '7.7'},  # First call for new_data
            {'hash5': '5.5', 'hash-3': '-3.3', 'hash42': '42.42'}   # Second call for cached_data
        ]
        
        random.seed(0)
        cached_data, all_data = generate_simulation_data(2, 3)

        self.assertEqual(cached_data, ['hash42', '42.42', 'hash-3', '-3.3', 'hash5', '5.5'])
        self.assertEqual(all_data, ['hash2', '2.2', 'hash42', '42.42', 'hash-3', '-3.3', 'hash5', '5.5', 'hash28', '28.28', 'hash0', '0.0', 'hash-7', '7.7'])

if __name__ == '__main__':
    unittest.main()
