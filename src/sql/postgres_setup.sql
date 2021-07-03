-- create spending table
CREATE TABLE budget.spending (
	spend_id serial NOT NULL,
	amount numeric(16,2) NULL,
	item varchar NULL,
	category varchar NULL,
	dt_spend timestamp NULL DEFAULT CURRENT_TIMESTAMP
);

-- create a budget table
CREATE OR REPLACE FUNCTION 
f_month( ts timestamp )
RETURNS varchar
AS $CODE$
BEGIN
    RETURN to_char(ts, 'month');
END
$CODE$
LANGUAGE plpgsql IMMUTABLE;

CREATE OR REPLACE FUNCTION 
f_year( ts timestamp )
RETURNS varchar
AS $CODE$
BEGIN
    RETURN cast(extract(year from ts) as varchar);
END
$CODE$
LANGUAGE plpgsql IMMUTABLE;

CREATE TABLE budget.budget (
	time_key timestamp NOT NULL,
	"month" varchar NULL GENERATED ALWAYS AS (f_month(time_key)) STORED,
	"year" varchar NULL GENERATED ALWAYS AS (f_year(time_key)) STORED,
	budget numeric(16,2) NULL
);
