<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>


</head>
<body
	style="background: url(img/img.jpg); background-size: cover; background-attachment: fixed;">

	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">

				<div class="card" style="border-radius: 10px;">
					<div class="card-content">
						<h3 style="margin-top: 10px" class="center-align">Register
							here !!</h3>

						<div class="form center-align">
							<!-- creating form -->
							<form action="signup" method="post">
								<input type="text" name="user_name"  placeholder="Enter user name" />
								<input type="password" name="user_password" placeholder="Enter user password" /> 
								<input type="email" name="user_email" placeholder="Enter user email" />

								<button type="submit" class="btn blue">Submit</button>
							</form>
						</div>
						<div class="loader center-align" style="display: none;">
							<div class="progress">
								<div class="indeterminate"></div>
							</div>
							<h5>Please wait...</h5>
						</div>
						<script src="https://code.jquery.com/jquery-4.0.0.min.js"
							integrity="sha256-OaVG6prZf4v69dPg6PhVattBXkcOWQB62pdZ3ORyrao="
							crossorigin="anonymous"></script>
</body>
</html>