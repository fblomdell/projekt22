from bottle import Bottle, run, route, template, url, view, static_file


@route("/")
@view("index")
def index():
    
    return { "url": url }

@route("/static/:path#.+#", name="static")
def server_static(path):

    return static_file(path, root="static")
    
run(host="localhost", port=8080, debug=True)
