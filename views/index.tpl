<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="{{ url('static', path='popuptest.js') }}"></script>
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap-theme.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='newstyle.css') }}?v=1.1">
        <link rel="stylesheet" href="{{ url('static', path='whhg.css') }}">
        <link rel="stylesheet" href="{{ url('static', path='spinner.css') }}">
        <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <title>FilmDags</title>
       
    </head>
    <header>
        
        <h1>FILMDAGS</h1>
       %firstVisit = True
        <!-- Låda med dropdown-menyerna stad och biograf -->
            <div class="well cityCinemaBox">
                <form action="/movies" method="post">
                    <div class="form-group col-md-6">
                        <select class="form-control" onchange="this.form.submit(); $('.sk-circle').show()" name="city">
                            <option value="" disabled selected>1. Välj stad</option>
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
                                        %chosenCity = city
                                        %firstVisit = False
                                    %else:
                                        <option value="{{city['id']}}">{{city['name']}}</option> 
                                    %end
                                %end
                            %end
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                            %try:
                                <!--{{!cinemaList}}-->
                            %except NameError:
                                <select class="form-control" name="cinema" onchange="this.form.submit()" disabled>
                                    <option disabled selected>2. Välj biograf</option>
                            %else:
                                <!-- Listar alla biografer som finns i den vada staden och sätter select på den biograf som användaren väljer -->
                                <select class="form-control" name="cinema" onchange="this.form.submit(); $('.sk-circle').show()">
                                    <option disabled selected>Välj biograf</option>
                                %for cinema in cinemaList['theatres']:
                                    %if str(chosenCinemaID) == str(cinema['id']):
                                        <option value="{{cinema['id']}}" selected>{{cinema['name']}}</option>
                                        %chosenCinema = cinema
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
            %try:
                <h2>Visningar idag, {{chosenCity['name']}} <span class="glyphicon glyphicon-menu-right" style="color: #fff; font-size: 18px;"></span> {{chosenCinema['name']}}</h2>
                
            %except NameError:
                
            %end
                
            <hr>
            %if firstVisit == True:
                <div id="frontpage_text">
                    
               Boka biljetter snabbt och enkelt till dagens visningar hos SF. 
