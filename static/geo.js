
var userLocLat;
var userLocLon;



window.onload = function(){
    var x = document.getElementById("demo");
    getLocation()

    function getLocation() {
        if (navigator.geolocation) {
            
            navigator.geolocation.getCurrentPosition(showPosition);
        } else { 
            x.innerHTML = "Webbläsaren tillåter inte att platstjänster aktiveras.";
        } 
    }

    function showPosition(position) {
        if (sessionStorage.getItem(position.coords.latitude) == null && sessionStorage.getItem(position.coords.longitude) == null){
            $('.sk-circle').show()
            sessionStorage.setItem(position.coords.latitude, position.coords.longitude);
            userLocLat = sessionStorage.getItem(position.coords.latitude);
            userLocLon = sessionStorage.getItem(position.coords.longitude);
            NearestCity(userLocLat, userLocLon);
        }
    }

    // Convert Degress to Radians
    function Deg2Rad( deg ) {
       return deg * Math.PI / 180;
    }

    function PythagorasEquirectangular( lat1, lon1, lat2, lon2 )
    {
    lat1 = Deg2Rad(lat1);
    lat2 = Deg2Rad(lat2);
    lon1 = Deg2Rad(lon1);
    lon2 = Deg2Rad(lon2);
    var R = 6371; // km
    var x = (lon2-lon1) * Math.cos((lat1+lat2)/2);
    var y = (lat2-lat1);
    var d = Math.sqrt(x*x + y*y) * R;
        console.log(d);
    return d;
    }
    

    var cities= [
    ['Stockholm', 59.32932349999999, 18.068580800000063],
    ['Göteborg', 57.70887, 11.974559999999997],
    ['Malmö', 55.604981, 13.003822000000014],
    ['Alingsås', 57.9300205, 12.53621129999999],
    ['Borlänge', 60.484304, 15.433968999999934],
    ['Borås', 57.72103500000001, 12.939818999999943],
    ['Eskilstuna', 59.37124859999999, 16.509804499999973],
    ['Falun', 60.60646000000001, 15.635499999999979],
    ['Gävle', 60.6748796, 17.14127259999998],
    ['Halmstad', 56.6743748, 12.857788400000004],
    ['Helsingborg', 56.0464674, 12.694512099999997],
    ['Hudiksvall', 61.7273909, 17.10740099999998],
    ['Härnösand', 62.6322698, 17.940871399999992],
    ['Jönköping', 57.78261370000001, 14.161787600000025],
    ['Kalmar', 56.6634447, 16.35677899999996],
    ['Karlskrona', 56.16122399999999, 15.586900000000014],
    ['Karlstad', 59.4021806, 13.511497700000064],
    ['Katrineholm', 58.99555109999999, 16.2054756],
    ['Kristianstad', 56.02939360000001, 14.156677800000011],
    ['Kungsbacka', 57.48749189999998, 12.076192699999979],
    ['Köping', 59.5120962, 15.994510200000036],
    ['Landskrona', 55.8703477, 12.830080199999998],
    ['Linköping', 58.41080700000001, 15.621372699999938],
    ['Flen'],
    ['Luleå', 65.584819, 22.156702600000017],
    ['Lund', 55.70466010000001, 13.191007300000024],
    ['Mariestad', 58.7101119, 13.82133269999997],
    ['Mjölby', 58.3226908, 15.133534800000007],
    ['Mora', 61.004878, 14.537003000000027],
    ['Motala', 58.5380335, 15.04709360000004],
    ['Norrköping', 58.587745, 16.192420999999968],
    ['Norrtälje', 59.7595841, 18.701358400000004],
    ['Skara', 58.3860128, 13.439328199999977],
    ['Skellefteå', 64.750244, 20.950917000000004],
    ['Skövde', 58.3902782, 13.846120799999994],
    ['Strängnäs', 59.37745229999999, 17.032119299999977], 
    ['Sundsvall', 62.390811, 17.306926999999973],
    ['Sälen', 61.1613635, 13.262993000000051],
    ['Söderhamn', 61.3055762, 17.062810200000058],
    ['Uddevalla', 58.3498003, 11.935649000000012],
    ['Umeå', 63.8258471, 20.263035400000035],
    ['Uppsala', 59.85856380000001, 17.638926699999956],
    ['Vetlanda', 57.42746, 15.085329999999999], 
    ['Visby', 57.63479999999999, 18.294840000000022],
    ['Vänersborg', 58.3797283, 12.32480320000002],
    ['Värnamo', 57.1831605, 14.047821399999975],
    ['Västervik', 57.75771559999999, 16.63697590000004],
    ['Västerås', 59.60990049999999, 16.544809100000066],
    ['Växjö', 56.8790044, 14.805852200000004],
    ['Ystad', 55.4295051, 13.82003080000004], 
    ['Örebro', 59.2752626, 15.213410500000009],
    ['Örnsköldsvik', 63.29004740000001, 18.716616599999952],
    ['Östersund', 63.1766832, 14.636068099999989]
    ];

    function NearestCity( latitude, longitude )
    {
        var latitude = Number(latitude);
        var longitude = Number(longitude);
        var cityArray = [];
        for (index = 0; index < cities.length; index++) {
            var dif =  PythagorasEquirectangular( latitude, longitude, cities[ index ][ 1 ], cities[ index ][ 2 ] );
            cityArray.push(dif);
            
  
        }
        
        var index = 0;
        var value = cityArray[0];
        for (var i=1; i < cityArray.length; i++){
            if (cityArray[i] < value){
                value = cityArray[i];
                index = i;
            }
        }
        index = index +1;
        console.log(index, value)

        document.getElementById("autoCity").selectedIndex = index;
        document.getElementById("formtastic").submit();
        
    }
};

    