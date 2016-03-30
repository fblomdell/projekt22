import requests, json
# -*- coding: utf-8 -*-



def dummyMenu():

    print'**********************'
    choice = raw_input('Menu:\n 1. All movies \n 2. specific movie(req ID)\n')
    print'**********************'
    
    if choice == str(1):
        cityID = 'MA' #MA = Malmö, BS = Borås osv
        allMovies(cityID)
        #print data
    elif choice == str(2):
        movieID = raw_input('enter movieID (ex. 10015019):')
        movieDetails(movieID)
        
    else:
        print'Invalid choice, enter #1-3 ONLY!'
        dummyMenu()

def auth():
    #username = 'SFbioAPI'
    #password = 'bSF5PFHcR4Z3'
    #authorization = 'Basic U0ZiaW9BUEk6YlNGNVBGSGNSNFoz'

    #URL to connect & authorize to server
    url = 'https://mobilebackend.sfbio.se/configurations/5/config/MA/testdevice/false/mobileid/22FE711F-ACC5-47A7-AAB7-67C7146C55C7'

    headers = {
    'X-SF-Iphone-Version': '5.3.0',
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

    #data = json.loads(response.text)
    
    #print data['movieName']#['movies'][0]['shortDescription']
    #return response.status_code
 

def makeCall(urlPath):
    
    auth()
    
    #baseurl + urlPath = complete url to server
    baseUrl = 'https://mobilebackend.sfbio.se/services/5/'

    headers = {
    'X-SF-Iphone-Version': '5.3.0',
    'User-Agent': 'SFBio/5.3.0 (iPhone; iOS 9.2.1; Scale/2.00)',
    'Authorization': 'Basic U0ZiaW9BUEk6YlNGNVBGSGNSNFoz'
    }

    try:
        response = requests.get(baseUrl+urlPath, headers=headers)
    except:
        auth()
        response = requests.get(baseUrl+urlPath, headers=headers)
    
    data = json.loads(response.text)

    return data
    #print 'moviename: ' +data['movieName']#['movies'][0]['shortDescription']
    #return response.status_code

def allMovies(city):
    
    data = makeCall('movies/%s/extended' %(city))

    movieList = []
    for movie in data['movies']:
        #print movie['movieName']
        movieList.append(movie["movieName"]+' id: ' +movie['id'])

    #data['movieInfoURL'] = direktlänk till json för specifik film

    #loop list & print for easy read in console
    for i in movieList:
        print i

    print 'antal filmer: ' +str(len(movieList))
    #print movieList
    dummyMenu()

def movieDetails(movieID):

    #MA = Malmö
    data = makeCall('movies/MA/movieid/'+movieID)

    print 'id: ' +str(data['id'])
    print 'movieName: ' +data['movieName']
    print 'genre: '+data['genreName']
    print 'length: ' +str(data['formattedLength'])
    print 'age: ' +data['age']
    print 'short description: ' +data['shortDescription']

    #prints unformatted json
    #print data
    dummyMenu()


dummyMenu()

#auth()
#makeCall('movies/MA/movieid/10015019')

