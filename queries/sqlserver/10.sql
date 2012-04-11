-- @(#)10.sql	2.1.8.1
-- TPC-H/TPC-R Returned Item Reporting Query (Q10)
-- Functional Query Definition
-- Approved February 1998
:b
:x
:o
:n 20
SELECT 
	C_CUSTKEY, 
	C_NAME, 
	SUM(L_EXTENDEDPRICE*(1-L_DISCOUNT)) AS REVENUE, 
	C_ACCTBAL,
	N_NAME, 
	C_ADDRESS, 
	C_PHONE, 
	C_COMMENT
FROM 
	CUSTOMER, 
	ORDERS, 
	LINEITEM, 
	NATION
WHERE 
	C_CUSTKEY = O_CUSTKEY 
	AND L_ORDERKEY = O_ORDERKEY 
	AND O_ORDERDATE>= ':1' 
	AND O_ORDERDATE < dateadd(mm, 3, ':1') 
	AND L_RETURNFLAG = 'R' 
	AND C_NATIONKEY= N_NATIONKEY
GROUP BY 
	C_CUSTKEY, 
	C_NAME, 
	C_ACCTBAL, 
	C_PHONE, 
	N_NAME, 
	C_ADDRESS, 
	C_COMMENT
ORDER BY 
	REVENUE DESC
:e