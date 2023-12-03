<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
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
		<div class="section">
			<h1 class="display-4 mb-4">UrbanHotel Manager</h1>

			<div class="row">
				<div class="col-md-6">
					<form action="VilleController" class="form-group">
						<button class="btn btn-block">Cities Management</button>
					</form>
				</div>
				<div class="col-md-6">
					<form action="HotelController" class="form-group">
						<button class="btn btn-block">Hotels Management</button>
					</form>
				</div>
			</div>
		</div>
        

	</div>


	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>


