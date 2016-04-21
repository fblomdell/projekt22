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
                        %movieIdList = []
                        %movieTitleList = []
                        %for movie in movieList['shows']:
                                <!-- Sparar varje film i en lista och jämför med nästa film, sen nollställs listan och en ny film sparas och jämför med nästa, plockar bort duplikater -->
                                %for checkMovie in movieIdList:
                                    %if not movie['movieId'] == checkMovie:
                                        <div class="col-sm-3">
                                            <div class="thumbnail movie"data-toggle="modal" data-target="#modalLabel" id="{{!movie['movieId']}}" onclick="submitMoviePost({{!movie['movieId']}})">

                                                <div class="hovereffect">
                                                    <image src="https://mobilebackend.sfbio.se/image/POSTER/150/-/{{!movie['movieId']}}.jpg" alt="{{!movie['title']}}">
                                                    <div class="overlay">
                                                        <h4>{{!movie['title']}}</h4>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    %end
                                %end
                                %movieIdList = []
                                %movieIdList.append(movie['movieId'])
                                
                        %end
                    %end
            </div>
        </div>
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>