#!/usr/bin/env python
# -*- coding: utf-8 -*-

import json
import requests

import secrets

import sys
sys.path.append('/home/dev/python/abalin_nameday/src/')

import abalin_nameday

myClient = abalin_nameday.namedayRequestor("hu", "Europe/Prague")

print(json.dumps(json.loads(myClient.GetData()), indent=2, sort_keys=True))
