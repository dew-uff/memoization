import sys
sys.path.append('..')

from DBStorageWithADictionary import DBStorageWithADictionary

db = DBStorageWithADictionary('test')
db.dictionary
db.persist_data({'1':1, '2':4, '3':9, '4':16, '5':25})

db.dictionary
db.restore_part_of_data(['1', '2'])
db.dictionary

db.dictionary
db.restore_part_of_data(['1', '2', '5'])
db.dictionary

db.dictionary
db.restore_part_of_data({'2'})
db.dictionary