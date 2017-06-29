﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Reset password</title>

    <link href="img/favicon.144x144.png" rel="apple-touch-icon" type="image/png" sizes="144x144">
    <link href="img/favicon.114x114.png" rel="apple-touch-icon" type="image/png" sizes="114x114">
    <link href="img/favicon.72x72.png" rel="apple-touch-icon" type="image/png" sizes="72x72">
    <link href="img/favicon.57x57.png" rel="apple-touch-icon" type="image/png">
    <link href="img/favicon.png" rel="icon" type="image/png">
    <link href="img/favicon.ico" rel="shortcut icon">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
    <link rel="stylesheet" href="css/separate/pages/login.min.css">
    <link rel="stylesheet" href="css/lib/font-awesome/font-awesome.min.css">
    <link rel="stylesheet" href="css/lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div class="page-center">
        <div class="page-center-in">
            <div class="container-fluid">
                <form class="sign-box reset-password-box">
                    <!--<div class="sign-avatar">
                        <img src="img/avatar-sign.png" alt="">
                    </div>-->
                    <header class="sign-title">Reset Password</header>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Email" id="txtEmail"/>
                    </div>
                    <button type="submit" class="btn btn-rounded" onclick="Reset()">Reset</button>
                    or <a href="Login-page.aspx">Sign in</a>
                </form>
            </div>
        </div>
    </div>
    <!--.page-center-->
<%--    <script>
        function validateEmail(emailField) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(emailField.value) == false) {
                alert('Invalid Email Address');
                return false;
            }

            return true;

        }
    </script>--%>
    <script>
        function Reset() {
            var email = $("#txtEmail").val();
            $.post("do/send-forget-mail.aspx", {
                email: email
            }, function (data) {
                if (data == "true") {
                    location.href = "Login-page.aspx";
                    alert("Email OK!!");
                }
                else if (data == "false") {
                    location.href = "ResetPassword.aspx";
                    alert("Email không tồn tại. Vui lòng kiểm tra lại!!");
                }
            });
        }
    </script>

    <script src="js/lib/jquery/jquery.min.js"></script>
    <script src="js/lib/tether/tether.min.js"></script>
    <script src="js/lib/bootstrap/bootstrap.min.js"></script>
    <script src="js/plugins.js"></script>
    <script type="text/javascript" src="js/lib/match-height/jquery.matchHeight.min.js"></script>
    <script>
        $(function () {
            $('.page-center').matchHeight({
                target: $('html')
            });

            $(window).resize(function () {
                setTimeout(function () {
                    $('.page-center').matchHeight({ remove: true });
                    $('.page-center').matchHeight({
                        target: $('html')
                    });
                }, 100);
            });
        });
    </script>
    <script src="js/app.js"></script>
</body>
</html>