
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
</head>
<body>
    <cfoutput>
 
    <cfset Emp_ID = 0> 
    <cfset fname=""> 
    <cfset lname=""> 
    <cfset email=""> 
    <cfset salary=""> 
    <cfif structKeyExists(url,"Emp_id") and url.Emp_id GT 0 >
        <cfquery name="Get_Emp_By_Id">
            SELECT EMPLOYEE_ID,FIRST_NAME, LAST_NAME, EMAIL, SALARY 
            FROM employees_new_one
            where EMPLOYEE_ID = #url.Emp_id#;
        </cfquery>
        

        <!--- Query ka output ho tab yani Query kuch return --->
        <cfif Get_Emp_By_Id.recordCount GT 0>
            <cfset fname=#Get_Emp_By_Id.FIRST_NAME#> 
            <cfset lname=#Get_Emp_By_Id.LAST_NAME#> 
            <cfset email=#Get_Emp_By_Id.EMAIL#> 
            <cfset salary=#Get_Emp_By_Id.SALARY#> 
            <cfset Emp_ID = Get_Emp_By_Id.EMPLOYEE_ID> 
        </cfif>
    </cfif>
    
    <div class="container">
    <div class="modal-header">
        <h5 class="modal-title p-5" id="exampleModalLabel">Insert in Table</h5>
        
    </div>
    <div class="modal-body">
        <div class="container mt-3">
            <cfform name="insertEmp" action="add.cfm">
                <cfinput type="hidden" name="Emp_ID" class="form-control" value="#Emp_ID#"> 
                First Name : 
                <cfinput type="text" name="fname" class="form-control" value="#fname#"> <br> <br>
                Last Name : 
                <cfinput type="text" name="lname" class="form-control" value="#lname#"> <br> <br>
                Email :
                <cfinput type="text" name="email" class="form-control" value="#email#"> <br> <br>
                Salary :
                <cfinput type="text" name="salary" class="form-control" value="#salary#"> <br> <br> 
            
                
                
            
                <cfinput type="submit" name="btnSubmit" value="Submit" class="btn btn-primary">
            </cfform>
        
        </div>
    </div>

    </div>
    </div>
</cfoutput>

</body>
</html>
