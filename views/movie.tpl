<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='newstyle.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap.min.css') }}">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="{{ url('static', path='bootstrap-theme.css') }}">
        <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
        
        <title>FilmDags</title>
       
    </head>
    <body>
        <div class="container" style="color: white; margin-left: auto; margin-right: auto;">
            <div class="row">
                            <div class="col-lg-12" id="posterOverlay" style="background-image: url('{{image}}')">
                                <h1 id="posterTitle">{{movieInfo['movieName']}}</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-5">
                                <div class="embed-responsive embed-responsive-16by9 trailerEmbed">
                                    <video class="embed-responsive-item" controls>
                                        <source src="{{movieInfo['highQualityTrailerLink']}}">
                                    </video>
                                </div>
                            </div>
                            <div class="col-lg-7">
                                <h2>{{movieInfo['genreName']}}, {{movieInfo['age']}}</h2>
                                <span style="float:left; width: 50%;">
                                    <h3>Skådespelare</h3>
                                    <p>
                                        -
                                        %for actor in movieInfo['actors']:
                                            {{actor['name']}} -
                                        %end
                                    </p>
                                </span>
                                <span style="float:right;text-align:right; width: 50%;">
                                    <h3>Producent</h3>
                                    <p>
                                        -
                                        %for director in movieInfo['directors']:
                                            {{director['name']}} -
                                        %end
                                    </p>
                                </span>
                                <span style="clear:both;border-top: 1px solid #000;">
                                <p>{{movieInfo['shortDescription']}}</p></span>
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
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>