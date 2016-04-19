# -*- coding: utf-8 -*-

from bottle import Bottle, run, route, template, url, view, static_file, request, response
from SfApi import getCities, getCinemas, getCinemaMovies, getMovieDetails
import json

@route("/")
#@view("index")
def index():
    
    allCities = getCities()
    return template('index', url=url, allCities=allCities)

@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")

@route("/movies", method="post")
def cinema():
    
    allCities = getCities()
    cityID = request.forms.get('city')
    cinemaList = getCinemas(cityID)
    
    chosenCinemaID = request.forms.get('cinema')

    if chosenCinemaID == None:
        return template('index', url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList, chosenCinemaID=chosenCinemaID)
    else:
        movieList = getCinemaMovies(cityID, chosenCinemaID)
        print len(movieList['shows'])
        return template('index', url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList, chosenCinemaID=chosenCinemaID, movieList=movieList)

'''
Fixa upplösning för poster
'''
def upgrade_poster(imageURL):
    newURL = imageURL.replace("75", "500", 1)
    return newURL


@route("/movieInfo/", method="post")
def new_movie_window():
    movieId = request.forms.get('movieid')
    movieDetails = getMovieDetails(movieId)
    newPoster = upgrade_poster(movieDetails['mediumPoster'])
    return template('movie', url=url, movieInfo=movieDetails, image=newPoster)

run(host="localhost", port=8080, debug=True)
