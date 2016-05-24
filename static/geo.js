window.onload= function(){
   

var x = document.getElementById("demo");
getLocation();
    
function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
        x.innerHTML = "Webbläsaren tillåter inte att platstjänster aktiveras.";
    } 
}

function showPosition(position) {
    //alert("Latitud: " + position.coords.latitude + 
    " Longitud: " + position.coords.longitude);
}
}