<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
</head>
<body>
	<form action="login" >
		<input name="username" type="text" placeholder="account" required autofocus="">
		<br>
		<input name="password" type="password" placeholder="password" required autofocus="">
		<br>
		
		<button type="submit">
			login
		</button>
		<button type="button">
			logon
		</button>
	</form>
	<p><s:property value="errorMessage"/></p>
</body>
</html>