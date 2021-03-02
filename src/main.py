import bottle
import os
from bottle import get, post, request
from model import *

bottle.TEMPLATE_PATH.insert(0, os.path.join(os.getcwd(), "views"))

app = bottle.default_app()
bottle.BaseTemplate.defaults['get_url'] = app.get_url

@bottle.route('/database/<filename:path>', name='database')
def serve_static(filename):
    return bottle.static_file(filename, root= os.path.join(os.getcwd(),'..', "database"))

@get('/')
def main_page():
    if request.get_cookie('account'):
       user = request.get_cookie('account')
       bottle.redirect("/forum")
    else:
        user = "Guest"
    return bottle.template("login.tpl", name = user)

@post('/')
def main_page_action():
    if request.forms.get("login"):
        bottle.redirect('/login')
    if request.forms.get("forum"):
        bottle.redirect('/forum')

@get('/login')
def login():
    return bottle.template("login.tpl", name = request.get_cookie('account'))

@post('/login')
def do_login():
    if request.forms.get("username") and request.forms.get("password"):
        username = request.forms.get("username")
        password = request.forms.get("password")
        if check_login(username, password):
            bottle.response.set_cookie("account", username)
            print("Your login information was correct.")
            bottle.redirect('/')
        else:
            return bottle.template("failed_login.tpl", msg = "Your username or password is incorrect.")

    elif request.forms.get("new_username") and request.forms.get("new_password"):  
        new_username = request.forms.get("new_username")
        password = request.forms.get("new_password")
        if username_available(new_username, password):
            bottle.response.set_cookie("account", new_username)
            add_account(new_username, password)
            bottle.redirect('/')
        else:
            return bottle.template("failed_login.tpl", msg = f"Username or password not available.")

@get('/forum')
def forum():
    if request.get_cookie('account'):
        user = request.get_cookie('account')
        return bottle.template("forum.tpl", sets = list_of_sets(), user = user)
    return bottle.redirect("/login")

@post('/forum')
def forum_action():
    sets = list_of_sets()
    if not request.get_cookie('account'):
        bottle.redirect('/login')
    user = request.get_cookie('account')
    if request.forms.get("add_title"):
        title = request.forms.get("add_title")
        add_title(user, title)
        bottle.response.set_cookie("title", title)
        bottle.response.set_cookie("number", str(len(list_of_titles())-1))        
        bottle.redirect("/editor")
    if request.forms.get("login"):
        bottle.redirect('/login')
    for i in range(len(sets)):
        if request.forms.get(str(i)):                       
            bottle.response.set_cookie("number", str(i))
            if list_of_sets()[i]["owner"] == user:
                bottle.response.set_cookie("title", list_of_titles()[i])
                bottle.redirect("/editor")
            else:
                bottle.redirect("/answer")

@get('/editor')
def editor():
    if request.get_cookie('account'):    
        user = request.get_cookie('account')
    if request.get_cookie('number'):
        s = list_of_sets()[int(request.get_cookie("number"))]

        return bottle.template("editor.tpl", s = s, options=list_of_options(s))
    return bottle.redirect("/login")

@post('/editor')
def editor_action():
    if not request.get_cookie('account'):
        bottle.redirect('/login')
    if not request.get_cookie('number'):
        bottle.redirect('/forum')
    user = request.get_cookie('account')
    n = int(request.get_cookie("number"))   
    s = list_of_sets()[n]
    title = s["title"]

    if request.forms.get("question"):
        question = request.forms.get("question")
        add_question(user, title, question)
        bottle.redirect("/editor")
    if request.forms.get("add_option"):
        option = request.forms.get("add_option")
        add_option(user, title, option)
        bottle.redirect("/editor")
    if request.forms.get("forum"):
        bottle.redirect('/forum')
    if request.forms.get("login"):
        bottle.redirect('/login')
    for number in range(len(list_of_options(s))):
        if request.forms.get(str(number)):
            remove_option(find_name(s), number)
            bottle.redirect("/editor")

@get('/answer')
def answer():
    if request.get_cookie('account'):    
        user = request.get_cookie('account')
    if request.get_cookie('number'):
        n = int(request.get_cookie("number"))
        name = find_name(list_of_sets()[n])
        s = find_set(name)
        return bottle.template("answer.tpl", s = s, options=list_of_options(s))
    return bottle.redirect("/login")

@post('/answer')
def answer_action():
    
    if not request.get_cookie('account'):
        bottle.redirect('/login')
    if not request.get_cookie('title'):
        bottle.redirect('/forum')
    user = request.get_cookie('account')
    n = int(request.get_cookie("number"))
    name = find_name(list_of_sets()[n])
    s = find_set(name)
    if request.forms.get("add_answer"):
        answer = request.forms.get("add_answer")
        add_answer(name, answer)
        bottle.redirect("/answer")
    for number in range(len(list_of_options(s))):
        if request.forms.get(str(number)):
            choose_option(name,number)
            bottle.redirect("/answer")
    if request.forms.get("forum"):
        bottle.redirect('/forum')



bottle.run(host='localhost', port=8080, debug=True, reloader = True)