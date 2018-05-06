<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login</h1>
        <form action="loginAction.jsp" method="POST">
            <table>
                <tbody>
                    <tr>
                        <td><label for="email">Email</label></td>
                        <td><input name="email" type="text" value=""></td>
                    </tr>
                    <tr>
                        <td><label for="password">Password</label></td>
                        <td><input name="password" type="password" value=""></td>
                    </tr>
                    <tr>
                        <td><label for=""></label></td>
                        <td><input name="" type="submit" value="Login"></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
