import mysql.connector
from flask import Flask, json, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/write", methods=['GET', 'POST'])
def write_fn():
    data = request.form.to_dict()
    print("#####################################", data)
    insert_db(data)
    return "0"

@app.route("/read", methods=['GET'])
def read_fn():
    data = read_db()
    return jsonify(data)

@app.route("/update", methods=['POST'])
def update_fn():
    data = request.form.to_dict()
    print("EDIT #####################################", data)
    update_db(data)
    return jsonify(data)

class Connect:
    def __init__(self):
        mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="ag_car_db",
        )
        self.db = mydb
        self.cursor = self.db.cursor()
    
    def pointer(self):
        return (self.cursor, self.db)

    def fields(self):
        return ["timestamp","agent_name","order_id","client_name","contact","email_id","total_tariff","deposit","profit","driver_pay","payment_method","pickup_date","no_of_vehicles","pickup","booking_status","agreement","agent_notes","jt_link"]

def read_db():
    cursor = connect.pointer()[0]
    cursor.execute("SELECT * FROM emp_sales")

    myresult = cursor.fetchall()
    data = []
    keys = connect.fields()
    for each in myresult:
        json_data = {}
        each = list(each)
        each.pop(0)
        for x,y in zip(keys, each):
            json_data[x] = y
        data.append(json_data)
    return data


def insert_db(data):
    keys = ""
    vals = []
    for key, val in data.items():
        keys = keys + key + ", "
        vals.append(val)
    vals = tuple(vals)
    sql = "INSERT INTO emp_sales ({0}) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);".format(keys[:-2])
    print("@@@@@@@@@@@@@", (sql, vals))
    cursor, db = connect.pointer()
    cursor.execute(sql, vals)

    db.commit()


def update_db(data):
    keys = ""
    vals = []
    for key, val in data.items():
        keys = keys + key + ", "
        vals.append(val)
    keys = keys[:-2]
    vals = tuple(vals)
    sql = "UPDATE emp_sales SET "
    for i in range(len(data.values())-1):
        if not list(data.keys())[i] == "order_id":
            sql = sql + "{0} = '{1}', ".format(list(data.keys())[i], list(data.values())[i])
    sql = sql[:-2] + " "
    sql = sql + "WHERE {0} = '{1}'".format("order_id", data['order_id'])
    print(sql)
    # print("@@@@@@@@@@@@@", (sql, vals))
    cursor, db = connect.pointer()
    cursor.execute(sql)

    db.commit()

if __name__ == "__main__":
    connect = Connect()
    app.run(debug=True)
