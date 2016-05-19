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
        
    </header>
    <body>
        
        <!-- Behövs för att skicka filminfo till popup (måste finnas ett bättre sätt) -->   
        
        <div class="container">
            %try:
                <h2>Visningar idag, {{chosenCity['name']}} <span class="glyphicon glyphicon-menu-right" style="color: #fff; font-size: 18px;"></span> {{chosenCinema['name']}}</h2>
                
            %except NameError:
                
            %end
                
            <hr>
            <div class="row citiesCinemaDropdown">
                <form action="/movies" method="post">
                <div class="col-lg-6">
                    <select class="form-control" onchange="this.form.submit(); $('.sk-circle').show()" name="city" style="width: 300px; float:right;">
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
                <div class="col-lg-6">
                    %try:
                                <!--{{!cinemaList}}-->
                            %except NameError:
                                <select class="form-control" name="cinema" onchange="this.form.submit()" disabled  style="width: 300px;">
                                    <option disabled selected>2. Välj biograf</option>
                            %else:
                                <!-- Listar alla biografer som finns i den vada staden och sätter select på den biograf som användaren väljer -->
                                <select class="form-control" name="cinema" onchange="this.form.submit(); $('.sk-circle').show()" style="width: 300px; float:left;">
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
            %if firstVisit == True:
                <div id="frontpage_text" style="text-align: center; margin-top: 30px; margin-left:0px;">
                    
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
            
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>