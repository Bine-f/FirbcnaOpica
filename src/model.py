import os
import json
import re
path_to_json = os.path.join(os.getcwd(),'..', "database", "data.json")

def read_json():
    with open(path_to_json, "r") as json_file:
        data = json.load(json_file)
        return data

def write_json(data):
    with  open(path_to_json, "w") as outfile:
        json.dump(data, outfile, indent=4)

def check_grammar(word):
    if re.match("^[A-Za-z0-9_-]*$", word):
        return True
    return False

def check_login(username, password):
    if check_grammar(username) and check_grammar(password):
        data = read_json()
        for user in data["users"]:
            if user["username"] == username and user["password"] == password:
                return True
    return False

def username_available(name, password):
    if not( check_grammar(name) and check_grammar(password)):
        return False
    data = read_json()
    for user in data["users"]:
        if user["username"] == name:
            return False
    return True

def add_account(username, password):
    data = read_json()
    data_to_add = {"username": username, "password" : password}
    data["users"].append(data_to_add)
    write_json(data)
    
def add_title(user,title):
    data = read_json()
    data[f"{user}_{title}"] = {"owner": user,"title": title, "likes" : 0, "question": "", "dislikes" : 0, "answers" : [], "options":dict() }
    write_json(data)

def add_question(user,title,question):    
    data = read_json()
    data[f"{user}_{title}"]["question"] = question
    write_json(data)

def add_option(user, title, option):
    data = read_json()    
    data[f"{user}_{title}"]["options"][option] = 0
    write_json(data)

def add_answer(name, answer):
    data = read_json()
    data[name]["answers"].append(answer)
    write_json(data)

    
def find_question(user, title):
    data = read_json()
    return data[f"{user}_{title}"]["question"]

def list_of_titles():
    data = read_json()
    l = []
    for element in data:        
        if type(data[element]) == list: 
            continue
        else:
            l.append(data[element]["title"])
    return l
def list_of_sets():
    data = read_json()
    l = []
    for element in data:        
        if type(data[element]) == list: 
            continue
        else:
            l.append(data[element])
    return l

def find_set(name):
    data = read_json()
    return data[name]   

def find_name(s):
    return s["owner"]+"_"+s["title"]

def list_of_names():
    data = read_json()
    l = []
    for element in data:        
        if type(data[element]) == list: 
            continue
        else:
            l.append(name(data[element]))
    return l

def choose_option(name, number):
    data = read_json()
    option = list_of_options(find_set(name))[number]
    data[name]["options"][option] += 1
    write_json(data)

def brez_presledkov(niz):
    for i in niz:
        if i == " ":
            return False
    return True

def remove_option(name, number):
    data = read_json()
    option = list_of_options(find_set(name))[number]
    del data[name]["options"][option]
    write_json(data)

def list_of_options(s):
    l=[]
    for option in s["options"]:
        l.append(option)
    return l