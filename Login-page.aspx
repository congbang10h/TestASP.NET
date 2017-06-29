<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login-page.aspx.cs" Inherits="Login_page" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Login Page</title>

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
                    <div class="sign-avatar">
                        <img src="img/avatar-sign.png" alt="">
                    </div>
                    <header class="sign-title">Sign In</header>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Username" id="txtName" name="usr"/> 
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Password" id="txtPassword" name="pass"/>
                    </div>
                    <div class="form-group">
                        <div class="checkbox float-left">
                            <input type="checkbox" id="signed-in" />
                            <label for="signed-in">Keep me signed in</label>
                        </div>
                        <div class="float-right reset">
                            <a href="ResetPassword.aspx">Reset Password</a>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-rounded" onclick="Submit()" id="signin">Sign in</button>
                    <p class="sign-note">New to our website? <a href="Register.aspx">Sign up</a></p>         
                    <!--<button type="button" class="close">
                        <span aria-hidden="true">&times;</span>
                    </button>-->
                </form>
            </div>
        </div>
    </div>
    <%--<script>
        var attempt = 3; // Variable to count number of attempts.
        // Below function Executes on click of login button.
        function validate() {
            var username = document.getElementById("txtName").value;
            var password = document.getElementById("txtPassword").value;
            if (username == "Hello" && password == "Cong") {
                alert("Login successfully");
                window.location = "Register.aspx"; // Redirecting to other page.
                return false;
            }
            else {
                attempt--;// Decrementing by one.
                alert("You have left " + attempt + " attempt;");
                // Disabling fields after 3 attempts.
                if (attempt == 0) {
                    document.getElementById("txtName").disabled = true;
                    document.getElementById("txtPassword").disabled = true;
                    document.getElementById("signin").disabled = true;
                    return false;
                }
            }
        }
    </script>--%>
    <!--.page-center-->
    <script>
        function Submit() {
            var name = $("#txtName").val();
            var pass = $("#txtPassword").val();
            $.post("/do/check-login.aspx",
                {
                    name: name,
                    pass: pass
                }, function (data) {
                    if (data == "true") {
                        location.href = "Default.aspx";
                        alert("Bạn đã đăng nhập thành công!!")
                    }
                    else if(data=="false") {
                        location.href = "Login-page.aspx";
                        alert("Sai mật khẩu hoặc password. Vui lòng kiểm tra!!")
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
