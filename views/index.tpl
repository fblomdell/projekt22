<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="{{ url('static', path='popuptest.js') }}"></script>
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap-theme.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='newstyle.css') }}">
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
                                <!--{{!cityID}}-->
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
                                <!--{{!cinemaList}}-->
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
        
        <!-- Behövs för att skicka filminfo till popup (måste finnas ett bättre sätt) -->
        
        <div class="container">
            
            <h2>BIOGRAF</h2>
            <hr>
            <!-- Denna div visar en rad med thumbnails. 4 videos kan få plats på en rad (går att ändra enkelt) -->
                    %try:
                        <!--{{!sortedList}}-->
                    %except NameError:
                        <!--pass-->
                    %else:
                        %movieIndex = 0
                        %for movieID, movie in sortedList.items():
                            %print len(sortedList.items())
                            %if movieIndex == len(sortedList.items()):
                                </div>
                            %end
        
                            %if movieIndex % 6 == 0:
                        <div class="row rowdiv">
                            <div class="col-sm-2 tablecelldiv">
                                    <div class="thumbnail movie" id="{{!movieID}}">
                                        
                                        <img src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{movieID}}.jpg" alt="{{!movie['movieName']}}" />
                                        
                                    </div>
                                <div class="showBox">
                                        %for show in movie['shows']:
                                            
                                            <p>{{show['time']}} - 
                                                {{show['numberOfAvailableSeats']}}
                                                %for tag in show['tags']:
                                                    %if tag:
                                                        %if tag['tagName'] == "3D":
                                                        <abbr title="3D">
                                                        <span class="glyphicon glyphicon-sunglasses" title="3D"></span></abbr>
                                                        %elif tag['tagName'] == "sv":
                                                        <abbr title="Svensk tal">SV</abbr>
                                                        %elif tag['tagName'] == "Subtitled":
                                                        <span class="glyphicon glyphicon-text-background" title="Textad"></span>
                                                        %end
                                                    %end
                                                %end
                                                %formattedTime = show['time'].replace(":", "")
                                                <a href="http://www.sf.se/biljetter/bokningsflodet/valj-antal-biljetter/?Auditorium={{show['auditoriumsys99Code']}}&Date={{date}}&Time={{formattedTime}}&City={{cityID}}"><button style="float: right; color: black;">Boka</button></a></p>
                                        %end
                                        </div>
                            </div>
                    %elif movieIndex % 6 != 5:
                        <div class="col-sm-2 tablecelldiv">
                                    <div class="thumbnail movie" id="{{!movieID}}">
                                        
                                        <img src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{movieID}}.jpg" alt="{{!movie['movieName']}}" />
                                        
                                    </div>
                                <div class="showBox">
                                        %for show in movie['shows']:
                                            
                                            <p>{{show['time']}} - 
                                                {{show['numberOfAvailableSeats']}}
                                                %for tag in show['tags']:
                                                    %if tag:
                                                        %if tag['tagName'] == "3D":
                                                        <abbr title="3D">
                                                        <span class="glyphicon glyphicon-sunglasses" title="3D"></span></abbr>
                                                        %elif tag['tagName'] == "sv":
                                                        <abbr title="Svensk tal">SV</abbr>
                                                        %elif tag['tagName'] == "Subtitled":
                                                        <span class="glyphicon glyphicon-text-background" title="Textad"></span>
                                                        %end
                                                    %end
                                                %end
                                                %formattedTime = show['time'].replace(":", "")
                                                <a href="http://www.sf.se/biljetter/bokningsflodet/valj-antal-biljetter/?Auditorium={{show['auditoriumsys99Code']}}&Date={{date}}&Time={{formattedTime}}&City={{cityID}}"><button style="float: right; color: black;">Boka</button></a></p>
                                        %end
                                        </div>
                            </div>
                    %else:
                            <div class="col-sm-2 tablecelldiv">
                                    <div class="thumbnail movie" id="{{!movieID}}">
                                        
                                        <img src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{movieID}}.jpg" alt="{{!movie['movieName']}}" />
                                        
                                    </div>
                                <div class="showBox">
                                        %for show in movie['shows']:
                                            
                                            <p>{{show['time']}} - 
                                                {{show['numberOfAvailableSeats']}}
                                                %for tag in show['tags']:
                                                    %if tag:
                                                        %if tag['tagName'] == "3D":
                                                        <abbr title="3D">
                                                        <span class="glyphicon glyphicon-sunglasses" title="3D"></span></abbr>
                                                        %elif tag['tagName'] == "sv":
                                                        <abbr title="Svensk tal">SV</abbr>
                                                        %elif tag['tagName'] == "Subtitled":
                                                        <span class="glyphicon glyphicon-text-background" title="Textad"></span>
                                                        %end
                                                    %end
                                                %end
                                                %formattedTime = show['time'].replace(":", "")
                                                <a href="http://www.sf.se/biljetter/bokningsflodet/valj-antal-biljetter/?Auditorium={{show['auditoriumsys99Code']}}&Date={{date}}&Time={{formattedTime}}&City={{cityID}}"><button style="float: right; color: black;">Boka</button></a></p>
                                        %end
                                        </div>
                            </div>
                        </div>
                    %end
                    %movieIndex = movieIndex + 1
            
                    %end
                        %end
                    %end
                    
                    <!-- Här börjar popup-fönstret -->
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                        <div class="modal-dialog modal-lg" id="movieInfoModal">
                            <div class="modal-content" style="background-color: black; color: white; box-shadow: 0 0px 50px rgba(255, 0, 0, 0.5)">
                                <div class="row">
                <div class="col-lg-12" id="posterOverlay" style="">
                </div>
                <h1 id="posterTitle">Titel</h1>
                        </div>
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="embed-responsive embed-responsive-16by9 trailerEmbed">
                                    <video class="embed-responsive-item" controls poster="https://sites.psu.edu/connorzimmerman/wp-content/uploads/sites/4939/2014/01/movie-reel.png">
                                        <source src="">
                                    </video>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <h2 id="genreAge">Genre, ålder</h2>
                                <span style="float:left; width: 50%; height: 100px; overflow-y: scroll;">
                                    <h3 style="margin-top: 0px;">Skådespelare</h3>
                                    <p id="actors">
                                        Actors
                                    </p>
                                </span>
                                <span style="float:right;text-align:right; width: 50%; height: 100px;">
                                    <h3 style="margin-top: 0px;">Regissör</h3>
                                    <p id="directors">
                                        Regissör
                                    </p>
                                </span>
                                <span style="clear:both;border-top: 1px solid #000;">
                                <p id="desc"></p></span>
                            </div>
                            <div class="col-lg-12" style="border-top: 1px solid #999;">
                                <div class="rows">
                                    <h4>Filmstaden</h4>
                                    <div class="col-xs-3 movieShowDetails">
                                        <h3>21:00</h3>
                                        <h4>3D, Textad</h4>
                                        <button type="button" class="btn btn-danger btn-primary" style="width: 100%;">Boka</button>
                                    </div>
                                    <div class="col-xs-3 movieShowDetails">
                                        <h3>22:00</h3>
                                        <h4>3D, Textad</h4>
                                        <button type="button" class="btn btn-danger btn-primary" style="width: 100%;">Boka</button>
                                    </div>
                                    <div class="col-xs-3 movieShowDetails">
                                        <h3>23:00</h3>
                                        <h4>3D</h4>
                                        <button type="button" class="btn btn-danger btn-primary" style="width: 100%;">Boka</button>
                                    </div>
                                    <div class="col-xs-3 movieShowDetails">
                                        <h3>23:55</h3>
                                        <h4>Textad</h4>
                                        <button type="button" class="btn btn-danger btn-primary" style="width: 100%;">Boka</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </div>
                        </div>
                        </div>
</div>
        </div>                  
        
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>