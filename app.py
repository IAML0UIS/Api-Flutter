from flask import Flask, jsonify, request
import mysql.connector
from datetime import datetime
import pyttsx3
import time

app = Flask(__name__)

def conectar_base_datos():
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="software_vitalsave"
        )
        return mydb
    except mysql.connector.Error as err:
        print(f"Error al conectar a la base de datos: {err}")
        return None

@app.route('/citas', methods=['GET'])
def ver_citas_disponibles():
    try:
        mydb = conectar_base_datos()
        if mydb:
            mycursor = mydb.cursor()
            mycursor.execute("SELECT * FROM citas")
            citas = mycursor.fetchall()
            citas_list = []
            for cita in citas:
                citas_list.append({
                    'fecha': cita[1],
                    'hora': cita[2],
                    'descripcion': cita[3],
                    'lugar': cita[4]
                })
            return jsonify(citas_list)
        else:
            return jsonify({"error": "Error al conectar a la base de datos"})
    except mysql.connector.Error as err:
        return jsonify({"error": f"Error al obtener las citas: {err}"})

@app.route('/citas', methods=['POST'])
def agregar_cita():
    try:
        mydb = conectar_base_datos()
        if mydb:
            data = request.json
            fecha = data['fecha']
            hora = data['hora']
            descripcion = data['descripcion']
            lugar = data['lugar']

            mycursor = mydb.cursor()
            sql = "INSERT INTO citas (fecha, hora, descripcion, lugar) VALUES (%s, %s, %s, %s)"
            val = (fecha, hora, descripcion, lugar)
            mycursor.execute(sql, val)
            mydb.commit()

            return jsonify({"message": "Cita agregada correctamente"})
        else:
            return jsonify({"error": "Error al conectar a la base de datos"})
    except mysql.connector.Error as err:
        return jsonify({"error": f"Error al agregar la cita: {err}"})

if __name__ == '__main__':
    app.run(host='192.168.1.7', port=5000, debug=True)  # <-- Asegúrate de que esté escuchando en todas las interfaces
