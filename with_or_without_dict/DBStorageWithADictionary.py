from storage_scripts.DBStorage import DBStorage

class DBStorageWithADictionary(DBStorage):
    def __init__(self, db_path):
        super().__init__(db_path)
        self.dictionary = {}

    def restore_part_of_data(self, keys):
        keys_not_found = [k for k in keys if k not in self.dictionary.keys()]
        self.dictionary.update(super().restore_part_of_data(keys_not_found))
        data = {k:self.dictionary[k] for k in keys}
        return data
