import json
import requests
import subprocess

from . import version

class namedayRequestor:

    def __init__(self, country, timezone ):
        #   Init variables
        self.country = country
        self.timezone = timezone
        self.data = "{"

    def GetData(self):
        self.data +="\"module\":{"
        self.data +="\"version\":\""
        self.data += version.currentVersion
        self.data +="\""
        self.data +="},"
        self.data +="\"namedays\":"
        try:
            self.data += requests.get(f"https://api.abalin.net/today?country={self.country}&timezone={self.timezone}").text
        except:
            self.data += "{\"Error\": \"Failed to connect to service. Try again later.\"}"

        #   Finish JSON string
        self.data += "}"

        #   Return JSON string containing all the result
        return (self.data)

