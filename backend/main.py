from flask import Flask, render_template, request, jsonify
import mysql.connector
import json
import sys
import os
import base64

app = Flask(__name__)

@app.route("/pokemon", methods=['GET'])
def getPokemon():
    pokemon_id = request.args.get('id')
    if not pokemon_id:
        return jsonify({'error': 'Missing id parameter'}), 400

    try:
        conn = mysql.connector.connect(
            user="admin",
            password="",
            host="localhost",
            port=3306,
            database="pokemon"
        )
        query = 'SELECT p.id, p.identifier, p.height, p.weight, ps.identifier AS species_identifier, g.identifier AS generation_identifier \
            FROM pokemon p \
            JOIN pokemon_species ps ON ps.id = p.species_id \
            JOIN generations g ON g.id = ps.generation_id \
            WHERE p.identifier LIKE %s;'
        cursor = conn.cursor()
        cursor.execute(query, (pokemon_id + '%',))
        res = [dict((cursor.description[i][0], value) for i, value in enumerate(row)) for row in cursor.fetchall()]
        
        for pokemon in res:
            generation = pokemon['generation_identifier']
            number = pokemon['id'] 
            
            
            img_path = f"pokemon-sprites/{generation}/main-sprites/yellow/{number}.png"
            img_dir = os.path.abspath(os.path.join(img_path, '..',))

            if os.path.exists(img_path):
                with open(img_path, 'rb') as img_file:
                    img_base64 = base64.b64encode(img_file.read()).decode('utf-8')
                pokemon['image'] = img_base64
        cursor.close()
        conn.close()
        return json.dumps(res)

    except mysql.connector.Error as e:
        print(f"Error: {e}")
        return jsonify({'error': 'Database connection error'}), 500

if __name__ == '__main__':
    app.run(debug=True)
