import os

class FileSystemStorage():
    def __init__(self, cache_folder):
        self.CACHE_FOLDER_NAME = cache_folder
        os.makedirs(cache_folder, exist_ok=True)

    def get_file_content(self, file_path):
        with open(file_path, 'rt') as f:
            return float(f.read())
        
    def restore_data(self, keys):
        data = {}
        for file in keys:
            try:
                file_path = os.path.join(self.CACHE_FOLDER_NAME, file)
                data[file] = self.get_file_content(file_path)
            except FileNotFoundError: continue
        return data
    
    def persist_data(self, data) -> None:
        for key, value in data.items():
            file_path = os.path.join(self.CACHE_FOLDER_NAME, key)
            with open(file_path, 'wt') as f:
                f.write(str(value))
