import re
import json


def validate_data(data_file):
    with open(data_file, 'r') as jsonData:
        data = json.load(jsonData)

    username = data['username']
    email = data['email']
    password = data['password']

    if not (2 < len(username) < 13):
        return False, f"Given username '{username}' is not between 3 to 12 characters. Current username length is {len(username)}."

    if not re.match(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', email):
        return False, "Invalid email address."

    # Password validation
    if not (8 <= len(password) <= 16 and any(char.isupper() for char in password) and any(
            char.islower() for char in password) and any(
        char in '!@#$%^&*()-_=+[]{};:,.<>?/|' for char in password) and ' ' not in password):
        return False, "Invalid password format. Password must be 8-16 characters long, contain at least one uppercase letter, one lowercase letter, one special character, and no spaces."

    # If all validations pass, return True with a success message
    return True, "Data is valid."


# Example usage:
valid, message = validate_data('userData.json')
if valid:
    print("Data is valid.")
else:
    print("Data is invalid:", message)
