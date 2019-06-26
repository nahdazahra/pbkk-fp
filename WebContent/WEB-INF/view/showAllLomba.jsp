<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:setLocale value="id_ID" scope="session" />

<t:layout>
	<jsp:attribute name="title">Semua Lomba</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Semua Lomba</div>
		
        	<table class="table">
  				<thead>
    				<tr>
      					<th scope="col">Nama</th>
      					<th scope="col">Deskripsi</th>
      					<th scope="col">Mulai Daftar</th>
      					<th scope="col">Akhir Daftar</th>
      					<th scope="col">Mulai Lomba</th>
      					<th scope="col">Akhir Lomba</th>
      					<th scope="col">Action</th>
      					<th></th>
   					 </tr>
 				</thead>
  				<tbody>
        <c:forEach items="${lombaList}" var="lomba">
    				<tr>
      					<td>${lomba.nama}</td>
      					<td>${lomba.deskripsi}</td>
      					<td><fmt:formatDate value="${lomba.mulaiDaftar}" pattern="d MMMM yyyy" /></td>
      					<td><fmt:formatDate value="${lomba.akhirDaftar}" pattern="d MMMM yyyy" /></td>
      					<td><fmt:formatDate value="${lomba.mulaiLomba}" pattern="d MMMM yyyy" /></td>
      					<td><fmt:formatDate value="${lomba.akhirLomba}" pattern="d MMMM yyyy" /></td>
      					<td><a class="nav-link btn btn-primary"
							href="<c:url value="/lomba/manage/${lomba.id}" />">Lihat Peserta</a></td>
    				</tr>
    	</c:forEach>
  				</tbody>
			</table>
			
    </jsp:body>
</t:layout>