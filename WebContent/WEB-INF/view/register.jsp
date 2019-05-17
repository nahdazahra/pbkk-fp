<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:layout>
	<jsp:attribute name="title">Daftar</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Daftar</div>
		
		<form:form method="POST" modelAttribute="user">
			<c:if test="${not empty error}">
				<div class="text-danger mb-3">${error}</div>
			</c:if>
			<div class="form-group">
    			<form:label path="name">Nama</form:label>
    			<form:input type="text" path="name" class="form-control" id="name" placeholder="Nama" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="email">Email</form:label>
    			<form:input type="text" path="email" class="form-control" id="email" placeholder="Email" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="password">Sandi</form:label>
    			<form:input type="password" path="password" class="form-control" id="password" placeholder="Sandi" required="required" />
  			</div>
  			<button type="submit" class="btn btn-primary">Daftar</button>
		</form:form>
    </jsp:body>
</t:layout>