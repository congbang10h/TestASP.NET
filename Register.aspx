<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html lang="en">
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Register Page</title>

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
                <form class="sign-box">
                    <div class="sign-avatar no-photo">&plus;</div>
                    <header class="sign-title">Sign Up</header>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Username" id="txtName" />
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" id="txtNewPassword" />
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Repeat password" id="txtConfirmPassword" onchange="checkPasswordMatch()" />
                    </div>
                    <div class="registrationFormAlert" id="divCheckPasswordMatch" style="color: red"></div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Email" id="txtEmail" onblur="validateEmail(this)"/>
                    </div>
                    <button type="submit" class="btn btn-rounded btn-success sign-up" onclick="Add()">Sign up</button>
                    <p class="sign-note">Already have an account? <a href="Login-page.aspx">Sign in</a></p>
                </form>
            </div>
        </div>
    </div>
    <!--.page-center-->
    <script>
        function checkPasswordMatch() {
            var password = $("#txtNewPassword").val();
            var confirmPassword = $("#txtConfirmPassword").val();

            if (password != confirmPassword)
                $("#divCheckPasswordMatch").html("Passwords do not match!");
            else
                $("#divCheckPasswordMatch").html("Passwords match.");
        }
        $(document).ready(function () {
            $("#txtConfirmPassword").keyup(checkPasswordMatch);
        }); 
    </script>
    <script>
        function validateEmail(emailField) {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if (reg.test(emailField.value) == false) {
                alert('Invalid Email Address');
                return false;
            }

            return true;

        }
    </script>
    <script>
        function Add() {
            var name = $("#txtName").val();
            var pass = $("#txtNewPassword").val();
            var email = $("#txtEmail").val();
            $.post("/do/add-new-account.aspx",
                {
                    name: name,
                    pass: pass,
                    email: email
                }, function () {
                    location.href = "Register.aspx";
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
