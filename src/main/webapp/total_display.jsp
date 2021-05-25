<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement,java.sql.DriverManager,org.json.JSONObject" %>
<%@ page import="java.sql.ResultSet,java.net.http.HttpRequest,java.net.URI,java.net.http.HttpClient,java.net.http.HttpResponse" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page errorPage="error_page.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Covid information</title>







        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="newCascadeStyleSheet2.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>

    </head>
    <body>
    
    <%
      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); 

    
    //calling api
    String url="https://corona.lmao.ninja/v2/all";
	HttpRequest request2=HttpRequest.newBuilder().GET().uri(URI.create(url)).build();
	HttpClient client=HttpClient.newBuilder().build();
	HttpResponse response2=client.send(request2, HttpResponse.BodyHandlers.ofString());

	JSONObject obj = new JSONObject(response2.body().toString());

	
	
	
String A[]=new String[16];

A[0]=obj.get("updated").toString();
A[1]=obj.get("cases").toString();
A[2]=obj.get("todayCases").toString();
A[3]=obj.get("deaths").toString();
A[4]=obj.get("todayDeaths").toString();
A[5]=obj.get("recovered").toString();
A[6]=obj.get("todayRecovered").toString();
A[7]=obj.get("active").toString();
A[8]=obj.get("critical").toString();
A[9]=obj.get("casesPerOneMillion").toString();
A[10]=obj.get("deathsPerOneMillion").toString();
A[11]=obj.get("tests").toString();
A[12]=obj.get("testsPerOneMillion").toString();
A[13]=obj.get("affectedCountries").toString();
A[14]=obj.get("activePerOneMillion").toString();
A[15]=obj.get("recoveredPerOneMillion").toString();






//out.print(A[1]+A[0]+ A[2]+ A[3]+ A[4]+ A[5]+A[6]);






%>

        <%@include file="navbar.jsp" %>

        <main class="primary-background  banner-background"  style="padding-bottom: 80px;">

 
 <div class="row">
 
 
 
   
  <div class="col-mb-6 ">
    <div class="h-100" style="width: 60rem;">
      <div class="card-body">
   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="https://source.unsplash.com/1600x960/?vaccine" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://source.unsplash.com/1600x960/?corona" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://source.unsplash.com/1600x960/?Health" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
      </div>
    </div>
 
 
 
 
 
 
 
 
  <div class="col-mb-6">
    <div class="card style="width: 60rem;">
    
      <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br>
                            Todays Reports
                        </div>
      <div class="card-body">
                             <table style="width:100%">
 
  <tr>
    <td>   <label > updated :     <h5><% out.print(A[0]); %></h5></label></td>
    <td>  <label > Cases :     <h5><% out.print(A[1]); %></h5></label>
</td>
  </tr>
  
  <tr>
    <td><label > Todays Cases :     <h5><% out.print(A[2]); %></h5></label>
</td>
    <td><label > Death :     <h5><% out.print(A[3]); %></h5></label>
</td>
  </tr>
  
  <tr>
    <td><label > Todays Death :     <h5><% out.print(A[4]); %></h5></label>
</td>
    <td><label > Recovered :     <h5><% out.print(A[5]); %></h5></label>
</td>
  </tr>
  <tr>
    <td><label > todayRecovered :     <h5><% out.print(A[6]); %></h5></label>
</td>
    <td><label > active :     <h5><% out.print(A[7]); %></h5></label>
</td>
  </tr>
  <tr>
    <td><label > critical :     <h5><% out.print(A[8]); %></h5></label>
</td>
    <td><label > casesPerOneMillion :     <h5><% out.print(A[9]); %></h5></label>
</td>
  </tr>
  <tr>
    <td><label > deathsPerOneMillion :     <h5><% out.print(A[10]); %></h5></label>
</td>
    <td><label > tests :     <h5><% out.print(A[11]); %></h5></label>
</td>
  </tr>
  <tr>
    <td><label > testsPerOneMillion :     <h5><% out.print(A[12]); %></h5></label>
</td>
    <td><label > Affected Countries :     <h5><% out.print(A[13]); %></h5></label>
</td>
  </tr>
  <tr>
    <td><label > activePerOneMillion :     <h5><% out.print(A[14]); %></h5></label>
</td>
    <td><label > recoveredPerOneMillion :     <h5><% out.print(A[15]); %></h5></label>
</td>
  </tr>
</table>
      </div>
    </div>
  </div>
  
  
  

    
    
    
    
  </div>
</div>
        </main>


        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
 
    </body>
</html>
