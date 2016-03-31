<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" type="text/css" rel="stylesheet">
>>>>>>> alpha2-index:index.htm
        <meta charset="utf-8">
        <title>FilmDags</title>
        <script type="text/javascript" src="{{ url('static', path='script.js') }}" charset="utf-8"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <script src="testscript2.js" type="text/javascript"></script>
    </head>
    <body>
        <nav>
            <select>
                <option value="" disabled selected>Stad</option>
                <option value="">Malmö</option>
                <option value="">Göteborg</option>
                <option value="">Stockholm</option>
            </select>
            <select>
                <option value="" disabled selected>Biograf</option>
            </select>
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
                <p>hejhej</p>
            </div>
        </main>
        <footer>
            <p>"Copyright" (C) 2016</p>
        </footer>
    </body>
</html>