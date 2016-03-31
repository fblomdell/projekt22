var text = '{ "movies": [' +
    '{"id": "31060046", "movieName": "The Revenant", "genreName": "Drama", "mediumPoster": "https://mobilebackend.sfbio.se/image/POSTER/200/-/31060046.jpg"},' +
    '{"id": "31060046", "movieName": "The X", "genreName": "Komedi", "mediumPoster": "https://mobilebackend.sfbio.se/image/POSTER/200/-/31060048.jpg"}]}';

var obj = jQuery.parseJSON(text);

function addMovie(filmIndex){

    $("main").append("<div class=\"movie\" id=\"" + filmIndex + "\">");
    $("#" + filmIndex).append("<h2>" + obj.movies[filmIndex].movieName + "</h2>");
    $("#" + filmIndex).append("<img src=\"" + obj.movies[filmIndex].mediumPoster + "\"  alt=\"poster\">");
    $("#" + filmIndex).append("<div class=\"info\">");
    $("#" + filmIndex + " .info").append("<select id=\"time" + filmIndex + "\"></select>");
    $("#time" + filmIndex).append("<option disabled selected>Tider</option>");
    $("#" + filmIndex + " .info").append("<p>" + obj.movies[filmIndex].genreName + "</p>");
    $("#" + filmIndex + " .info").append("<button type=\"button\">Boka</button>");
}

$(document).ready(function(){
    for(var i = 0; i < obj.movies.length; i++){
        addMovie(i);
    }
});
