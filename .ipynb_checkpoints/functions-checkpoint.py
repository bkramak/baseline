import psycopg2
import getpass

# logging into db

def db_login_and_conn():
    db=input('enter dbname: ')
    user=input('enter user: ')
    print('enter password: ')
    password=getpass.getpass()
    conn_str="host='localhost' dbname='"+db+"' user='"+user+"' password='"+password+"' \
    options='-c search_path=public,sandbox'"
    # the options allows us to add a schema called sandbox and be able to work in it
    conn=psycopg2.connect(conn_str)
    return conn
    