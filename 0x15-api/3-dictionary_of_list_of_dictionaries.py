#!/usr/bin/python3
"""
task3: consume dummy API and get useful
data in a specific format
ouput saves as json format, for all users
record examlpe
{ "USER_ID": [{"task": "TASK_TITLE", "completed":
 TASK_COMPLETED_STATUS, "username": "USERNAME"}, {
    "task": "TASK_TITLE", "completed": TASK_COMPLETED_STATUS
    , "username": "USERNAME"}, ... ]}
"""
import json
import requests
from sys import argv


def save_to_json():
    """task 3 : consume API
    then save_to_json
    """
    # Make an API call  and store the response
    usersurl = f"https://jsonplaceholder.typicode.com/users/"
    session = requests.Session()
    usr_resp = session.get(usersurl)
    dictin = {}
    for usr in usr_resp.json():
        usr_id = usr.get('id', None)
        usr_name = usr.get('username', None)

        todosurl = f'https://jsonplaceholder.typicode.com/users/{usr_id}/todos'
        todos_resp = session.get(todosurl)

        dictin[usr_id] = []

        for task in todos_resp.json():
            task_status = task.get('completed', None)
            title = task.get('title', None)

            dictin[usr_id].append({
                "task": title,
                "completed": task_status,
                "username": usr_name
            })

        # print(dictin)
        with open("todo_all_employees.json", 'w') as file:
            json.dump(dictin, file)


if __name__ == '__main__':
    save_to_json()
