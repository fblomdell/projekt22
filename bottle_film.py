# -*- coding: utf-8 -*-

from bottle import Bottle, run, route, template, url, view, static_file, request, response
from SfApi import getCities, getCinemas
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
    cinemaList = getCinemas(cityID)
    
    
    return template('index', url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList)

@route("/movies", method="post")
def cinema():
    
    allCities = getCities()
    cityID = request.forms.get('city')
    cinemaList = getCinemas(cityID)
    
    movieCity = request.forms.get('city')
    chosenCinemaID = request.forms.get('cinema')
    
    print movieCity, chosenCinemaID

    return template('index', url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList, chosenCinemaID=chosenCinemaID)
    
    
run(host="localhost", port=8080, debug=True)
