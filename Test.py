import json

with open("testData.json", 'r') as jsonData:
    data = json.load(jsonData)

keys_list = []
values_list = []

for key, value in data.items():
    if not isinstance(value, int):
        keys_list.append(key)
        values_list.append(str(value))

with open('keys_data.txt', 'w') as keys_list_file:
    keys_list_file.write(','.join(keys_list))

with open('values_Data.txt', 'w') as values_list_file:
    values_list_file.write(','.join(values_list))

"""
below json data used to test
jsonData.json={
  "name": "vishnu",
  "gender": "male",
  "age": 29,
  "test": "QA"
}
"""
