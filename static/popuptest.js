//vald biograf
//Test JSON
var text = '{ "shows": [{' +
	'"auditoriumName": "Storgatan salong 2",' +
	'"auditoriumsys99Code": "2",' +
	'"buyable": true,' +
	'"id": "2016-04-11_2120_2_MA",' +
	'"loyaltyMaxTickets": 0,' +
	'"loyaltyOnlyForGoldMembers": false,' +
	'"loyaltyPointsNeeded": 0,' +
	'"membershipRequired": false,' +
	'"movieId": 47000919,' +
	'"numberOfAvailableSeats": 124,' +
	'"preBuyRule": false,' +
	'"resevable": true,' +
	'"seatsUnnumbered": false,' +
	'"sfAffiliate": true,' +
	'"showDetailURL": "shows/showid/2016-04-11_2120_2_MA/theatremainaccount/2305",' +
	'"showObjectCreated": 1460375818821,' +
	'"tags": [{' +
	'	"tagName": "Subtitled"' +
	'}],' +
	'"theatreId": 109,' +
	'"theatreMainAccount": 2305,' +
	'"theatreName": "Filmstaden Storgatan",' +
	'"time": "21:20",' +
	'"timeMs": 1460402400000,' +
	'"title": "The Revenant"' +
    '},{' +
    '"auditoriumName": "Storgatan salong 2",' +
	'"auditoriumsys99Code": "2",' +
	'"buyable": true,' +
	'"id": "2016-04-11_2120_2_MA",' +
	'"loyaltyMaxTickets": 0,' +
	'"loyaltyOnlyForGoldMembers": false,' +
	'"loyaltyPointsNeeded": 0,' +
	'"membershipRequired": false,' +
	'"movieId": 47000919,' +
	'"numberOfAvailableSeats": 124,' +
	'"preBuyRule": false,' +
	'"resevable": true,' +
	'"seatsUnnumbered": false,' +
	'"sfAffiliate": true,' +
	'"showDetailURL": "shows/showid/2016-04-11_2120_2_MA/theatremainaccount/2305",' +
	'"showObjectCreated": 1460375818821,' +
	'"tags": [{' +
	'	"tagName": "3D"' +
	'}],' +
	'"theatreId": 109,' +
	'"theatreMainAccount": 2305,' +
	'"theatreName": "Filmstaden Storgatan",' +
	'"time": "23:20",' +
	'"timeMs": 1460402400000,' +
	'"title": "The Revenant"' +
'}]}';

var obj = jQuery.parseJSON(text);
var a;

//Defunct
function submitMoviePost(val){    
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("target", "_blank");
    form.setAttribute("action", '/movieInfo/');
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "movieid");
    hiddenField.setAttribute("value", val);

    form.appendChild(hiddenField);

    document.body.appendChild(form);
    form.submit();
}

//Defunct
function loadPopup(movieId){    
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", '/movieInfo/');
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "movieid");
    hiddenField.setAttribute("value", movieId);
    target_popup(form);
    form.appendChild(hiddenField);
    document.body.appendChild(form);
    form.submit();
}
//Defunct
function target_popup(form) {
    window.open('redir', 'formpopup', 'width=400,height=400,resizeable,scrollbars');
    form.target = 'formpopup';
    alert("Done");
}

//Uppdatera popup-fönstret med information från filmen användaren klickar på
//Input: JSON-fil om filmen (ev visningar)
function populateModal(movie){
    $('#posterTitle').text(movie['movieName']);
    $('#genreAge').text(movie['genreName'] + ", " + movie['age']);
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
    $('#posterOverlay').css('background-image', 'url(' + upgradePoster(movie['placeHolderPosterURL']) + ')');
}

function upgradePoster(placeholderBanner){
    var newURL = placeholderBanner.replace("_WIDTH_", "900");
    return newURL
}












$(document).ready(function(){
    $('body').on('hidden.bs.modal', '.modal', function () {
        $('video').trigger('pause');
    });
    $('[data-toggle="tooltip"]').tooltip()
    //for(var i = 0; i < obj.shows.length; i++){
    //    updateModalTime(i);
    //}
});


