<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="/WEB-INF/lib/css/jquery.dataTables.min.css"></script>
<script src="/WEB-INF/lib/css/jquery.dataTables.css"></script>
<script src="/WEB-INF/lib/css/buttons.dataTables.min.css"></script>
<script src="/WEB-INF/lib/js/jquery.dataTables.min.js"></script>
<script src="/WEB-INF/lib/js/jquery.dataTables.js"></script>
<script type="text/javascript"src="https://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/datatables.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/buttons/1.5.0/js/dataTables.buttons.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script src="//cdn.datatables.net/buttons/1.5.0/js/buttons.html5.min.js"></script>
<style>

 table {
  		font-family: "Helvetica Neue", Helvetica, sans-serif;
   		width: 80%;
}
 td,th{
      	border: 1px solid gray;
    	//width: 25%;
      	text-align: left;
      	padding: 5px 10px;
      } 
  
</style>
</head>
<h1 align="center"><font color="red">Guide to Wireless Network Protocols</font></h1>
<h2 align="center" ><font color="green"><=======================================></font></h2>
<h2 align="center"><pre><font color="red">
	Below, we have compiled an extensive—but not exhaustive—list of Internet of Things (IoT) 
	protocols, in no particular order. If you are looking for an IoT network protocols comparison, 
	this is great place to start.But first, a word of caution: Do not worry so much about the 
	protocol until you know precisely what your application needs. Deciding you need 
	interoperability or a protocol led by a big name industry player before understanding 
	what kind of technology is right for your application simply will not do. Our advice? Get
	to know these IoT network protocols, but do not get your mind set on any of them until you 
	know what you need to accomplish.</font>
</pre></h2>
<%--  <form:form method="post" modelAttribute="protocol" action="${pageContext.request.contextPath}/addProtocol">
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
</form:form> --%>
</br>

<br>


<div class="wrapper ">
<table align="center">
<tr align="center">
<th colspan="4"><font color="red"><b align="center">Add,Search,Export operations</b></font></th>
</tr>
<tr>
<td>
<spring:url value="/hi" var="h"></spring:url>
<button><a href="${h}">Search By Name</a></button>
<%-- <form action="/hi">
   <input type="submit" value="Search By Name">
</form> --%>

</td>
<td>
<spring:url value="/searching" var="search"></spring:url>
<button><a href="${search}">Search By ID</a></button>
<%-- <form action="/searching">
    <input type="submit" value="Search By ID">
</form> --%>
</td>
<td>
<spring:url value="/adding" var="add"></spring:url>
<button><a href="${add}">Add New Protocol</a></button>
<%-- <form action="/adding">
    <input type="submit" value="Add New Protocol">
</form> --%>
</td>
<td>
<spring:url value="/report" var="xlsURL"></spring:url>
 <button><a href="${xlsURL}">Export to Excel</a></button>
</form>
</td>
</tr>
</table>
</div>
<div>
<h3 align="center"><font color="red"><b>PROTOCOL LIST</b></font></h3>

<c:if test="${!empty allProtocols}">
	<table class="tg" align="center">
	<tr>
		<th width="80" ><font color="red">Id</font></th>
		<th width="120"><font color="red">Protocol Name</font></th>
		<th width="120"><font color="red">Description</font></th>
		<th width="10"><font color="red">Edit</font></th>
		<th width="10"><font color="red">Delete</font></th>
	</tr>
	<c:forEach items="${allProtocols}" var="protocol">
		<tr>
			<td><font color="#0101DF">${protocol.id}</font></td>
			<td><font color="#17F714" >${protocol.protocolName}</font></td>
			<td><font color="#2D4525">${protocol.description}</font></td>
			<%--  <td><a href="<c:url value='/updateProtocol/${protocol.id}' />" ><font color="#2CD11D">Edit</font></a></td> --%>
			 <td><a href="<c:url value='/editProtocol/${protocol.id}' />" ><font color="#2CD11D">Edit</font></a></td>
			<td><a href="<c:url value='/deleteProtocol/${protocol.id}' />" ><font color="#F5142A">Delete</font></a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</div>
<script type="text/javascript">

$(document).ready(function(){
	$('#example').DataTable({
		 "paging": true,
		 dom: 'Bfrtip',
	        buttons: [
	            
	            'excelHtml5',
	        ]
		});
	});

</script>
<br>
<br>
<div style="display:none">
<table id="example" class="display" align="center">
<thead>
<tr>
<th>Id</th>
<th>Protocol Name </th>
<th>Description</th>
</tr>
</thead>
<tbody>
<c:forEach items="${allProtocols}" var="protocol">
<tr>
 <td><c:out value="${protocol.id}" /></td>
 <td><c:out value="${protocol.protocolName}" /></td>
  <td><c:out value="${protocol.description}" /></td>
</tr>
</c:forEach>

</tbody>
</table>
</div>
<%-- <div align="center" style="display:none">

<h1>Export to Excel</h1>
 <spring:url value="/report" var="xlsURL"></spring:url>
 <a href="${xlsURL}">Excel Document</a>

</div> --%>


</body>
</html>