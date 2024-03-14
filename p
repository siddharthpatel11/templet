GUI Grid() layout

from tkinter import *
from tkinter import messagebox
def hello():
 messagebox.showinfo("Title", "MessageBox") top = Tk()
top.title("Grid Layout")
top.geometry("250x200")
L1 = Label(top, text="User Name").grid(row=1,column=1) E1 = Entry(top, bd =3).grid(row=1,column=2)
L2 = Label(top, text="Password").grid(row=2,column=1) E2 = Entry(top, bd =3).grid(row=2,column=2)
B = Button(top, text ="Login", command = hello).grid(row=3,column=1)
top.mainloop()
#############################3
pip install mariadb
#############################
Database connection

import mariadb as MySQLdb
db = MySQLdb.connect( host="localhost", user="root",password="", database="college")
cursor.execute("SELECT VERSION()")
print("Database version : %s " % data)
print(db)
print(cursor)
db.close() 
#######################
Database creaete

import mariadb as MySQLdb
conn = MySQLdb.connect(host="localhost", user="root", password="")
cursor.execute("DROP database IF EXISTS MyDatabase") 
sql = "CREATE database MYDATABASE"
cursor.execute(sql)
print("List of databases: ")
cursor.execute("SHOW DATABASES")
print(cursor.fetchall())
conn.close() 
###############################
Create table

import mariadb as MySQLdb
db = MySQLdb.connect( host="localhost", user="root",password="", database="mydatabase" )
cursor = db.cursor()
cursor.execute("DROP TABLE IF EXISTS EMPLOYEE") sql = """CREATE TABLE EMPLOYEE (
 FIRST_NAME CHAR(20) NOT NULL,
 LAST_NAME CHAR(20),
 AGE INT,
 INCOME FLOAT )"""
cursor.execute(sql)
db.close() 
###############################333
insert recode

import mariadb as MySQLdb
db = MySQLdb.connect(host="localhost", user="root", password="", database="mydatabase" )
cursor = db.cursor()
sql = """INSERT INTO EMPLOYEE(FIRST_NAME,
 LAST_NAME, AGE, INCOME)
 VALUES ('Malay', 'Dave', 42, 5000)""" try:
 cursor.execute(sql)
 db.commit()
except:
 db.rollback()
db.close()
#################################
Display recode
import mariadb as MySQLdb
myconn = MySQLdb.connect(host="localhost", user="root", passwd="", database="mydatabase")
cur = myconn.cursor()
try:
 cur.execute("select * from employee")
 result = cur.fetchall()
 for x in result:
 print(x)
except:
 myconn.rollback()
myconn.close()
##########################################
update recode

import mariadb as MySQLdb
db = MySQLdb.connect(host="localhost", user="root", passwd="", database="mydatabase")
cursor = db.cursor()
sql = "UPDATE EMPLOYEE SET AGE = AGE + 1
 WHERE SEX = '%c'" % ('M') try:
 cursor.execute(sql)
 db.commit()
except:
 db.rollback()
db.close()
####################
delete recode 
import mariadb as MySQLdb
db = MySQLdb.connect(host="localhost", user="root", passwd="", database="mydatabase")
cursor = db.cursor()
sql = "DELETE FROM EMPLOYEE WHERE AGE > '%d'" % (20) try:
 cursor.execute(sql)
 db.commit()
except:
 db.rollback()
db.close() 
