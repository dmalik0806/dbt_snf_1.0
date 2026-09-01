{{ 
    config(materialized='table')
}}

select a.empno,
a.ename,
a.job,
a.manager,
a.hiredate,
a.salary,
b.dept_name
from {{ ref('raw_emp') }} a 
join {{ source('raw','snf_dept')}} b on a.deptno = b.deptno