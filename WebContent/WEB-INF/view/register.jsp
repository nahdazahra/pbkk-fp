<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:layout>
	<jsp:attribute name="title">Daftar</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Daftar</div>
		
		<form:form method="POST" modelAttribute="user">
			<div class="form-group">
                <spring:bind path="name">
        			<form:label path="name">Nama</form:label>
        			<form:input type="text" path="name" class="form-control ${status.error ? 'is-invalid' : ''}" id="name" placeholder="Nama" />
                    <form:errors path="name" cssClass="invalid-feedback" />
                </spring:bind>
  			</div>
			<div class="form-group">
                <spring:bind path="email">
        			<form:label path="email">Email</form:label>
        			<form:input type="text" path="email" class="form-control ${status.error ? 'is-invalid' : ''}" id="email" placeholder="Email" />
                    <form:errors path="email" cssClass="invalid-feedback" />
                </spring:bind>
  			</div>
			<div class="form-group">
                <spring:bind path="password">
        			<form:label path="password">Sandi</form:label>
        			<form:input type="password" path="password" class="form-control ${status.error ? 'is-invalid' : ''}" id="password" placeholder="Sandi" />
                    <form:errors path="password" cssClass="invalid-feedback" />
                </spring:bind>
  			</div>
  			<button type="submit" class="btn btn-primary">Daftar</button>
		</form:form>
    </jsp:body>
</t:layout>