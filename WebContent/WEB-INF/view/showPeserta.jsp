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
      					<th scope="col">Email</th>
      					<th scope="col">Tanggal Daftar</th>
      					<th scope="col">Status</th>
      					<th scope="col">Action</th>
      					<th></th>
   					 </tr>
 				</thead>
  				<tbody>
        		<c:forEach items="${pesertaList}" var="peserta">
    				<tr>
      					<td>${peserta.getUser().name}</td>
      					<td>${peserta.getUser().email}</td>
      					<td><fmt:formatDate value="${peserta.tanggalDaftar}" pattern="d MMMM yyyy" /></td>
      					<c:choose>
      					<c:when test="${peserta.status == 0}">
      						<td>Belum Terverifikasi</td>
      						<td><a class="nav-link btn btn-success"
							href="<c:url value="/lomba/manage/verify_peserta/${peserta.id}/1" />">Verifikasi Peserta</a></td>
							<td><a class="nav-link btn btn-danger"
							href="<c:url value="/lomba/manage/verify_peserta/${peserta.id}/-1" />">Tolak</a></td>
      					</c:when>
      					<c:when test="${peserta.status == -1}">
      						<td>Verifikasi Ditolak</td>
      						<td>-</td>
      					</c:when>
      					<c:otherwise>
      						<td>Sudah diverifikasi</td>
      						<td><a class="nav-link btn btn-info" target="_blank"
							href="<c:url value="/lomba/manage/print/${peserta.id}" />">Cetak Kartu Peserta</a></td>
      					</c:otherwise>
      					</c:choose>
    				</tr>
    			</c:forEach>
  				</tbody>
			</table>
    </jsp:body>
</t:layout>