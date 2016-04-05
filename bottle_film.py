
from bottle import Bottle, run, route, template, url, view, static_file, request, response

from SfApi import getCities
import requests
import json
import cgi

form = cgi.FieldStorage() # instantiate only once!

@route("/")
#@view("index")
def index():
    
    allCities = getCities()
    
    return template('index', url=url, allCities=allCities)

    


@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")

@route("/cinema", method="post")
def cinema():
    name = request.forms.get('city')
    print name

run(host="localhost", port=8080, debug=True)


