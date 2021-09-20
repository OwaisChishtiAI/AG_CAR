import mysql.connector
from flask import Flask, json, jsonify, request
from flask_cors import CORS
from datetime import datetime

app = Flask(__name__)
CORS(app)

@app.route("/write", methods=['GET', 'POST'])
def write_fn():
    data = request.form.to_dict()
    print("#####################################", data)
    insert_db(data)
    return "0"

@app.route("/read", methods=['POST'])
def read_fn():
    data = request.form.to_dict()
    from_date = data.get('from_date')
    to_date = data.get('to_date')
    if from_date:
        if to_date:
            print("Dates Provided")
            data = read_db_by_date(from_date, to_date)
    else:
        print("Dates NOT Provided")
        data = read_db()
    print(len(data))
    return jsonify(data)

@app.route("/read_by_date", methods=['POST'])
def read_by_date_fn():
    data = request.form.to_dict()
    from_date = data['from_date']
    to_date = data['to_date']
    data = read_db_by_date(from_date, to_date)
    return jsonify(data)

@app.route("/delete", methods=['POST'])
def delete_fn():
    order_id = request.form.to_dict()['order_id']
    print(type(order_id), len(order_id), order_id)
    delete_db(order_id)
    return jsonify({"OK" : "200"})

@app.route("/update", methods=['POST'])
def update_fn():
    data = request.form.to_dict()
    print("EDIT #####################################", data)
    update_db(data)
    return jsonify(data)

@app.route("/login", methods=['POST'])
def login_fn():
    data = request.form.to_dict()
    print("LOGIN #####################################", data)
    admin = login(data)
    print("ADMIN: ", admin)
    return jsonify({'status' : admin}) # status : admin, emp, unk

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

def read_db_by_date(from_date, to_date):
    cursor = connect.pointer()[0]
    sql = "SELECT * FROM emp_sales WHERE timestamp BETWEEN '{0}' AND '{1}'".format(from_date, to_date)
    cursor.execute(sql)
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
    

def login(data):
    cursor = connect.pointer()[0]
    sql = "SELECT admin_status FROM login WHERE username = '{0}' AND password = '{1}'".format(data['username'], data['password'])
    print(sql)
    cursor.execute(sql)
    admin = cursor.fetchall()
    if admin:
        admin = admin[0][0]
        if admin:
            admin = 'admin'
        else:
            admin = 'emp'
    else:
        admin = 'null'
    return admin

def insert_db(data):
    keys = ""
    vals = []
    data['timestamp'] = datetime.strptime(data['timestamp'], '%m/%d/%Y, %H:%M:%S %p')
    for key, val in data.items():
        keys = keys + key + ", "
        vals.append(val)
    vals = tuple(vals)
    sql = "INSERT INTO emp_sales ({0}) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);".format(keys[:-2])
    print("@@@@@@@@@@@@@", (sql, vals))
    cursor, db = connect.pointer()
    cursor.execute(sql, vals)

    db.commit()

def delete_db(order_id):
    sql = "DELETE FROM emp_sales WHERE order_id = '{}'".format(order_id)
    cursor, db = connect.pointer()
    cursor.execute(sql)

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
    # read_db_by_date()
