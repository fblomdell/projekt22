from bottle import Bottle, run, route, template, url, view, static_file, request, response
from SfApi import getCities
import json

@route("/")
#@view("index")
def index():
    
    allCities = getCities()
    
    return template('index', url=url, allCities=allCities)

@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")

@route("/", method="post")
def cinema():
    
    allCities = getCities()
    getCityId = request.forms.get('city')
    print getCityId
    return template('index', url=url, allCities=allCities, getCityId=getCityId)

run(host="localhost", port=8080, debug=True)


