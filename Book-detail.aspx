<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Book-detail.aspx.cs" Inherits="Book_detail" %>

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
    <%
            ImageManager IM = new ImageManager();
            var image = IM.GetIDByBookID(book.ID);
            string img = image != null ? "upload/thumbnails/" + image.Name : "/upload/No_Image_Available.png"; %>
    <div class="col-md-4">
        <div class="img-responsive">
            <img src="<%=img %>" />
        </div>
        <h1>
            <%=book.Name %>
        </h1>
        <h2>
            <%=book.Price %>
        </h2>
        <h3>
            <%=book.ShortDesc %>
        </h3>
        <h2>
            <%=book.Desc %>
        </h2>
    
    </div>
</body>
</html>