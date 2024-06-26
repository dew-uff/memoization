from storage_scripts.DBStorage import DBStorage

class DBStorageWithoutDictionary(DBStorage):
    def __init__(self, db_path):
        super().__init__(db_path)

    def persist_data(self, data):
        for key, value in data.items(): super().persist_data({key: value})

    # def restore_part_of_data(self, keys):
    #     data = {}
    #     for k in keys:
    #         if k in self.dictionary:
    #             data[k] = self.dictionary[k]
    #         else:
    #             data[k] = super().restore_part_of_data([k])[k]
    #             self.dictionary[k] = data[k]
    #     return data