<p>Testa själv! Börja med att välja stad, följt av biograf.</p>
                </div>
                %end
                
                    <div class="sk-circle" style="display: none;">
        <div class="sk-circle1 sk-child"></div>
        <div class="sk-circle2 sk-child"></div>
        <div class="sk-circle3 sk-child"></div>
        <div class="sk-circle4 sk-child"></div>
        <div class="sk-circle5 sk-child"></div>
        <div class="sk-circle6 sk-child"></div>
        <div class="sk-circle7 sk-child"></div>
        <div class="sk-circle8 sk-child"></div>
        <div class="sk-circle9 sk-child"></div>
        <div class="sk-circle10 sk-child"></div>
        <div class="sk-circle11 sk-child"></div>
        <div class="sk-circle12 sk-child"></div>
      </div>
            <!-- Denna div visar en rad med thumbnails. 4 videos kan få plats på en rad (går att ändra enkelt) -->
                    %import json
                    %try:
                        <!--{{!sortedList}}-->
                    %except NameError:
                        <!--pass-->
                    %else:
                        %movieIndex = 0
                        %for movieID, movie in sortedList.items():
                            %print len(sortedList.items())
                            %if movieIndex == len(sortedList.items()) and movieIndex % 6 != 5:
                                </div>
                            %end
                            %movieText = json.dumps(movie)
                            %movieText = movieText.replace("'", "\u0027")
                            %if movieIndex % 6 == 0:
                                <!-- Start row -->
                                <div class="row rowdiv">
                                    <div class="col-sm-2 tablecelldiv">
                                            <div class="thumbnail movie" id="{{!movieID}}" data-toggle="modal" data-target=".bs-example-modal-lg" onclick='populateModal({{!movieText}})'>

                                                <img src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{movieID}}.jpg" alt="{{!movie['movieName']}}">

                                            </div>
                                        <div class="showBox">
                                                %for show in movie['shows']:
                                                %formattedTime = show['time'].replace(":", "")
                                                
                                                    <div class="showDetails">
                                                        <div class="timeCol showCol">
                                                            <p>{{show['time']}}</p>
                                                        </div>
                                                        <div class="seatCol showCol" style="top: -2px;">
                                                            <p><abbr title="{{show['numberOfAvailableSeats']}} lediga platser"><i class="icon-chair"> </i>{{show['numberOfAvailableSeats']}}</abbr></p>
                                                        </div>
                                                        <div class="tagCol showCol">
                                                            %for tag in show['tags']:
                                                                %if tag:
                                                                    %if tag['tagName'] == "3D":
                                                        <abbr title="3D">3D</abbr>
                                                                    %elif tag['tagName'] == "sv":
                                                        <abbr title="Svensk tal">SV</abbr>
                                                                    %elif tag['tagName'] == "IMAX 3D":
                                                                    <abbr title="IMAX 3D"><span class="glyphicon glyphicon-sunglasses" style="color: #00aacc;"></span></abbr>
                                                                    %elif tag['tagName'] == "Dolby Atmos":
                                                                    <abbr title="Dolby Atmos"><span class="glyphicon glyphicon-sound-dolby"></span></abbr>
                                                                    %elif tag['tagName'] == "TrolleyShow":
                                                                    <abbr title="Barnvagnsbio"><i class="icon-stroller"></i></abbr>
                                                                    %end
                                                                %end
                                                            %end
                                                        </div>
                                                        <a href="http://www.sf.se/biljetter/bokningsflodet/valj-antal-biljetter/?Auditorium={{show['auditoriumsys99Code']}}&Date={{date}}&Time={{formattedTime}}&City={{cityID}}">
                                                            <div class="bookCol showCol">
                                                                <button type="button">Boka</button>
                                                            </div>
                                                        </a>
                                                    </div>
                                                %end
                                        </div>
                                    </div>
                                %elif movieIndex % 6 != 5:
                                    <div class="col-sm-2 tablecelldiv">
                                                <div class="thumbnail movie" id="{{!movieID}}" data-toggle="modal" data-target=".bs-example-modal-lg" onclick='populateModal({{!movieText}})'>

                                                    <img src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{movieID}}.jpg" alt="{{!movie['movieName']}}" />

                                                </div>
                                            <div class="showBox">
                                                %for show in movie['shows']:
                                                %formattedTime = show['time'].replace(":", "")
                                                    <div class="showDetails">
                                                        <div class="timeCol showCol">
                                                            <p>{{show['time']}}</p>
                                                        </div>
                                                        <div class="seatCol showCol" style="top: -2px;">
                                                            <p><abbr title="{{show['numberOfAvailableSeats']}} lediga platser"><i class="icon-chair"> </i>{{show['numberOfAvailableSeats']}}</abbr></p>
                                                        </div>
                                                        <div class="tagCol showCol">
                                                            %for tag in show['tags']:
                                                                %if tag:
                                                                    %if tag['tagName'] == "3D":
                                                            <abbr title="3D">3D</abbr> 
                                                                    %elif tag['tagName'] == "sv":
                                                        <abbr title="Svensk tal">SV</abbr>
                                                                    %elif tag['tagName'] == "IMAX 3D":
                                                                    <abbr title="IMAX 3D"><span class="glyphicon glyphicon-sunglasses" style="color: #00aacc;"></span></abbr>
                                                                    %elif tag['tagName'] == "Dolby Atmos":
                                                                    <abbr title="Dolby Atmos"><span class="glyphicon glyphicon-sound-dolby"></span></abbr>
                                                                    %elif tag['tagName'] == "TrolleyShow":
                                                                    <abbr title="Barnvagnsbio"><i class="icon-stroller"></i></abbr>
                                                                    %end
                                                                %end
                                                            %end
                                                        </div>
                                                            <a href="http://www.sf.se/biljetter/bokningsflodet/valj-antal-biljetter/?Auditorium={{show['auditoriumsys99Code']}}&Date={{date}}&Time={{formattedTime}}&City={{cityID}}">
                                                                <div class="bookCol showCol">
                                                                    <button type="button">Boka</button>
                                                                </div>
                                                            </a>
                                                    </div>
                                                %end
                                        </div>
                                        </div>
                                %else:
                                        <div class="col-sm-2 tablecelldiv">
                                                <div class="thumbnail movie" id="{{!movieID}}" data-toggle="modal" data-target=".bs-example-modal-lg" onclick='populateModal({{!movieText}})'>

                                                    <img src="https://mobilebackend.sfbio.se/image/POSTER/200/-/{{movieID}}.jpg" alt="{{!movie['movieName']}}" />

                                                </div>
                                            <div class="showBox">
                                                %for show in movie['shows']:
                                                %formattedTime = show['time'].replace(":", "")
                                                
                                                    <div class="showDetails">
                                                        <div class="timeCol showCol">
                                                            <p>{{show['time']}}</p>
                                                        </div>
                                                        <div class="seatCol showCol" style="top: -2px;">
                                                            <p><abbr title="{{show['numberOfAvailableSeats']}} lediga platser"><i class="icon-chair"> </i>{{show['numberOfAvailableSeats']}}</abbr></p>
                                                        </div>
                                                        <div class="tagCol showCol">
                                                            %for tag in show['tags']:
                                                                %if tag:
                                                                    %if tag['tagName'] == "3D":
                                                        <abbr title="3D">3D</abbr>
                                                                    %elif tag['tagName'] == "sv":
                                                        <abbr title="Svensk tal">SV</abbr>
                                                                    %elif tag['tagName'] == "IMAX 3D":
                                                                    <abbr title="IMAX 3D"><span class="glyphicon glyphicon-sunglasses" style="color: #00aacc;"></span></abbr>
                                                                    %elif tag['tagName'] == "Dolby Atmos":
                                                                    <abbr title="Dolby Atmos"><span class="glyphicon glyphicon-sound-dolby"></span></abbr>
                                                                    %elif tag['tagName'] == "TrolleyShow":
                                                                    <abbr title="Barnvagnsbio"><i class="icon-stroller"></i></abbr>
                                                                    %end
                                                                %end
                                                            %end
                                                        </div>
                                                        <a href="http://www.sf.se/biljetter/bokningsflodet/valj-antal-biljetter/?Auditorium={{show['auditoriumsys99Code']}}&Date={{date}}&Time={{formattedTime}}&City={{cityID}}">
                                                            <div class="bookCol showCol">
                                                                <button type="button">Boka</button>
                                                            </div>
                                                        </a>
                                                    </div>
                                                %end
                                    </div>
                                        </div>
                                    <!-- End row -->
                                    </div>
                                %end
                    %movieIndex = movieIndex + 1
            
                    %end
                        %end
                    %end
                    
                    <!-- Här börjar popup-fönstret -->
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog">
                        <div class="modal-dialog modal-lg" id="movieInfoModal">
                            <div class="modal-content" style="background-color: black; color: white; box-shadow: 0 0px 50px rgba(255, 255, 255, 0.5)">
                                <div class="row">
                                    <h1 id="posterTitle">Titel</h1>
                                    <h2 id="genreAge">Genre ålder</h2>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12" style="padding: 0px;">
                                        <div class="embed-responsive embed-responsive-16by9 trailerEmbed">
                                            <video class="embed-responsive-item" controls poster="http://soterixmedical.com/static/videos/videos/_play_button.png">
                                                <source src="">
                                            </video>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h3 style="font-family:'Abel',sans-serif;">Beskrivning</h3>
                                        <p id="desc"></p>
                                    </div>
                                    <div class="col-lg-6">
                                        <h3 style="font-family:'Abel',sans-serif;">Skådespelare</h3>
                                        <p id="actors"></p>
                                        <h3 style="font-family:'Abel',sans-serif;">Regissör</h3>
                                        <p id="directors"></p>
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