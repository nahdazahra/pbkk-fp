<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="id_ID" scope="session"/>

<t:layout>
	<jsp:attribute name="title">Beranda</jsp:attribute>
	<jsp:body>
		<div class="mb-4 font-weight-bold">Lomba Terbaru</div>
		
        <c:forEach items="${lombaList}" var="lomba">
			<div class="my-4">
           		<div class="my-2">
           			<a href="<c:url value="/lomba/${lomba.id}" />" class="font-weight-bold">${lomba.nama}</a>
           		</div>
           		<div class="my-2">
           			${lomba.deskripsi}
           		</div>
           		<div class="my-2">
           			Pendaftaran:
           			<fmt:formatDate value="${lomba.mulaiDaftar}" pattern="d MMMM yyyy" /> -
           			<fmt:formatDate value="${lomba.akhirDaftar}" pattern="d MMMM yyyy" />
           		</div>
           		<div class="my-2">
           			Jadwal lomba:
           			<fmt:formatDate value="${lomba.mulaiLomba}" pattern="d MMMM yyyy" /> -
           			<fmt:formatDate value="${lomba.akhirLomba}" pattern="d MMMM yyyy" />
           		</div>
           		
           		<c:if test="${not empty loggedIn}">
           		
						<form method="POST" action="<c:url value="/lomba/daftar" />">
    						<input type="hidden" name="lombaId" value="${lomba.id}">
    						<button class="btn btn-success" type="submit">Daftar</button>
    					</form>
           		</c:if>
           	</div>
    	</c:forEach>
    </jsp:body>
</t:layout>