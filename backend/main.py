from flask import Flask, render_template, request, jsonify
import mariadb
import json
import sys

try:
    conn = mariadb.connect(
        user = "exsuslabs",
        password = "exsuslabs",
        host = "pokemon-database",
        port = 3306,
        database = "pokemon"
    )
    mycursor = conn.cursor()
except mariadb.Error as e:
    print(f"Error: {e}")
    sys.exit(1)

app = Flask(__name__)

@app.route("/<pokemon>")
def getPokemon(pokemon):
    query = 'SELECT p.* AS pokemon FROM pokemon p where p.identifier="' + request.view_args['pokemon'] + '";'
    mycursor.execute(query)
    res = mycursor.fetchall()
    json_data = []
    for result in res:
        json_data.append(result)
    return jsonify(result = json_data)
