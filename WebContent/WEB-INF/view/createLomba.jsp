<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<t:layout>
	<jsp:attribute name="title">Buat Lomba</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Buat Lomba</div>
		
		<form:form method="POST" modelAttribute="lomba">
			<div class="form-group">
    			<form:label path="nama">Nama</form:label>
    			<form:input type="text" path="nama" class="form-control" id="nama" placeholder="Nama" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="deskripsi">Deskripsi</form:label>
    			<form:textarea path="deskripsi" class="form-control" id="deskripsi" placeholder="Deskripsi" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="mulaiDaftar">Mulai daftar</form:label>
    			<form:input type="date" path="mulaiDaftar" class="form-control" id="mulaiDaftar" placeholder="Mulai daftar" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="akhirDaftar">Akhir daftar</form:label>
    			<form:input type="date" path="akhirDaftar" class="form-control" id="akhirDaftar" placeholder="Akhir daftar" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="mulaiLomba">Mulai lomba</form:label>
    			<form:input type="date" path="mulaiLomba" class="form-control" id="mulaiLomba" placeholder="Mulai lomba" required="required" />
  			</div>
			<div class="form-group">
    			<form:label path="akhirLomba">Akhir lomba</form:label>
    			<form:input type="date" path="akhirLomba" class="form-control" id="akhirLomba" placeholder="Akhir lomba" required="required" />
  			</div>
  			<button type="submit" class="btn btn-primary">Ajukan</button>
		</form:form>
    </jsp:body>
</t:layout>