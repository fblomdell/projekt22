import requests, json, datetime
# -*- coding: utf-8 -*-

def auth():
    #username = 'SFbioAPI'
    #password = 'bSF5PFHcR4Z3'
    #authorization = 'Basic U0ZiaW9BUEk6YlNGNVBGSGNSNFoz'

    #URL to connect & authorize to server
    url = 'https://mobilebackend.sfbio.se/configurations/5/config/MA/testdevice/false/mobileid/22FE711F-ACC5-47A7-AAB7-67C7146C55C7'
    
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

def getMovies(city):
    #return all movies based on city
    return makeCall('movies/%s/extended' %(city))

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
'''    
def getTicketInformation(detailUrl):

    return makeCall(detailUrl)
'''
#getCinemas('MA')

'''
    cityID = request.forms.get('city')
    #cinemas = getCinemas(cityID)
    print cityID
    return template('index', url=url, getCities=getCities)#, cinemas=cinemas)
'''
