import sys
sys.path.append('..')
sys.path.append('../..')

import tempfile
import unittest, os

from script import get_input, structure_data

class TestFunctions(unittest.TestCase):
  def test_get_input_empty_file(self):
    with open('input.txt', 'wt') as file: pass
    self.assertEqual(get_input(), [])

    os.remove('input.txt')

  def test_get_input_some_data(self):
    with open('input.txt', 'wt') as file:
      file.write('item1\n')
      file.write('1.1\n')
      file.write('item2\n')
      file.write('2.2\n')

    result = get_input()
    expected = ['item1', '1.1', 'item2', '2.2']
    self.assertEqual(result, expected)

    os.remove('input.txt')

  def test_structure_data(self):
    input_data = ['item1', '1.1', 'item2', '2.2']
    result = structure_data(input_data)
    expected = [('item1', 1.1), ('item2', 2.2)]
    self.assertEqual(result, expected)

  def test_structure_data_empty_input(self):
    self.assertEqual(structure_data([]), [])

  def test_structure_data_invalid_input(self):
    input_data = ['item1', 'not_a_number']
    with self.assertRaises(ValueError): structure_data(input_data)

if __name__ == '__main__':
    unittest.main()