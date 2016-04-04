from bottle import Bottle, run, route, template, url, view, static_file
from SfApi import getCities
import json

@route("/")
#@view("index")
def index():
    
    allCities = getCities()
    cityList = []
    #allCities = json.dumps(allCities)

    
    #for city in allCities['cities']:
 #       cityList.append(city['name'])
    
    return template('index', url=url, allCities=allCities)
    #return { "url": url }

@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")
    
run(host="localhost", port=8080, debug=True)
