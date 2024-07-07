<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Address</title>
<%@ include file="components/allCSS.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@ include file="components/Navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                <h4 class="text-center text-success">Add Address</h4>
                    <form action="">
                        <div class="form-row">
                            <div class="form-group col-md-6">
							<label for="inputAddress4">Address</label> 
							<input type="text"
							class="form-control" id="inputAddress4">
						    </div>
						    <div class="form-group col-md-6">
							<label for="inputAddress4">Landmark</label> 
							<input type="text"
							class="form-control" id="inputAddress4">
						    </div>
                        </div>
                        
                        <div class="form-row">
                            <div class="form-group col-md-4">
							 <label for="inputEmail4">City</label> 
							 <input type="text"
							 class="form-control" id="inputEmail4">
							</div>
							<div class="form-group col-md-4">
							 <label for="inputEmail4">State</label> 
							 <input type="text"
							 class="form-control" id="inputEmail4">
							</div>
							<div class="form-group col-md-4">
							 <label for="inputEmail4">Pincode</label> 
							 <input type="text"
							 class="form-control" id="inputEmail4">
							</div>
                        </div>
                        
                       <div class="text-center">
                         <button class="btn btn-warning text-white">Add Address</button>
                       </div> 
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>