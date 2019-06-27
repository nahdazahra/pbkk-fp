<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<t:layout>
	<jsp:attribute name="title">Edit Kategori</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Edit Kategori</div>
		
		<form method="POST">
			<div class="form-group">
   				<label path="nama">Nama</label>
   				<input type="text" class="form-control" id="kategori" name="kategori" placeholder="Kategori" value="${kategori.kategori}" />
  			</div>
  			<div class="form-group">
				
  			</div>
  			<button type="submit" class="btn btn-primary">Edit</button>
		</form>
    </jsp:body>
</t:layout>