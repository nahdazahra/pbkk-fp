<%@ tag description="Layout" pageEncoding="UTF-8"%>
<%@ attribute name="title" fragment="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title><jsp:invoke fragment="title" /> - Lombaku</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand navbar-light border-bottom mb-4">
			<a class="navbar-brand font-weight-bold d-block"
				href="<c:url value="/" />">Lombaku</a>

			<div class="collapse navbar-collapse" id="navbar">
				<ul class="navbar-nav">
					<c:if test="${not empty loggedIn}">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="/lomba/new" />">Buat Lomba</a></li>
					</c:if>
				</ul>
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${empty loggedIn}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/register" />">Daftar</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/login" />">Masuk</a>
						</c:when>
						<c:when test="${not empty loggedIn}">
							<li class="nav-item"><a class="nav-link"
								href="<c:url value="/logout" />">Keluar</a></li>
						</c:when>
					</c:choose>
					</li>
				</ul>
			</div>
		</nav>

		<c:if test="${not empty success}">
			<div class="alert alert-success alert-dismissible fade show mt-3">
				${success}
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		</c:if>

		<div class="p-3">
			<jsp:doBody />
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>