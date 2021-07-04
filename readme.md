# Spending Tracker
I wanted to be able to track my spendings on my Smartphone without having to rely on Excel, Numbers, Google Sheets etc. while also having the ability to quickly analyze the spending data.

So I created a table in my PostgresDB which will store the data. To insert new values I will use iOS Shortcuts in combination with [Pythonista](http://omz-software.com/pythonista/) which will let me run Python Code on the go.

![screenshot](screenshots/process.png)

Normally I would use psycopg2 to connect to PostgresDB. However since it includes a lot of C code and C-based modules are not supported in Pythonista
I use [pg8000](https://pypi.org/project/pg8000/) instead.

