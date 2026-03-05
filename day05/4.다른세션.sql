SELECT * FROM dept_tcl;

update DEPT_TCL
   set loc = 'SEOUL'
 where deptno = 50;


delete from  DEPT_TCL
 where deptno = 60;
 
 insert into DEPT_TCL (deptno, dname, loc)
 values (90, 'TEST', 'TEST');