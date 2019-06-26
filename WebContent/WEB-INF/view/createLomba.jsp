<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:layout>
	<jsp:attribute name="title">Buat Lomba</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Buat Lomba</div>
		
		<form:form method="POST" modelAttribute="lomba">
			<div class="form-group">
				<spring:bind path="nama">
    				<form:label path="nama">Nama</form:label>
    				<form:input type="text" path="nama" class="form-control ${status.error ? 'is-invalid' : ''}" id="nama" placeholder="Nama" />
    				<form:errors path="nama" cssClass="invalid-feedback" />
    			</spring:bind>
  			</div>
			<div class="form-group">
				<spring:bind path="deskripsi">
    				<form:label path="deskripsi">Deskripsi</form:label>
    				<form:textarea path="deskripsi" class="form-control ${status.error ? 'is-invalid' : ''}" id="deskripsi" placeholder="Deskripsi" />
    				<form:errors path="deskripsi" cssClass="invalid-feedback" />
    			</spring:bind>
  			</div>
			<div class="form-group">
				<spring:bind path="mulaiDaftar">
    				<form:label path="mulaiDaftar">Mulai daftar</form:label>
    				<form:input type="date" path="mulaiDaftar" class="form-control ${status.error ? 'is-invalid' : ''}" id="mulaiDaftar" placeholder="Mulai daftar" />
    				<form:errors path="mulaiDaftar" cssClass="invalid-feedback" />
    			</spring:bind>
  			</div>
			<div class="form-group">
				<spring:bind path="akhirDaftar">
    				<form:label path="akhirDaftar">Akhir daftar</form:label>
    				<form:input type="date" path="akhirDaftar" class="form-control ${status.error ? 'is-invalid' : ''}" id="akhirDaftar" placeholder="Akhir daftar" />
    				<form:errors path="akhirDaftar" cssClass="invalid-feedback" />
    			</spring:bind>
  			</div>
			<div class="form-group">
				<spring:bind path="mulaiLomba">
    				<form:label path="mulaiLomba">Mulai lomba</form:label>
    				<form:input type="date" path="mulaiLomba" class="form-control ${status.error ? 'is-invalid' : ''}" id="mulaiLomba" placeholder="Mulai lomba" />
    				<form:errors path="mulaiLomba" cssClass="invalid-feedback" />
    			</spring:bind>
  			</div>
			<div class="form-group">
				<spring:bind path="akhirLomba">
    				<form:label path="akhirLomba">Akhir lomba</form:label>
    				<form:input type="date" path="akhirLomba" class="form-control ${status.error ? 'is-invalid' : ''}" id="akhirLomba" placeholder="Akhir lomba" />
    				<form:errors path="akhirLomba" cssClass="invalid-feedback" />
    			</spring:bind>
  			</div>
  			<div class="form-group">
				
  			</div>
  			<button type="submit" class="btn btn-primary">Ajukan</button>
		</form:form>
    </jsp:body>
</t:layout>