//Uppdatera popup-fönstret med information från filmen användaren klickar på
//Input: JSON-fil om filmen (ev visningar)
function populateModal(movie){
    document.title = movie['movieName'] + " - FilmDags";
    $('#posterTitle').text(movie['movieName']);
    $('#genreAge').text(movie['genreName'] + ", " + movie['age'] + " - " + movie['formattedLength']);
    $('.embed-responsive-item').attr('src', movie['highQualityTrailerLink']);
    var actorList = "";
    for (i = 0; i <= movie['actors'].length-1; i++){
        if(i != movie['actors'].length-1){
            actorList += movie['actors'][i]['name'] + ", ";
        }
        else{
            actorList += movie['actors'][i]['name']
        }
    }
    $('#actors').text(actorList);
    $('#desc').text(movie['shortDescription']);
    $('#directors').text(movie['directors'][0]['name']);
}

function upgradePoster(placeholderBanner){
    var newURL = placeholderBanner.replace("/75/", "/900/");
    return newURL
}

$(document).ready(function(){
    $('body').on('hidden.bs.modal', '.modal', function () {
        $('video').trigger('pause');
        document.title = "FilmDags";
        
    });
    $('video').click(function(){this.paused?this.play():this.pause();});
    $('[data-toggle="tooltip"]').tooltip();
    //for(var i = 0; i < obj.shows.length; i++){
    //    updateModalTime(i);
    //}
});