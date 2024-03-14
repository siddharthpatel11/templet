config 
import MySQLdb as mdb
import warnings
def createdb_mysql():
    db = mdb.connect(host="localhost", user="root", passwd="PASSWORD")
    db1 = db.cursor()
    with warnings.catch_warnings():
        warnings.simplefilter('ignore')
        db1.execute('CREATE DATABASE IF NOT EXISTS testdb')
        print('Create Database testdb')
try:
    con = mdb.connect('localhost', 'root', 'PASSWORD', 'testdb')
    cur = con.cursor()
    cur.execute("SELECT VERSION()")
    ver = cur.fetchone()
    print "Database version : %s " % ver
except mdb.Error, e:
    print "Error %d: %s" % (e.args[0], e.args[1])
    sys.exit(1)
createdb_mysql()
##############################
crud
import MySQLdb as mdb
import sys
import warnings
from db_config import con
def createTable(con):
    with con:
        cur = con.cursor()
        cur.execute("DROP TABLE IF EXISTS Citizen")
        with warnings.catch_warnings():
            warnings.simplefilter('ignore')
        cur.execute("CREATE TABLE Citizen(Id INT PRIMARY KEY AUTO_INCREMENT, Firstname VARCHAR(25),Lastname VARCHAR(25), City VARCHAR(25), State VARCHAR(25), Country VARCHAR(25));")
        print 'Citizen Table created'
def insertTable(con):
    with con:
        try:
            cur = con.cursor()
            with warnings.catch_warnings():
                warnings.simplefilter('ignore')
                cur.execute("CREATE TABLE IF NOT EXISTS Citizen(Id INT PRIMARY KEY AUTO_INCREMENT, Firstname VARCHAR(25),Lastname VARCHAR(25), City VARCHAR(25), State VARCHAR(25), Country VARCHAR(25));")
                print 'Citizen Table created'
                warnings.filterwarnings('ignore', 'unknown table')

            Id = 0
            Firstname = raw_input("Enter Your First Name ")
            Lastname = raw_input("Enter Your Last Name")
            City = raw_input("Enter Your City")
            State = raw_input("Enter Your State")
            Country = raw_input("Enter Your Country")
            cur.execute("INSERT INTO Citizen VALUES (%s, %s, %s, %s, %s, %s)",
                        (Id, Firstname, Lastname, City, State, Country))
            print "Record Inserted"
        except Exception as e:
            print e
            
# RETRIEVE TABLE ROWS
def retrieveTable(con):
    with con:
        cur = con.cursor(mdb.cursors.DictCursor)
        cur.execute("SELECT * FROM Citizen")

        rows = cur.fetchall()

        for row in rows:
            print row["Id"], row["Firstname"], row["Lastname"], row["City"], row["State"], row["Country"]
            
# UPDATE ROW
def updateRow(con):
    with con:
        try:
            cur = con.cursor()
            cur = con.cursor(mdb.cursors.DictCursor)
            cur.execute("SELECT * FROM Citizen")
            rows = cur.fetchall()
            for row in rows:
                print 'Table Data:', row["Id"], row["Firstname"], row["Lastname"], row["City"], row["State"], row["Country"]
            id = input("Enter ID for Update Record")
            fname = raw_input('Enter First Name For Update record')
            lname = raw_input('Enter Last Name For Update record')
            city = raw_input('Enter City Name For Update record')
            state = raw_input('Enter State Name For Update record')
            con = raw_input('Enter Country Name For Update record')
            cur.execute("UPDATE Citizen SET Firstname = %s, Lastname = %s, City = %s, State = %s, Country = %s  WHERE Id = %s",
                        (fname, lname, city, state, con, id))

            print "Number of rows updated:",  cur.rowcount
            if cur.rowcount == 0:
                print 'Record Not Updated'
        except TypeError as e:
            print 'ID Not Exist '

 # DELETE ROW
def deleteRow(con):
    with con:

        try:
            cur = con.cursor()
            cur = con.cursor(mdb.cursors.DictCursor)
            cur.execute("SELECT * FROM Citizen")
            rows = cur.fetchall()
            for row in rows:
                print 'Table Data:', row["Id"], row["Firstname"], row["Lastname"], row["City"], row["State"], row["Country"]

            id = raw_input("Enter ID for Delete Record")
            cur.execute("DELETE FROM Citizen WHERE Id = %s", id)
            print "Number of rows deleted:", cur.rowcount

        except TypeError as e:
            print 'ID Not Exist '

############################
user

#-*- coding: utf8 -*-

from db_config import con
from db_query import *
import sys
import MySQLdb as mdb


'''Menu for User Input '''


def choice():
    print "1. Create Table"
    print "2. Insert Data"
    print "3. Read Data"
    print "4. Update Data"
    print "5. Delete Data"
    print "6. Quit"

    ch = input("Enter Your Choice")
    if ch == 1:
        createTable(con)
        choice()
    elif ch == 2:
        insertTable(con)
        choice()
    elif ch == 3:
        retrieveTable(con)
        choice()
    elif ch == 4:
        updateRow(con)
        choice()
    elif ch == 5:
        deleteRow(con)
        choice()
    elif ch == 6:
        exit()
        pass
    else:
        print "Please Enter Valid Input"

choice()
