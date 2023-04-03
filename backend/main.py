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

@app.route("/pokemon", methods=['GET'])
def getPokemon():
    args = request.args
    pokemon = args.get('id')

    query = 'SELECT p.id, p.identifier, p.height, p.weight, g.identifier FROM pokemon p \
                JOIN pokemon_species ps ON ps.id = p.species_id \
                    JOIN generations g ON g.id = ps.generation_id \
                            WHERE p.identifier LIKE"' + pokemon + '%";'
    mycursor.execute(query)

    res = [dict((mycursor.description[i][0], value) for i, value in enumerate(row)) for row in mycursor.fetchall()] 

    return jsonify(result = res)
