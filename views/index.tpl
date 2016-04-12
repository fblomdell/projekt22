<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <title>FilmDags</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='newstyle.css') }}">
        
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="glyphicon glyphicon-chevron-down"></span>
              </button>
              <a class="navbar-brand" href="#">
                    <img src="{{ url('static', path='logoexempel.png') }}" alt="Logo" width="110px">
                </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-info-sign"></span> Om oss</a></li>
              </ul>
            </div>
        </nav>
        
        <div class="container">
            <!-- Låda med dropdown-menyerna stad och biograf -->
            <div class="well cityCinemaBox">
<<<<<<< HEAD
                <div class="rows">
                    <div class="form-group col-md-6">
                        <form action="/cinema" method="post">
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
=======
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
>>>>>>> origin/development

                                        %if cityID == city['id']:
                                            <option value="{{city['id']}}" selected>{{city['name']}}</option>

<<<<<<< HEAD
                                        %else:
                                            <option value="{{city['id']}}">{{city['name']}}</option> 
                                %end

                                %end
                                %end
                            </select>
                        </form>
                   </div>
                    <div class="form-group col-md-6">
                        <select class="form-control">
                            <option disabled selected>Biograf</option>
                            %try:
                                {{!cinemaList}}
                            %except NameError:
                                pass
                            %else:
                                %for cinema in cinemaList['theatres']:
                                    <option value="">{{cinema['name']}}</option>
                                %end
                            %end
                        </select>
                   </div>
                </div>
=======
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
>>>>>>> origin/development
                <!-- Knapp som när väl klickat visar lista på städer. För att lägga till städer krävs det att de läggs in som li-taggar
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Stad
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu scrollable-menu">
                        <li><a href="#">Malmö</a></li>
                        <li><a href="#">Göteborg</a></li>
                        <li><a href="#">Stockholm</a></li>
                        <li><a href="#">Visa fler...</a></li>
                    </ul>
                </div>
                
                <div class="btn-group">
                    <button type="button" class="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Biograf
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="#">.....</a></li>
                        <li><a href="#">.....</a></li>
                        <li><a href="#">.....</a></li>
                        <li><a href="#">.....</a></li>
                    </ul>
                </div>
                -->
                <h1>Biograf</h1>
            </div>
            
            <!-- Denna div visar en rad med thumbnails. 4 videos kan få plats på en rad (går att ändra enkelt) -->
            <div class="row">
                <div class="col-sm-3">
                    <div class="thumbnail movie">
                        <h4>The Revenant</h4>
                        <img src="http://placehold.it/180x280" alt="The Revenant" data-toggle="modal" data-target="#modalLabel">
                        <div class="caption">
                            <div class="form-group">
                                <select class="form-control" id="sel1">
                                    <option disabled>Idag</option>
                                    <option>21:00</option>
                                    <option>22:00</option>
                                    <option>23:10</option>
                                    <option disabled>Imorgon</option>
                                    <option>21:00</option>
                                    <option>22:00</option>
                                    <option>23:10</option>
                                </select>
                            </div>
                            <p>Antal stolar: 111</p>
                            <p><a href="#" class="btn btn-primary btn-info" role="button">Boka</a></p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- En modal visas när användaren klickar på filmpostern -->
            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="modalLabel">
                <div class="modal-dialog modal-lg modalPopup">
                    <div class="modal-content" style="padding: 15px;">
                        <div class="row">
                            <div class="col-xs-4">
                                <img src="http://placehold.it/180x280" alt="poster" width="100%">
                            </div>
                            <div class="col-xs-8">
                                <h3 style="text-align: center; margin-top: 0px;">The Revenant</h3>
                                <p>Under en expedition i den outforskade amerikanska vildmarken blir Hugh attackerad av en björn och lämnad att dö av de andra. I sin kamp att överleva får han utstå obeskrivlig sorg och att ha blivit bedragen av sin närmaste vän John Fitzgerald. Nu är han på jakt efter upprättelse i den bittra vintern och drivs bara av ren viljestyrka och kärlek till sin familj.\r\n \r\nRegi av Oscarbelönade Alejando G. Inarritu (Birdman, Babel).</p>
                            </div>
                            <div class="col-xs-8">
                                <h3 style="text-align: center; margin-top: 0px;">Tider</h3>
                                <div class="rows premiereList">
                                    <h4>Biograf 1</h4>
                                    <div class="col-xs-12">
                                        <p>21:00</p>
                                        <p class="textNominator">3D</p>
                                    </div>
                                    <div class="col-xs-12">
                                        <p>22:00</p>
                                        <p class="textNominator">3D</p>
                                        <p class="textNominator">Textad</p>
                                    </div>
                                    <h4>Biograf 2</h4>
                                    <div class="col-xs-12">
                                        <p>21:00</p>
                                    </div>
                                    <div class="col-xs-12">
                                        <p>22:00</p>
                                    </div>
                                    <h4>Biograf 3</h4>
                                    <div class="col-xs-12">
                                        <p>21:00</p>
                                    </div>
                                    <div class="col-xs-12">
                                        <p>22:00</p>
                                    </div>
                                    <h4>Biograf 4</h4>
                                    <div class="col-xs-12">
                                        <p>21:00</p>
                                    </div>
                                    <div class="col-xs-12">
                                        <p>22:00</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="embed-responsive embed-responsive-16by9">
                                <video class="embed-responsive-item" controls width="500px">
                                    <source src="http://aka-m-p.maxplatform.com/20/57/78/HD-720p_1280x720_FnjtoI_1_se_1_50063_80210_120589_1111.mp4?u=2_105462">
                                </video>
                            </div>
                            <!-- TODO: När knappen klickas så ska videon pausas -->
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
                    </div>
                </div>
</div>
            <!--<div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="http://aka-m-p.maxplatform.com/20/57/78/HD-720p_1280x720_FnjtoI_1_se_1_50063_80210_120589_1111.mp4?u=2_105462"></iframe>
            </div>-->
        </div>
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>