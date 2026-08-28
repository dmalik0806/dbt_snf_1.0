{{
    config(materialized='table')
}}
select
empno,
ename,
job,
mgr as manager,
hiredate,
sal as salary,
deptno
from
{{ source('raw','snf_emp') }}