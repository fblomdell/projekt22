<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="{{ url('static', path='popuptest.js') }}"></script>
        
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='newstyle.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap-theme.css') }}">
        <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
        
        <title>FilmDags</title>
       
    </head>
    <header>
        <h1>FILMDAGS</h1>
       
        <!-- Låda med dropdown-menyerna stad och biograf -->
            <div class="well cityCinemaBox">
                <form action="/movies" method="post">
                    <div class="form-group col-md-6">
                        <select class="form-control" onchange="this.form.submit()" name="city">
                            <option value="" disabled selected>Stad</option>
                            %try:
                                {{!cityID}}
                            %except NameError:
                                %for city in allCities['cities']:
                                    <option value="{{city['id']}}">{{city['name']}}</option>
                                %end
                            %else:
                                <!-- Listar alla städer som finns och sätter select på den stad som användaren väljer -->
                                %for city in allCities['cities']:
                                    %if cityID == city['id']:
                                        <option value="{{city['id']}}" selected>{{city['name']}}</option>

                                    %else:
                                        <option value="{{city['id']}}">{{city['name']}}</option> 
                                    %end
                                %end
                            %end
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <select class="form-control" name="cinema" onchange="this.form.submit()">
                            <option disabled selected>Biograf</option>
                            %try:
                                {{!cinemaList}}
                            %except NameError:
                                pass
                            %else:
                                <!-- Listar alla biografer som finns i den vada staden och sätter select på den biograf som användaren väljer -->
                                %for cinema in cinemaList['theatres']:
                                    %if str(chosenCinemaID) == str(cinema['id']):
                                        <option value="{{cinema['id']}}" selected>{{cinema['name']}}</option>
                                    %else:
                                        <option value="{{cinema['id']}}">{{cinema['name']}}</option>
                                    %end
                                %end
                            %end
                        </select>
                    </div>
                </form>
               
            </div>
    </header>
    <body>
        
        <div class="container">
            
            <h2>BIOGRAF</h2>
            <hr>
            <!-- Denna div visar en rad med thumbnails. 4 videos kan få plats på en rad (går att ändra enkelt) -->
            <div class="row">
                
                    %try:
                        <!--{{!movieList}}-->
                    %except NameError:
                        <!--pass-->
                    %else:
                        <!-- Presenterar de filmer som går på den valda biografen -->
                        %for movie in movieList['movies']:
                            %for movieID in sortedList:
                                %if str(movieID) == str(movie['id']):
                                    <div class="col-sm-3" onclick="loadPopup({{movie['id']}})">
                                            <div class="thumbnail movie" id="{{!movie['id']}}">

                                                
                                                    <img class="poster" src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{!movie['id']}}.jpg" alt="{{!movie['movieName']}}">
                                                    <div class="overlay">
                                                        
                                                        
                                                    </div>
                                                          
                                                </div>
                                          
                                            </div>
                                    
                                %end
                           %end     
                        %end
                    %end
            </div>
                               
        </div>
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>