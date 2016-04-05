<!DOCTYPE html>
<html>
    <head>
        <link href="{{ url('static', path='style.css') }}" charset="utf-8" type="text/css" rel="stylesheet">
        <meta charset="utf-8">
        <title>FilmDags</title>
        <script type="text/javascript" src="{{ url('static', path='location.js') }}" charset="utf-8"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script type="text/javascript" src="{{ url('static', path='gallery.js') }}" charset="utf-8"></script>
        <script type="text/javascript" src="{{ url('static', path='cities.js') }}" charset="utf-8"></script>
    </head>
    <body>
        <nav>
            <form action="bottle_film.py" method="get">
                <select id="cityChoice" onchange="this.form.submit()">
                    <option value="" disabled selected>Stad</option>
                    %for city in allCities['cities']:
                        <option type="submit" name="{{city['id']}}">{{city['name']}}</option>
                    %end
                   
                </select>
            </form>
        </nav>
        <header>
            <h1>FilmDags</h1>
        </header>
        <main>
            <div class="movie">
                <h2>Movie</h2>
                <img src="http://placehold.it/200x285" alt="poster">
                <div class="info">
                    <select>
                        <option value="" disabled selected>Tider</option>
                        <option value="">20:00</option>
                        <option value="">21:20</option>
                    </select>
                    <p>Stolar</p>
                    <button type="button">Boka</button>
                </div>
            </div>
            <div id="platsinfo">
                
            </div>
        </main>
        <footer>
            <p>"Copyright" (C) 2016</p>
        </footer>
        
    </body>
</html>