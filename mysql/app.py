#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import pymysql
import logging
from passlib.apps import mysql_context
from flask import Flask
from flask_httpauth import HTTPBasicAuth

app = Flask(__name__)
auth = HTTPBasicAuth()

@auth.verify_password
def cb_verify_password(username, password):
    if not username or not password:
        return False

    sql = "SELECT `id`, `password` FROM `users` WHERE `username`=%s"
    conn = pymysql.connect(host='127.0.0.1',
                           user='demo',
                           password='9swCHjebrx',
                           db='sample',
                           charset='utf8mb4',
                           cursorclass=pymysql.cursors.DictCursor)

    try:
        with conn.cursor() as cursor:
            cursor.execute(sql, (username,))
            result = cursor.fetchone()
        if not result:
            logging.error("Result is null, no such user {0}".format(username))
            return False
        return mysql_context.verify(password, result['password'])
    finally:
        conn.close()

    return False

@app.route('/')
@auth.login_required
def index():
    return "Hello, %s!" % auth.username()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
