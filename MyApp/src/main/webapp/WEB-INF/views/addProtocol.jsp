<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

table {
  font-family: "Helvetica Neue", Helvetica, sans-serif;
   width: 75%;
}
 td,th{
      border: 1px solid gray;
      width: 25%;
      text-align: left;
      padding: 5px 10px;
      } 
  
</style>
</head>
<body>
<br>
<br>
<h1 align="center"><font color="red">ADD NEW PROTOCOL PAGE</font></h1>
<form:form method="post" modelAttribute="protocol" action="${pageContext.request.contextPath}/addProtocol">
<table align="center">
		<tr >
			<th align="center" colspan="2"><font color="red"><b>Add Protocol</b></font></th>
		</tr>
		
		<tr>
			<form:hidden path="id" />
          	<td><form:label path="protocolName">Protocol Name</form:label></td>
         	<td><form:input path="protocolName" size="30" maxlength="30"></form:input></td>
         	<td border="0"><form:errors path="protocolName" ></form:errors></td>
        </tr>
        
		<tr>
		<td><form:label path="description">Description:</form:label></td>
         <td><form:input path="description" size="100" maxlength="300"></form:input></td>
         <td border="0"><form:errors path="description" ></form:errors></td>
		</tr>
		
		<tr>
			<td colspan="2"><input type="submit"/></td>
		</tr>
	</table> 
</form:form>
<div align="center">
<a href="/getAllProtocols" style="color:blue;"> Go to Main page  </a> 
<br/>
<br/>
<a href="/hi" style="color:blue;"> Go to Search By Name Page </a>
<br>
<br>
<a href="/searching" style="color:blue;"> Go to Search By Id Page </a>
</div>
</body>
</html>