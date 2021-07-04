from secrets import secrets as sec
import pg8000.native

def insert_into_spending(amount, item):
    """Open Postgres connection and insert amount and item into budget.spending.

    Args:
        amount (decimal): Price of item
        item (str): Product/ Service bought

    Returns:
        True: Query execution successful
        False: Query execution failure
    """

    con = pg8000.native.Connection(sec.db_user, host=sec.db_host, database=sec.db_name, port=sec.db_port, password=sec.db_password)

    try:
        con.run(f'''insert into budget.spending
                    (amount, item)
                    values
                    ({amount}, '{item}');''')
        
        print(f'{item} for {amount} EUR inserted')
        return True

    except Exception as e:
        print(e)
        return False

