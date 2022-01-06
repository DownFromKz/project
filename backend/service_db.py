from psycopg2 import connect, OperationalError, ProgrammingError
from psycopg2.extras import RealDictCursor
import const

def create_connection():
    try:
        db_connect = connect(
            database = const.DATABASE,
            user = const.USER,
            password = const.PASSWORD,
            host = const.HOST,
            port = const.PORT
        )
        db_connect.autocommit = True
    except OperationalError as er:
        db_connect = None
        print(f'Ошибка: {er}')
    return db_connect

def execute_query(query: str, *args):
    con = create_connection()
    if not con:
        return None
    cursor = con.cursor(cursor_factory=RealDictCursor)
    try:   
        cursor.execute(query, args)
        res = cursor.fetchall()
    except ProgrammingError:
        res = None
    except OperationalError as er:
        print(f'Ошибка: {er}')
        res = None
    finally:
        con.close()
    return res
