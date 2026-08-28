with emp_mgr_cte as
(
    select empno, ename, 'No Manager' as manager, 1 as level
    from {{ ref('raw_emp')  }} where manager is null
    union all
    select b.empno,b.ename,a.ename, 1 + level
    from emp_mgr_cte a 
    join {{ ref('raw_emp')  }} b on a.empno=b.manager
)
select * from emp_mgr_cte