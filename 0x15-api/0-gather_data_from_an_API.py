#!/usr/bin/python3
"""
consume dummy API and get useful data
in a specific format
ouput examlpe
Employee {name} is done with tasks({done}/{total}):
    task1_title
    task2_title
"""
import requests
from sys import argv


def mani_func():
    """ task 0 : consume API
    """
    # Make an API call  and store the response #
    if len(argv) > 1:
        id = argv[1]
        todosurl = f'https://jsonplaceholder.typicode.com/users/{id}/todos'
        todos_resp = requests.get(todosurl)
        total_tasks = len(todos_resp.json())
        done_tasks_contr = 0
        done_tasks = []
        for task in todos_resp.json():
            if task['completed'] is True:
                done_tasks_contr += 1
                done_tasks.append(task.get('title', None))

        usersurl = f'https://jsonplaceholder.typicode.com/users/{id}'
        usr_jsn_resp = requests.get(usersurl).json()
        usr_name = usr_jsn_resp.get('name', None)
        print("Employee {} is done with tasks({}/{}):".format(
            usr_name, done_tasks_contr, total_tasks
        ))
        for task in done_tasks:
            print(f"\t{task}")


if __name__ == '__main__':
    mani_func()
