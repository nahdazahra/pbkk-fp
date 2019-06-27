<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="col-xs-12">
    		<div class="invoice-title">
    			<h2>KARTU PESERTA</h2><h3 class="pull-right">Order #${peserta.id}</h3>
    		</div>
    		<hr>
    		<div class="row">
    			<div class="col-xs-6">
    				<address>
    				<strong>Pendaftar:</strong><br>
    					${peserta.getUser().name}<br>
    					${peserta.getUser().email}<br>
    					Tanggal Daftar: <fmt:formatDate value="${peserta.tanggalDaftar}" pattern="dd MMMM yyyy" />
    				</address>
    			</div>
    		</div>
    	</div>
    </div>
    
    <div class="row">
    	<div class="col-md-12">
    		<div class="panel panel-default">
    			<div class="panel-heading text-center">
    				<h3 class="panel-title"><strong>Terdaftar Pada:</strong></h3>
    			</div>
    			<div class="panel-body">
    				<div class="text-center">
    					<h3>${peserta.getLomba().nama}</h3>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>