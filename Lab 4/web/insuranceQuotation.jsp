<%-- 
    Document   : insuranceQuotation
    Created on : 21 Apr 2026, 2:18:08 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <h1>Insurance Quotation</h1>
            <form class="card" action="processInsuranceQuo.jsp" method="post">
                <fieldset>
                    <legend>Insurance Calculation</legend>
                    <label>IC No*</label>
                    <input type="text" name="icno" id="icno" size="14" placeholder="E.g. 821210-05-3478" required>
                    
                    <label>Name*</label>
                    <input type="text" name="name" id="name" size="40" placeholder="Enter name" required>
                    
                    <label>Market Price*</label>
                    <input type="number" name="price" id="price" min="0" placeholder="Price" required>
                    
                    <label>Coverage Type</label>
                    <select id="coverageType">
                        <option value="thirdParty">Third Party</option>
                        <option value="comprehensive">Comprehensive</option>
                    </select>
                    
                    <label>No Claims Discount (NCD)</label>
                    <select id="ncd" name="ncd">
                        <option value="10">10%</option>
                        <option value="20">20%</option>
                        <option value="30">30%</option>
                    </select>
                    
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Submit</button>
                        <button type="reset" class="btn btn-cancel">Cancel</button>
                   </div>
                </fieldset>
                
            </form>
            
        </div>
    </body>
</html>
