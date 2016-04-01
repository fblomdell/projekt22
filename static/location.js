window.onload = function() {
    console.log();

    var plats = document.getElementById("platsinfo");
    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
            
        } else {
            plats.innerHTML = "Stöds ej"
        }
    }

    function showPosition(position) {
       plats.innerHTML = "Latitude: " + position.coords.latitude + "Longitude: " + position.coords.longitude;
    }
}
