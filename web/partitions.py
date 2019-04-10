from flask import Flask, render_template
import pymysql

app = Flask(__name__)

class Database:
    def __init__(self):
        host = "10.0.0.6"
        user = "baseball"
        password = "baseball"
        db = "baseball"

        self.con = pymysql.connect(host=host, user=user, password=password, db=db, cursorclass=pymysql.cursors.DictCursor)
        self.cur = self.con.cursor()

    def list_partitions(self):
        self.cur.execute("SELECT load_date, mysql_fingerprint, redshift_fingerprint FROM staged_partitions WHERE mysql_fingerprint != redshift_fingerprint ORDER BY load_date")
        result = self.cur.fetchall()

        return result

@app.route('/')
def partitions():

    def db_query():
        db = Database()
        parts = db.list_partitions()

        return parts

    res = db_query()

    return render_template('partitions.html', result=res, content_type='application/json')
