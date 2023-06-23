<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login and Reg</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h1 class="mt-5">Welcome</h1>
		<div class="row">
			<div class="col">
				<form:form action="/users/process/register" method="post"
					modelAttribute="newUser">
					<div class="form-group">
						<label for="userName">User Name:</label>
						<form:input type="text" path="userName" class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="userName" />
						</small>
					</div>
					<div class="form-group">
						<label for="email">Email:</label>
						<form:input type="text" path="email" class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="email" />
						</small>
					</div>
					<div class="form-group">
						<label for="password">Password:</label>
						<form:input type="password" path="password" class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="password" />
						</small>
					</div>
					<div class="form-group">
						<label for="confirm">Confirm Password:</label>
						<form:input type="password" path="confirm" class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="confirm" />
						</small>
					</div>
					<input type="submit" value="Register" class="mt-2 btn btn-success" />
				</form:form>
			</div>
			<div class="col">
				<form:form action="/users/process/login" method="post"
					modelAttribute="loginUser">
					<div class="form-group">
						<label for="email">Email:</label>
						<form:input type="text" path="email" class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="email" />
						</small>
					</div>
					<div class="form-group">
						<label for="password">Password:</label>
						<form:input type="password" path="password" class="form-control" />
						<small class="form-text text-danger"> <form:errors
								path="password" />
						</small>
					</div>
					<input type="submit" value="Login" class="mt-2 btn btn-success" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>