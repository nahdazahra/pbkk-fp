<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:layout>
	<jsp:attribute name="title">Daftar</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Daftar</div>
		
		<form:form method="POST" modelAttribute="user">
			<div class="form-group">
    			<form:label path="name">Nama</form:label>
    			<form:input type="text" path="name" class="form-control" id="name" placeholder="Nama" />
  			</div>
			<div class="form-group">
    			<form:label path="email">Email</form:label>
    			<form:input type="text" path="email" class="form-control" id="email" placeholder="Email" />
  			</div>
			<div class="form-group">
    			<form:label path="password">Sandi</form:label>
    			<form:input type="password" path="password" class="form-control" id="password" placeholder="Sandi" />
  			</div>
  			<button type="submit" class="btn btn-primary">Daftar</button>
		</form:form>
    </jsp:body>
</t:layout>