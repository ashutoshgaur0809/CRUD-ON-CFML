<cfif structKeyExists(url,"Emp_id") and url.Emp_id GT 0 and url.del EQ 1>
    <cfquery name="delEmp">
        delete from employees_new_one 
        where EMPLOYEE_ID = #url.Emp_ID#; 
    </cfquery>
</cfif>

<cflocation url = "index.cfm" >
