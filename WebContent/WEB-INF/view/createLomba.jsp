<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<t:layout>
	<jsp:attribute name="title">Buat Lomba</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Buat Lomba</div>
		
		<form id="lomba" action="/lombaku/lomba/new" method="POST">
			<div class="form-group">
    			<label for="nama">Nama</label>
    			<input id="nama" name="nama" placeholder="Nama" type="text" class="form-control " value=""/>
  			</div>
  			
			<div class="form-group">	
    			<label for="deskripsi">Deskripsi</label>
				<textarea id="deskripsi" name="deskripsi" placeholder="Deskripsi" class="form-control "></textarea>
  			</div>
  			
			<div class="form-group">	
    			<label for="mulaiDaftar">Mulai daftar</label>
    			<input id="mulaiDaftar" name="mulaiDaftar" placeholder="Mulai daftar" type="date" class="form-control " value=""/>
  			</div>
  			
			<div class="form-group">	
    			<label for="akhirDaftar">Akhir daftar</label>
    			<input id="akhirDaftar" name="akhirDaftar" placeholder="Akhir daftar" type="date" class="form-control " value=""/>
  			</div>
  			
			<div class="form-group">	
    			<label for="mulaiLomba">Mulai lomba</label>
    			<input id="mulaiLomba" name="mulaiLomba" placeholder="Mulai lomba" type="date" class="form-control " value=""/>
  			</div>
  			
			<div class="form-group">
    			<label for="akhirLomba">Akhir lomba</label>
    			<input id="akhirLomba" name="akhirLomba" placeholder="Akhir lomba" type="date" class="form-control " value=""/>
  			</div>
  			
  			<div class="form-group">
				<label for="kategori">Kategori</label>
				<select name="kategori" class="form-control" id="kategori">
					<option value="" selected disabled>-- PILIH KATEGORI --</option>
					<c:forEach items="${kategoriList}" var="kategori">
					<option value="${kategori.id}">${kategori.kategori}</option>
					</c:forEach>
				</select>
  			</div>
  			
  			<div class="form-group">
				
  			</div>
  			<button type="submit" class="btn btn-primary">Ajukan</button>
		</form>
    </jsp:body>
</t:layout>