<!DOCTYPE html>
<html>
    <head>
        <!--<link href=".css" type="text/css" rel="stylesheet"> -->
        <script type="text/javascript" src="{{ url('static', path='script.js') }}" charset="utf-8"></script>
        
        <style>
            body{
                width: 900px;
                margin-left: auto;
                margin-right: auto;
            }
            header{
                float: left;
            }
            nav{
                text-align: center;
                float: right;
            }
            main{
                clear: both;
            }
            .movie{
                border: 1px solid black;
                width: 200px;
                text-align: center;
                float: left;
                margin-left: 10px;
                margin-right: 10px;
                margin-top: 10px;
                
            }
            .info select{
                padding: 5px;
                margin-top: 10px;
                margin-left: 5px;
                margin-right: 5px;
                float:left;
            }
            .info button{
                padding: 5px;
                margin-top: 10px;
                margin-left: 5px;
                margin-right: 5px;
                float: right;
            }
            .movie h2{
                margin: 2px;
            }
            .info p{
                float: left;
            }
        </style>
        <meta charset="utf-8">
        <title>FilmDags</title>
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
                <img src="http://placehold.it/200x300" alt="poster">
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
            <div class="movie">
                <h2>Movie</h2>
                <img src="http://placehold.it/200x300" alt="poster">
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
            <div class="movie">
                <h2>Movie</h2>
                <img src="http://placehold.it/200x300" alt="poster">
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
            
        </footer>
    </body>
</html>