//vald biograf

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

function updateModalInfo(filmIndex){
    $("#titleName").text(obj.shows[filmIndex].title);
    $("#movieDetails").text('Drama, 15 år');
    $("#shortDesc").text(obj.shows[filmIndex].title);
}

function updateModalTime(filmIndex){
    /*$("#titleName").text(obj.movies[index].title);
    $("#movieDetails").text('Drama, 15 år');
    $("#shortDesc").text(obj.movies[index].title);
    $("#auditoriumName").text(obj.movies[index].auditoriumName);
    $("#time").text(obj.movies[index].time);
    if(obj.movies[index].tags[0].tagName == "Subtitled"){
        $("#movieTag").text("Textad");
    }
    alert("Updated");*/
    var newIndex = filmIndex + 1;
    
    if(obj.shows[filmIndex].title == "The Revenant"){
        $("#timeList").append('<div class="col-xs-12" id="' + newIndex + '"></div>');
        $("#" + newIndex).append('<p>' + obj.shows[filmIndex].time + '</p>');
        if(obj.shows[filmIndex].tags[0].tagName == "Subtitled"){
            $("#" + newIndex).append(' <p class="textNominator">Textad</p>');
        }
        else if(obj.shows[filmIndex].tags[0].tagName == "3D"){
            $("#" + newIndex).append(' <p class="textNominator">3D</p>');
        }
        $("#" + newIndex).append('<button type="button" class="btn btn-primary" style="float: right;">Boka</button>');
    }
}

$(document).ready(function(){
    $('body').on('hidden.bs.modal', '.modal', function () {
        $('video').trigger('pause');
    });
    $("#0").click = updateModalInfo(0);
    for(var i = 0; i < obj.shows.length; i++){
        updateModalTime(i);
    }
});


