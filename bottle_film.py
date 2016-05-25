# -*- coding: utf-8 -*-

from bottle import Bottle, run, route, template, url, view, static_file, request, response, error
from SfApi import getCities, getCinemas, getCinemaMovies, getMovieDetails, getMovies
import json
import datetime, time
from time import strftime

@route("/")
#@view("index")
def index():
    
    allCities = getCities()
    return template('start', url=url, allCities=allCities)

@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")

@error(404)
def error404(error):
    return 'Aint nothing to see here'

@route("/movies", method="post")
def cinema():
    allCities = getCities()
    cityID = request.forms.get('city')
    cinemaList = getCinemas(cityID)

    movieList = getMovies(cityID)
    
    chosenCinemaID = request.forms.get('cinema')
    
    if chosenCinemaID == None:
        return template('start', url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList, chosenCinemaID=chosenCinemaID)
    else:
        showList = getCinemaMovies(cityID, chosenCinemaID)           
        
        sortedList = sortFunc(movieList, showList)

    todaysDate = time.strftime('%Y%m%d')

    nowTime = time.strftime('%H%M')
    return template('index', nowTime=nowTime, url=url, allCities=allCities, cityID=cityID, cinemaList=cinemaList, chosenCinemaID=chosenCinemaID, sortedList=sortedList, date=todaysDate)


def sortFunc(movieList, showList):

    movieDict = {}
    moviesToday = {}
    idList = {}
    '''
    #create placeholder for movieinfo in moviesToday
    for movie in movieList['movies']:
        moviesToday[movie['id']] = []
    '''
    
    #add movieInfo from allmovies based on city
    for movie in movieList['movies']:
        idList[movie['id']] = [movie['id']]

        movieDict['id'] = movie['id']
        movieDict['parentId'] = movie['parentId']
        movieDict['movieName'] = movie['movieName']
        movieDict['genreName'] = movie['genreName']
        movieDict['formattedLength'] = movie['formattedLength']
        movieDict['shortDescription'] = movie['shortDescription']
        movieDict['age'] = movie['age']
        movieDict['mediumPoster'] = movie['mediumPoster']
        movieDict['highQualityTrailerLink'] = movie['highQualityTrailerLink']
        movieDict['actors'] = movie['actors']
        movieDict['directors'] = movie['directors']
        movieDict['shows'] = []

        moviesToday[movie['id']] = dict(movieDict)
        
        if len(movie['movieVersions']) != 0:
            for movieID in movie['movieVersions']:
                idList[movie['id']].append(movieID)

    oneShow={}
    
    #idList contains all version IDs based on shows today.
    for show in showList['shows']:
        for key, value in idList.iteritems():
            for movieID in value:
                    
                if str(movieID) == str(show['movieId']):
                    
                    oneShow['time'] = show['time']
                    oneShow['numberOfAvailableSeats'] = show['numberOfAvailableSeats']
                    oneShow['auditoriumsys99Code'] = show['auditoriumsys99Code']
                    oneShow['tags'] = show['tags']
                    oneShow['title'] = show['title']
                    oneShow['movieId'] = show['movieId']

                    #check if a show has passed
                    startTime = datetime.datetime.strptime((show['time']), '%H:%M')
                    timeNow = datetime.datetime.strptime((strftime("%H:%M")), '%H:%M')
                    showPassed = (startTime - timeNow)
                    
                    
                    
                        
                    #check if key is matching in IdList and moviesToday                 
                    for key1, value1 in moviesToday.items():
                        if str(key1) == str(key):
                            if str(showPassed)[:1] != '-':
                                
                                #for showKey in value1:
                                value1['shows'].append(dict(oneShow))
                            

    #remove movies that has no show today
    for key, value in moviesToday.items():
        if not value['shows']:
            del moviesToday[key]
    '''
    for k, v in moviesToday.iteritems():
        print k, v['movieName']
    '''
    
    return moviesToday

 
'''
Fixa upplösning för poster
'''
def upgrade_poster(imageURL):
    newURL = imageURL.replace("_WIDTH_", "900", 1)
    return newURL


@route("/movieInfo/", method="post")
def new_movie_window():
    movieId = request.forms.get('movieid')
    movieDetails = getMovieDetails(movieId)
    newPoster = upgrade_poster(movieDetails['placeHolderPosterURL'])
    return template('movie', url=url, movieInfo=movieDetails, image=newPoster)



run(host="localhost", port=8080, debug=True)
