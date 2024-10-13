from tornado.ioloop import IOLoop
from app import create_app
from app.exts import get_ip
import time
import os

port = "80"
server_ip = get_ip()
app = create_app()

if __name__ == '__main__':
	os.system('cls')
	print("V2 API Server")

	app.listen(port=int(port), address=server_ip)
	time.sleep(1)
	print("IP: " + server_ip)
	time.sleep(1)
	print("Port: " + port)
	time.sleep(1)
	print("Online •")
	IOLoop.instance().start()
