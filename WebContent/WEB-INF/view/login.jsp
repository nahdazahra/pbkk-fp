<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:layout>
	<jsp:attribute name="title">Masuk</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Masuk</div>
		
		<form method="POST">
			<div class="form-group">
    			<label for="email">Email</label>
    			<input type="text" name="email" class="form-control" id="email" placeholder="Email" />
  			</div>
			<div class="form-group">
    			<label for="password">Sandi</label>
    			<input type="text" name="password" class="form-control" id="password" placeholder="Sandi" />
  			</div>
  			<button type="submit" class="btn btn-primary">Masuk</button>
  		</form>
    </jsp:body>
</t:layout>