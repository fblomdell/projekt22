<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <!--
        <link rel="stylesheet" type="text/css" charset="utf-8" href="">
        <link rel="stylesheet" type="text/css" charset="utf-8" href="">-->
        <link href='https://fonts.googleapis.com/css?family=Abel' rel='stylesheet' type='text/css'>
        
        <title>FilmDags</title>
       
    </head>
    <body>
        <div class="container" style="color: white; margin-left: auto; margin-right: auto;">
            <script>
                $(document).ready(function(){
    //This sessionStorage.getItem(); is also a predefined function in javascript
    //will retrieve session and get the value;
                    var a = sessionStorage.getItem("sent");
                    
                    var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("action", '/movieInfo/');
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "movieid");
                hiddenField.setAttribute("value", a);
                form.appendChild(hiddenField);

                document.body.appendChild(form);
                form.submit();
                });    
                /*
                var form = document.createElement("form");
                form.setAttribute("method", "post");
                form.setAttribute("target", "_blank");
                form.setAttribute("action", '/movieInfo/');
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", "movieid");
                hiddenField.setAttribute("value", movieId);
                form.appendChild(hiddenField);

                document.body.appendChild(form);
                form.submit();
                */
            </script>
        </div>
        
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>