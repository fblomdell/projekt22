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

    name = form.getfirst('name', 'empty')
    print name


@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")
    

run(host="localhost", port=8080, debug=True)


