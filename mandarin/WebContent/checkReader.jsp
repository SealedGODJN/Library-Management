<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<table>
		<thead>
			<tr>
				<th>username</th>
				<th>password</th>
				<th>email</th>
				<th>phoneNumber</th>
				<th>admit</th>
				<th>refuse</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="" status="">
				<tr>
					<td>
						<form action="checkReader">
							<input name="id" value="<s:property value="id"/>"/>
							<input name="username" value="<s:property value="username"/>"/>
							<input name="password" value="<s:property value="password"/>"/>
							<input name="email" value="<s:property value="email"/>"/>
							<input name="phoneNumber" value="<s:property value="phoneNumber"/>"/>
							<button type="submit">admit</button>
							<button type="submit">refuse</button>
						</form>
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	
</body>
</html>
