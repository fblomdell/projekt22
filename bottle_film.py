from bottle import Bottle, run, route, template, url, view, static_file
from SfApi import getCities, allMovies
from flask import json

@route("/")
#@view("index")
def index():
     
    allCities = getCities()
    getMovies = allMovies('MA')
    #print allMovies[1][1]
    '''
    cityList = []
    #allCities = json.dumps(allCities)
    for city in allCities['cities']:
        cityList.append(city['name'])
    '''     
         
    #print allCities['cities']
    return template('index', url=url, allCities=json.dumps(allCities), getMovies = json.dumps(getMovies))
    #return { "url": url }
 
@route("/static/:path#.+#", name="static")
def server_static(path):
 
    return static_file(path, root="static")
     
run(host="localhost", port=8080, debug=True)
