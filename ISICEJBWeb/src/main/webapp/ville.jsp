<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title></title>
<style>
body {
	background-color: #F5E1FF; /* Lavande clair */
	color: #35274A; /* Violet foncé */
	font-family: 'Arial', sans-serif;
}

.container {
	margin-top: 50px;
	text-align: center;
}

.display-4 {
	color: #AA00FF; /* Violet électrique */
}

.btn-block {
	background-color: #AA00FF; /* Violet électrique */
	color: #FFFFFF;
	border: none;
	padding: 15px;
	font-size: 18px;
	border-radius: 10px; /* Coins arrondis */
	transition: background-color 0.3s ease-in-out;
	/* Animation au survol */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Ombre légère */
	margin-bottom: 10px; /* Espace entre les boutons */
}

.btn-block:hover {
	background-color: #8A2BE2; /* Bleu-violet au survol */
}

.form-group {
	margin-bottom: 20px;
}

.form-control {
	border: 2px solid #AA00FF; /* Violet électrique */
	border-radius: 10px; /* Coins arrondis */
	color: #35274A; /* Violet foncé */
}

.form-control:focus {
	border-color: #8A2BE2; /* Bleu-violet au focus */
	box-shadow: none;
}
</style>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h1 class="display-4">Cities Management</h1>
			<a href="home.jsp" class="btn btn-light fixed-bottom ml-4 mb-4"
				style="color: #0766AD;"> <i class="fas fa-home"></i> Home
			</a>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#VilleModalCenter">Add a city</button>
		</div>

		
		<div class="modal fade" id="VilleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="VilleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<form action="VilleController" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="VilleModalCenterTitle">Add a city</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label class="custom-modal-label" for="Nom">Name</label> <input
								type="text" name="Nom" class="form-control" required><br>
							<br>

							

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="Save">
						</div>
					</div>
				</form>
			</div>
		</div>

		
		<div class="modal fade" id="ModifyVilleModal" tabindex="-1"
			role="dialog" aria-labelledby="ModifyVilleModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<form id="modifyForm" action="VilleController" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="ModifyVilleModalTitle">Edit</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label class="custom-modal-label" for="Nom">Name</label> <input
								type="text" name="Nom" class="form-control" id="modalVilleNom"
								required><br>
							<br>

							

							<input type="hidden" name="action" value="edit"> <input
								type="hidden" name="id" id="modalVilleId">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								onclick="submitModifyForm()">Save modifications</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${villes}" var="ville">
					<tr>
						<td>${ville.id}</td>
						<td>${ville.nom}</td>
						<td class="d-flex align-items-center">
							<form action="VilleController" method="post">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="${ville.id}">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
							<button type="button" class="btn btn-secondary ml-2"
								data-toggle="modal" data-target="#ModifyVilleModal"
								data-ville-id="${ville.id}" data-ville-nom="${ville.nom}">
								Edit</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$('#ModifyVilleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var villeId = button.data('ville-id');
			var villeNom = button.data('ville-nom');
			// Ajouter d'autres attributs si nécessaire
			var modal = $(this);

			modal.find('#modalVilleNom').val(villeNom);
			modal.find('#modalVilleId').val(villeId);
			// Mettre à jour d'autres champs si nécessaire
		});

		function submitModifyForm() {
			document.getElementById("modifyForm").submit();
		}
	</script>
</body>
</html>
