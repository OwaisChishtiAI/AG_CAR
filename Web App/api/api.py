import mysql.connector
from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route("/write", methods=['GET', 'POST'])
def write_fn():
    data = request.form['sales']
    print("#####################################", data)
    return "0"

def read_db():
    mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="ag_car_db",
    )

    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM emp_sales")

    myresult = mycursor.fetchall()

    for x in myresult:
        print(x)

if __name__ == "__main__":
    app.run(debug=True)