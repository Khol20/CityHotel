<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
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
			<h1 class="display-4">Hotels Management</h1>
			<a href="home.jsp" class="btn btn-light fixed-bottom ml-4 mb-4"
				style="color: #0766AD;"> <i class="fas fa-home"></i> Home
			</a>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#HotelModalCenter">Add Hotel</button>
		</div>

		<div class="modal fade" id="HotelModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="HotelModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<form action="HotelController" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="HotelModalCenterTitle">Add Hotel</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label class="custom-modal-label" for="nom">Name</label> <input
								type="text" name="nom" class="form-control" required><br>
							<br> <label class="custom-modal-label" for="adresse">Address</label>
							<input type="text" name="adresse" class="form-control" required><br>
							<br> <label class="custom-modal-label" for="telephone">Phone Number</label>
							<input type="text" name="telephone" class="form-control" required><br>
							<br> <label class="custom-modal-label" for="ville">City</label>
							<select name="ville" class="form-control" required>
								<option value="" disabled selected>Select a city</option>
								<c:forEach items="${villes}" var="ville">
									<option value="${ville.id}">${ville.nom}</option>
								</c:forEach>

							</select>

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

		<div class="modal fade" id="ModifyHotelModal" tabindex="-1"
			role="dialog" aria-labelledby="ModifyHotelModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<form id="modifyForm" action="HotelController" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="ModifyHotelModalTitle">Edit
							</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label class="custom-modal-label" for="nom">Name</label> <input
								type="text" name="nom" class="form-control" id="modalHotelNom"
								required><br> <br> <label
								class="custom-modal-label" for="adresse">Address</label> <input
								type="text" name="adresse" class="form-control"
								id="modalHotelAdresse" required><br> <br> <label
								class="custom-modal-label" for="telephone">Phone Number</label> <input
								type="text" name="telephone" class="form-control"
								id="modalHotelTelephone" required><br> <br> <label
								class="custom-modal-label" for="ville">Ville</label> <select
								name="ville" class="form-control" id="modalHotelVille" required>
								<c:forEach items="${villes}" var="ville">
									<option value="${ville.id}">${ville.nom}</option>
								</c:forEach>
							</select> <input type="hidden" name="action" value="edit"> <input
								type="hidden" name="id" id="modalHotelId">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary"
								onclick="submitModifyForm()">Save Changes</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<form action="HotelController" method="post" class="mb-4">
			<div class="form-group">
				<label for="filterVille">Filter by city :</label> <select
					name="filterVille" class="form-control">
					<option value="0">Cities</option>
					<c:forEach items="${villes}" var="ville">
						<option value="${ville.id}">${ville.nom}</option>
					</c:forEach>
				</select> <input type="hidden" name="action" value="filterByVille">
			</div>
			<button type="submit" class="btn btn-primary">Filter</button>
		</form>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Address</th>
					<th>Phone Number</th>
					<th>City</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hotels}" var="hotel">
					<tr>
						<td>${hotel.id}</td>
						<td>${hotel.nom}</td>
						<td>${hotel.adresse}</td>
						<td>${hotel.telephone}</td>
						<td>${hotel.ville.nom}</td>
						<td class="d-flex align-items-center">
							<form action="HotelController" method="post">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="${hotel.id}">
								<button type="submit" class="btn btn-danger">Delete</button>
							</form>
							<button type="button" class="btn btn-secondary ml-2"
								data-toggle="modal" data-target="#ModifyHotelModal"
								data-hotel-id="${hotel.id}" data-hotel-nom="${hotel.nom}"
								data-hotel-adresse="${hotel.adresse}"
								data-hotel-telephone="${hotel.telephone}"
								data-hotel-ville="${hotel.ville.id}">Modifier</button>
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
		$('#ModifyHotelModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget);
			var hotelId = button.data('hotel-id');
			var hotelNom = button.data('hotel-nom');
			var hotelAdresse = button.data('hotel-adresse');
			var hotelTelephone = button.data('hotel-telephone');
			var hotelVille = button.data('hotel-ville');
			var modal = $(this);

			modal.find('#modalHotelNom').val(hotelNom);
			modal.find('#modalHotelAdresse').val(hotelAdresse);
			modal.find('#modalHotelTelephone').val(hotelTelephone);
			modal.find('#modalHotelVille').val(hotelVille);
			modal.find('#modalHotelId').val(hotelId);
		});

		function submitModifyForm() {
			document.getElementById("modifyForm").submit();
		}
	</script>
</body>
</html>
