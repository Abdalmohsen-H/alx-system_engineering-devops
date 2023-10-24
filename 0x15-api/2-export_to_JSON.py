#!/usr/bin/python3
"""
task2: consume dummy API and get useful
data in a specific format
ouput saves as json format, record examlpe
{ "USER_ID": [{"task": "TASK_TITLE", "completed":
 TASK_COMPLETED_STATUS, "username": "USERNAME"}, {
    "task": "TASK_TITLE", "completed": TASK_COMPLETED_STATUS
    , "username": "USERNAME"}, ... ]}
"""
import json
import requests
from sys import argv


def save_to_json():
    """ task 2 : consume API
    then save_to_json
    """
    # Make an API call  and store the response
    if len(argv) > 1:
        usr_id = argv[1]
        todosurl = f'https://jsonplaceholder.typicode.com/users/{usr_id}/todos'
        session = requests.Session()
        todos_resp = session.get(todosurl)

        usersurl = f"https://jsonplaceholder.typicode.com/users?id={usr_id}"
        usr_resp = session.get(usersurl)
        usr_name = (usr_resp.json())[0].get('username', None)

        dictin = {usr_id: []}

        for task in todos_resp.json():
            task_status = task.get('completed', None)
            title = task.get('title', None)
            # print(f"{usr_id},{usr_name},{task_status},{title}")

            dictin[usr_id].append({
                "task": title,
                "completed": task_status,
                "username": usr_name
            })

        # print(dictin)
        with open(f"{usr_id}.json", 'w') as file:
            json.dump(dictin, file)


if __name__ == '__main__':
    save_to_json()
