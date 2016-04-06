from bottle import Bottle, run, route, template, url, view, static_file, request, response
from sfapi import getCities
import json

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
    
    allCities = getCities()
    cityID = request.forms.get('city')
    print cityID
    return template('index', url=url, allCities=allCities, cityID=cityID)

run(host="localhost", port=8080, debug=True)


