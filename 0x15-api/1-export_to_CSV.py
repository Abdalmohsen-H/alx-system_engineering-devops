#!/usr/bin/python3
"""
consume dummy API and get useful data
in a specific format
ouput is csv , record examlpe
"USER_ID","USERNAME","TASK_COMPLETED_STATUS","TASK_TITLE"
"""
import requests
from sys import argv


def csv_func():
    """ task 0 : consume API
    """
    # Make an API call  and store the response #
    if len(argv) > 1:
        id = argv[1]
        todosurl = f'https://jsonplaceholder.typicode.com/users/{id}/todos'
        todos_resp = requests.get(todosurl)

        usersurl = f'https://jsonplaceholder.typicode.com/users/{id}'
        usr_jsn_resp = requests.get(usersurl).json()
        usr_name = usr_jsn_resp.get('username', None)

        with open(f"{id}.csv", 'w') as file:
            for task in todos_resp.json():
                user_id = id
                task_status = task.get('completed', None)
                title = task.get('title', None)
                # print(f"{user_id},{usr_name},{task_status},{title}")
                file.write(
                    f'"{user_id}","{usr_name}","{task_status}","{title}"\n')


if __name__ == '__main__':
    csv_func()
