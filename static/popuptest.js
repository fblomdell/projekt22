var text = '{' +
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
	'"title": "10 Cloverfield Lane"' +
'}';

var obj = jQuery.parseJSON(text);

function updateModal(){
    $("#titleName").text(obj.title);
    $("#movieDetails").text('Drama, 15 år');
    $("#shortDesc").text(obj.title);
    $("#auditoriumName").text(obj.auditoriumName);
    $("#time").text(obj.time);
    if(obj.tags[0].tagName == "Subtitled"){
        $("#movieTag").text("Textad");
    }
    alert("Updated");
}

$(document).ready(function(){
    alert("good");
    $("#0").click = updateModal();
});
