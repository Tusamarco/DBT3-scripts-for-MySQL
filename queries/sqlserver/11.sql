-- @(#)11.sql	2.1.8.1
-- TPC-H/TPC-R Important Stock Identification Query (Q11)
-- Functional Query Definition
-- Approved February 1998
:b
:x
:o
SELECT 
	PS_PARTKEY, 
	SUM(PS_SUPPLYCOST*PS_AVAILQTY) AS VALUE
FROM 
	PARTSUPP, 
	SUPPLIER, 
	NATION
WHERE 
	PS_SUPPKEY = S_SUPPKEY 
	AND S_NATIONKEY = N_NATIONKEY 
	AND N_NAME = ':1'
GROUP BY 
	PS_PARTKEY HAVING 
		SUM(PS_SUPPLYCOST*PS_AVAILQTY) > (
			SELECT 
				SUM(PS_SUPPLYCOST*PS_AVAILQTY) * :2
			FROM 
				PARTSUPP, 
				SUPPLIER, 
				NATION
			WHERE 
				PS_SUPPKEY = S_SUPPKEY 
				AND S_NATIONKEY = N_NATIONKEY 
				AND N_NAME = ':1'
			)
ORDER BY 
	VALUE DESC
:e