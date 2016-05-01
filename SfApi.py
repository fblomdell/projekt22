import requests, json, datetime, time
# -*- coding: utf-8 -*-

def auth():
    #username = 'SFbioAPI'
    #password = 'bSF5PFHcR4Z3'
    #authorization = 'Basic U0ZiaW9BUEk6YlNGNVBGSGNSNFoz'

    #URL to connect & authorize to server
    url = 'https://mobilebackend.sfbio.se/configurations/5/config/MA/testdevice/false/mobileid/11FE711F-ACC5-47A7-AAB7-67C7146C55C7'
    
    headers = {
    'X-SF-Iphone-Version': '5.4.0',
    'User-Agent': 'SFBio/5.3.0 (iPhone; iOS 9.2.1; Scale/2.00)',
    'Authorization': 'Basic U0ZiaW9BUEk6YlNGNVBGSGNSNFoz'
    }
    
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        print "Connected to SF"
        print 'response code: ' +str(response.status_code)
        
    else:
        print 'Problem connecting to server'
        print 'response code: ' +str(response.status_code) 

def makeCall(urlPath):
    #baseurl + urlPath = complete url to server
    baseUrl = 'https://mobilebackend.sfbio.se/services/5/'
    print baseUrl+urlPath
    headers = {
    'X-SF-Iphone-Version': '5.4.0',
    'User-Agent': 'SFBio/5.3.0 (iPhone; iOS 9.2.1; Scale/2.00)',
    'Authorization': 'Basic U0ZiaW9BUEk6YlNGNVBGSGNSNFoz'
    }
    
    try:
        response = requests.get(baseUrl+urlPath, headers=headers)
    except:
        auth()
        response = requests.get(baseUrl+urlPath, headers=headers)
        
    return json.loads(response.text)

def getCinemaMovies(cityID, cinemaID):
 
    #todays date, format: YYYYMMDD (ex 20160411)
    date = time.strftime('%Y%m%d')  
    return makeCall('shows/%s/theatreid/%s/day/%s' %(cityID, cinemaID, date)) 

def getMovies(city):
    #return all movies based on city
    #print makeCall('movies/%s/extended' %(city))
    return makeCall('movies/%s/extended' %(city))
    #print makeCall(movieList['movies'][0]['showListURL'])

def getMovieDetails(movieID):
    return makeCall('movies/MA/movieid/'+movieID)

def getCities():
    return makeCall('cities')

def getCinemas(cityID):
    return makeCall('theatres/%s' %(cityID))

def getTicketsOfMovie(cityId, movieId, date):
    #all info om biografen, lediga platser, showdeatilurl, theatreID, visningstid, längd på film, titel osv
    return makeCall('shows/%s/movieid/%s/day/%s'%(cityId, movieId, date)) #('MA','10015019','20160331'))


    #OBS OBS OBS!!!!!! uncomment to get price information:
    #detailUrl = movieTicket['shows'][0]['showDetailURL']
    #getTicketInformation(detailUrl)


#kod för sortering:
def sortLists():
    showList = getCinemaMovies('MA', '109')
    movieList = getMovies('MA')
    
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
        movieDIct['highQualityTrailerLink'] = movie['highQualityTrailerLink']
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
                    
                    for key1, value1 in moviesToday.items():
                        if str(key1) == str(key):
                            #for showKey in value1:
                            value1['shows'].append(dict(oneShow))
                            

    #remove movies that has no show today
    for key, value in moviesToday.items():
        if not value['shows']:
            del moviesToday[key]

    #sorted(moviesToday, key=lambda x : (moviesToday[x]['shows']['time']))
    '''
    for k, v in moviesToday.iteritems():
        print k, v['shows']
    '''
    
    return moviesToday
    




