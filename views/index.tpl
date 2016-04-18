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
                        %for movie in movieList['shows']:
                            <div class="col-sm-3">
                                <div class="thumbnail movie"data-toggle="modal" data-target="#modalLabel" id="{{!movie['movieId']}}">
                                   
                                    
                                <div class="hovereffect">
                                    <img src="https://mobilebackend.sfbio.se/image/POSTER/150/-/{{!movie['movieId']}}.jpg" alt="The Revenant">
                                    
                                    <div class="overlay">
                                        <h4>{{!movie['title']}}</h4>
                                        
                                    </div>
                                </div>
                                </div>                                   
                            </div>
                        %end
                    %end
                
            </div>
            
            <!-- En modal visas när användaren klickar på filmpostern -->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="modalLabel">
                <div class="modal-dialog modal-lg modalPopup">
                    <div class="modal-content" style="padding: 15px; padding-top: 0px; background-color: #101010; color: white;">
                        <div class="row">
                            <div class="col-lg-12" id="posterOverlay" style='background-image: url("http://www.telegraph.co.uk/content/dam/film/the%20revenant/leo-xlarge.jpg")'>
                                <h1 id="posterTitle">The Revenant</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="embed-responsive embed-responsive-16by9 trailerEmbed">
                                    <video class="embed-responsive-item" controls>
                                        <source src="http://aka-m-p.maxplatform.com/20/57/78/HD-720p_1280x720_FnjtoI_1_se_1_50063_80210_120589_1111.mp4?u=2_105462">
                                    </video>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <h2>Drama, 13 år</h2>
                                <span style="float:left; width: 50%;">
                                    <h3>Skådespelare</h3>
                                    <p>X, y, z</p>
                                </span>
                                <span style="float:right;text-align:right; width: 50%;">
                                    <h3>Producent</h3>
                                    <p>X, y, z</p>
                                </span>
                                <span style="clear:both;border-top: 1px solid #000;">
                                <p>Under en expedition i den outforskade amerikanska vildmarken blir Hugh attackerad av en björn och lämnad att dö av de andra. I sin kamp att överleva får han utstå obeskrivlig sorg och att ha blivit bedragen av sin närmaste vän John Fitzgerald. Nu är han på jakt efter upprättelse i den bittra vintern och drivs bara av ren viljestyrka och kärlek till sin familj.\r\n \r\nRegi av Oscarbelönade Alejando G. Inarritu (Birdman, Babel).</p></span>
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
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>