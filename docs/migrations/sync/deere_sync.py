import os 
import requests
from dontenv import load_dotenv

load_dotenv ()

CLIENT_ID = os.gentenv ("DEERE_CLIENT_ID")
CLIEN_SECRET = os.gentenv("DEERE_CLIENT_SECRET")
REDIRECT_URI = "localhost"
