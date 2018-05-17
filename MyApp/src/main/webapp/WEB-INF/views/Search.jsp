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
<script>
function validateForm() {
    var id = document.forms["myForm"]["id"].value;
    if (id == "" || isNaN(id)) {
        alert("MUST ENTER A NUMBER");
        return false;
    }
}
</script>
</head>
<h1 align="center"><font color="red">SEARCH PAGE: USING ID</font></h1>
<br>
<br>
<form name="myForm" action="/search" method="get" onsubmit="return validateForm()">
<table align="center">
<tr>
<th colspan="2"><font color="red"><b>Search Operation</b></font></th>
</tr>
<tr>
<td>Enter ID<input type="text" name="id" size="30" maxlength="30"></td>
</tr>

<tr>
<td colspan="2"><input type="submit" class="blue-button" ></input></td>
</tr>
</table>
</form>
</br>
<h2 align="center"><font color="red"><b>Protocol List</b></font> </h2>
<br>
<c:if test="${!empty idnotfound}">
<table class="tg" align="center">
		<tr>
			<th width="80"><font color="red">Id</font></th>
			<th width="120"><font color="red">Protocol Name</font></th>
			<th width="120"><font color="red">Description</font></th>
			<th width="60"><font color="red">Edit</font></th>
			<th width="60"><font color="red">Delete</font></th>
		</tr>
		</table>
<h3 align="center"><font color="red">${idnotfound }</font></h3>
</c:if>
<c:if test="${!empty searchResult}" >
	<table class="tg" align="center">
		<tr>
			<th width="80"><font color="red">Id</font></th>
			<th width="120"><font color="red">Protocol Name</font></th>
			<th width="120"><font color="red">Description</font></th>
			<th width="60"><font color="red">Edit</font></th>
			<th width="60"><font color="red">Delete</font></th>
		</tr>
		<tr>
			<td><font color="#0101DF">${searchResult.id}</font></td>
			<td><font color="#17F714" >${searchResult.protocolName}</font></td>
			<td><font color="#2D4525">${searchResult.description}</font></td>
			<td><a href="<c:url value='/editProtocol/${searchResult.id}' />" ><font color="#2CD11D">Edit</font></a></td>
			<td><a href="<c:url value='/deleteProtocol/${searchResult.id}' />" ><font color="#F5142A">Delete</font></a></td>
		</tr>
	</table>
</c:if>
<div align="center">
<a href="/getAllProtocols" style="color:blue;"> Go to Main page  </a> 
<br/>
<br/>
<a href="/hi" style="color:blue;"> Go to Search By Name Page </a>
<br>
<br>
<a href="/adding" style="color:blue;"> Go to Add Protocol Page </a>
</div>
</body>
</html>