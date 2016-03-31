from bottle import run, route, template

@route("/")
def index():
    
    return template("index")

@route('/static/<filename>')
def server_static(filename):
	'''Handles the routes to our static files

	Returns:
		file : the static file requested by URL
	'''
	return static_file(filename, root="static")
    
run(host="localhost", port=8080, debug=True)
