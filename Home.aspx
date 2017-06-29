<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">My Book Store</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <li><a href="/Login-page.aspx">Login</a></li>
                <li><a href="/Register.aspx">Register</a></li>
            </ul>
        </div>
    </nav>
    <%for (int i = 0; i < listbook.Count; i++)
        {
            ImageManager IM = new ImageManager();
            var image = IM.GetIDByBookID(listbook[i].ID);
            string img = image != null ? "upload/thumbnails/" + image.Name : "/upload/No_Image_Available.png"; %>
    <div class="col-md-4">
        <a href="/Book-detail/<%=UTIL.Url(listbook[i].Name)+"-item-"+listbook[i].ID%>">
            <div class="img-responsive">
                <img src="<%=img %>" />
            </div>
            <h1>
                <%=listbook[i].Name %>
            </h1>
            <h2>
                <%=listbook[i].Price %>
            </h2>
            <h3>
                <%=listbook[i].ShortDesc %>
            </h3>
        </a>
    </div>
    <%} %>
    <%=PagingBootstrap.Paging(listbook.Count,max,page,3,Request.Url.ToString(),"trang-") %>
</body>
</html>
