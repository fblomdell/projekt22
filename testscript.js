var myArray = ["Hello", "World", 64];

var myDict = {};
myDict['Hello'] = ["World", ["15:20", "19:40"], 121];
myDict['World'] = ["Magic Movie 7", ["21:00", "22:00"], 67];

$(document).ready(function(){
    for (var i = 0; i < Object.keys(myDict).length; i++){
        addMove(i);
    }
});

function addMove(dictKey){
    $("main").append("<div class=\"movie\" id=\"" + dictKey + "\">");
    $("#" + dictKey).append("<h2>" + Object.keys(myDict)[dictKey] + "</h2>");
    alert(Object.keys(dictKey));
    $("#" + dictKey).append("<img src=\"http://placehold.it/200x300\" alt=\"poster\">");
    
    
    /*$("#" + dictKey).append("<div class=\"info\">");
    $("#" + dictKey + " .info").append("<select id=\"time" + dictKey + "\"></select>");
    $("#time" + dictKey).append("<option disabled selected>Tider</option>");
    $("#time" + dictKey).append("<option>" + Object.keys(dictKey)[1][0] + "</option>");
    $("#time" + dictKey).append("<option>" + myDict.keys(dictKey)[1][1] + "</option>");
    $("#" + dictKey + " .info").append("<p>" + myDict.keys(dictKey)[2] + "</p>");
    $("#" + dictKey + " .info").append("<button type=\"button\">Boka</button>");*/
    
    /*<div class="info">
                    <select>
                        <option value="" disabled selected>Tider</option>
                        <option value="">20:00</option>
                        <option value="">21:20</option>
                    </select>
                    <p>Stolar</p>
                    <button type="button">Boka</button>
                </div>
                */
    
}