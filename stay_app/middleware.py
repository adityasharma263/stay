# -*- coding: utf-8 -*-
__author__ = 'aditya'

from flask import request, session, redirect
import requests
from Crypto.Cipher import AES
import binascii


class LoggerMiddleware(object):

    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        # if environ['REQUEST_METHOD'] == 'GET':
        #     if environ['REQUEST_URI'].startswith('/hotel'):
        #         if request.cookies.get("hash"):
        #             if 'hash' in session:
        #                 if session["hash"] != request.cookies.get("hash"):
        #                     session.clear()
        #                     return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        #             else:
        #                 php_url = str(app.config["PARTNER_API_URL"]) + "/api/v1/partner.php"
        #                 AES.key_size = 128
        #                 iv = "DEFGHTABCIESPQXO"
        #                 key = "pqrstuvwxyz$abcdefghijAB12345678"
        #                 crypt_object = AES.new(key=key, mode=AES.MODE_CBC, IV=iv)
        #                 decoded = binascii.unhexlify(
        #                     str(request.cookies["hash"]))  # your ecrypted and encoded text goes here
        #                 decrypted = crypt_object.decrypt(decoded)
        #                 unpad = lambda s: s[:-ord(s[len(s) - 1:])]
        #                 mobile = unpad(decrypted).decode('utf-8')
        #                 partner_data = requests.get(url=php_url, params={"mobile": mobile}).json()
        #                 if partner_data.get("error"):
        #                     return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        #                 else:
        #                     session["partner_data"] = partner_data
        #                     session["hash"] = str(request.cookies["hash"])
        #         else:
        #             return redirect(str(app.config["PARTNER_DOMAIN_URL"]) + '/login.php', code=302)
        return self.app(environ, start_response)