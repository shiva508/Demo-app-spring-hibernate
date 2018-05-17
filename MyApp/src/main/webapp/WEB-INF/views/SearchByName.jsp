<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style> 
table {
  font-family: "Helvetica Neue", Helvetica, sans-serif;
   width: 80%;
}          
 td,th{
                border: 1px solid gray;
                width: 25%;
                text-align: left;
                padding: 5px 10px;
            }
</style>
<script type="text/javascript">
function validateForm() {
    var name = document.forms["myForm"]["searchName"].value;
    if (name == "") {
        alert("PLEASE ENTER PROTOCOL NAME");
        return false;
    }
}
</script>
</head>
<h1 align="center"><font color="red">SEARCH PAGE: USING PROTOCOL NAME</font></h1>
<br>
<br>
<form name="myForm" action="/searchbyname" method="get"  onsubmit="return validateForm()">
<table align="center">
<tr>
<th colspan="2"><font color="red"><b>Search Operation</b></font></th>
</tr>
<tr>
<td>Enter Name<input type="text" name="searchName" size="30" maxlength="30"></td>
</tr>

<tr>
<td colspan="2"><input type="submit" class="blue-button" /></td>
</tr>
</table>
</form>
</br>
<h3 align="center"><font color="red"><b>Protocol List</b></font></h3>
<br>
<c:if test="${!empty errorByName }">
<table class="tg">
		<tr>
			<th width="80"><font color="red">Id</font></th>
			<th width="120"><font color="red">Protocol Name</font></th>
			<th width="120"><font color="red">Description</font></th>
			<th width="60"><font color="red">Edit</font></th>
			<th width="60"><font color="red">Delete</font></th>
		</tr>
</table>
<h3>${errorByName}</h1>
</c:if>
<br>
	<table class="tg" align="center">
	<tr>
		<th width="80"><font color="red">Id</font></th>
		<th width="120"><font color="red">Protocol Name</font></th>
		<th width="120"><font color="red">Description</font></th>
		<th width="60"><font color="red">Edit</font></th>
		<th width="60"><font color="red">Delete</font></th>
	</tr>
	 <c:forEach items="${protocolByName}" var="protocol">
		<tr>
			<td><font color="#0101DF">${protocol.id}</font></td>
			<td><font color="#17F714" >${protocol.protocolName}</font></td>
			<td><font color="#2D4525">${protocol.description}</font></td>
			<td><a href="<c:url value='/editProtocol/${protocol.id}' />" ><font color="#2CD11D">Edit</font></a></td>
			<td><a href="<c:url value='/deleteProtocol/${protocol.id}' />" ><font color="#F5142A">Delete</font></a></td>
		</tr>
		</c:forEach>
		</table> 
		<div align="center">
<a href="/getAllProtocols" style="color:blue;">  Go to Main page</a> 
<br/>
<br/>
<a href="/searching" style="color:blue;">  Go to Search By Id Page</a>
<br>
<br>
<a href="/adding" style="color:blue;"> Go to Add Protocol Page </a>
</div>
</body>
</html>