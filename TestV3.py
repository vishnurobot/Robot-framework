import re
import json


def validate_data(data_file):
    with open(data_file, 'r') as jsonData:
        data = json.load(jsonData)

    username = data['username']
    email = data['email']
    password = data['password']

    if not (2 < len(username) < 13):
        raise TypeError(
            f"Given username '{username}' is not between 3 to 12 characters or is not alph numaric. Current username length is {len(username)}.")
    else:
        print(f"given username {username} valid")

    if not (8 == len(password)
            and any(char.isupper() for char in password)
            and any(char.islower() for char in password)
            and any(
                char in '!@#$%^&*()-_=+[]{};:,.<>?/|' for char in password)
            and ' ' not in password):
        raise TypeError(
            f"Invalid password.Password must be 8 char long, contain at least one uppercase letter, one lowercase letter, one special character, and no spaces.")
    else:
        print(f"given password {password} valid")

    if not re.match(r'^[a-zA-Z0-9._]+@[a-zA-Z.-]+\.[a-zA-Z]{2,3}$', email):
        raise TypeError('Invalid email address')
    else:
        print('valid email address')


test = validate_data('userData.json')
