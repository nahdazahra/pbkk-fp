<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="id_ID" scope="session" />

<t:layout>
	<jsp:attribute name="title">Kategori Lomba</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Kategori Lomba</div>
			<button class="btn btn-success" data-toggle="modal" data-target="#kategoriModal">Buat Kategori</button>
        	<table class="table">
  				<thead>
    				<tr>
      					<th scope="col">Kategori</th>
      					<th></th>
   					 </tr>
 				</thead>
  				<tbody>
        <c:forEach items="${kategoriList}" var="kategori">
    				<tr>
      					<td>${kategori.kategori}</td>
      					<td>
      					<a class="btn btn-info"
							href="<c:url value="/kategori/edit/${kategori.id}" />">Edit Kategori</a>
						<a class="btn btn-danger"
							href="<c:url value="/kategori/delete/${kategori.id}" />">Hapus Kategori</a>
						</td>
    				</tr>
    	</c:forEach>
  				</tbody>
			</table>
			
			
		<div class="modal fade" tabindex="-1" role="dialog" id="kategoriModal">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Buat Kategori</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <form action="<c:url value="/kategori/create" />" method="POST">
			      <div class="modal-body">
			        	<label>Nama Kategori</label>
			        	<input type="text" class="form-control" name="kategori" required />
			      </div>
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-primary">Save</button>
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			      </div>
			  </form>
		    </div>
		  </div>
		</div>
				
    </jsp:body>
    
    
</t:layout>