<%-- 
    Document   : processInsuranceQuo
    Created on : 21 Apr 2026, 2:38:46 pm
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
            <%
                //Retrieve form data
                String icno = request.getParameter("icno");
                String name = request.getParameter("name");
                String coverageType = request.getParameter("coverageType");
                String ncdStr = request.getParameter("ncd");

                double price = 0;
                double ncd = 0;

                try{
                    price = Double.parseDouble(request.getParameter("price"));
                    ncd = Double.parseDouble(ncdStr);
                } catch (Exception e){
                    price = 0;
                    ncd = 0;
                }

                //Business Logic
                double rate = 0;
                String coverageDisplay = "";

                if("comprehensive".equals(coverageType)){
                    rate = 0.05; //5%
                    coverageDisplay = "Comprehensive";
                }else{
                    rate = 0.03; //3%
                    coverageDisplay = "Third Party";
                }

                //Base insrance calculation
                double insurance = price * rate;

                //Apply NCD discount
                double afterNCD = insurance - (insurance * ncd);
                //Add 8% SST
                double sst = afterNCD * 0.08;
                double finalAmount = afterNCD + sst;
            %>
            <div class="result-box">
                <div class="result-group">
                    <label>IC No:</label>
                    <p> <%= icno %> </p>
                </div>
                
                <div class="result-group">
                    <label>Name:</label>
                    <p> <%= name %> </p>
                </div>
                
                <div class="result-group">
                    <label>Market Price(RM):</label>
                    <p> <%= price %> </p>
                </div>
                
                <div class="result-group">
                    <label>Coverage Type:</label>
                    <p> <%= coverageDisplay %> </p>
                </div>
                
                <div class="result-group">
                    <label>NCD:</label>
                    <p> <%= ncd %> </p>
                </div>
                
                <hr style="border: 1px solid black;">
                
                <div class="result-group">
                    <label>Base Insurance:</label>
                    <p> <%= insurance %> </p>
                </div>
                
                <div class="result-group">
                    <label>After NCD:</label>
                    <p> <%= afterNCD %> </p>
                </div>
                
                <div class="result-group">
                    <label>SST (8%):</label>
                    <p> <%= sst %> </p>
                </div>
                
                <div class="result-group" >
                    <label style="font-weight: bold">Final Insurance Amount:</label>
                    <p style="font-weight: bold"> <%= finalAmount %> </p>
                </div>
                
                <a style="text-decoration: none;" href="insuranceQuotation.jsp" class="btn btn-back">Back</a>
            </div>
                
                
        </div>
    </body>
</html>
