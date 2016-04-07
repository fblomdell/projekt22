# -*- coding: utf-8 -*-

from bottle import Bottle, run, route, template, url, view, static_file, request, response
from SfApi import getCities, getCinemas
import json

@route("/")
#@view("index")
def fuckoff():
    
    allCities = getCities()
    print allCities
    return template('fuckoff', url=url, allCities=allCities)

@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")

@route("/cinema", method="post")
def cinema():
    
    allCities = getCities()
    cityID = request.forms.get('city')
    cinemaList = getCinemas(cityID)
    
    
    print cinemaList
    
    return template('fuckoff', url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList)

'''%route("/getCinema", method="post")
def getCinema():

    allCities = getCities()
    cityID = request.forms.get('city')
    
    return template('index', url=url, allCities=allCities, cityID=cityID)
'''
run(host="localhost", port=8080, debug=True)


