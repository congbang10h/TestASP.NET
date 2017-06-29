<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditAuthor.aspx.cs" Inherits="EditAuthor" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Form control: input</h2>
        <p>The form below contains two input elements; one of type text and one of type password:</p>
        <div class="form-group">
            <label for="usr">Name:</label>
            <input type="text" class="form-control" id="txtName" value="<%=author.Name %>">
        </div>
        <div class="form-group">
            <label for="pwd">Phone:</label>
            <input type="text" class="form-control" id="txtPhone" value="<%=author.Phone %>">
        </div>
        <div class="form-group">
            <label for="pwd">Desc:</label>
            <input type="text" class="form-control" id="txtDesc" value="<%=author.Desc %>">
        </div>
        <div class="form-group">
            <label for="pwd">Email:</label>
            <input type="text" class="form-control" id="txtEmail" value="<%=author.Email %>">
        </div>
        <div class="form-group">
            <label for="pwd">Category:</label>
            <%for (int i = 0; i < listCategory.Count; i++)
                {%>
            <input type="checkbox" class="cbCat" name="cbCat" id="cbCat_<%=listCategory[i].ID %>" id="txtcbCat" value="<%=listCategory[i].ID %>"
                <%for (int j = 0; j < listauthorcat.Count; j++)
                {
                    if (listCategory[i].ID == listauthorcat[j].CategoryID)
                    {%>
                checked
                <% break;
                }%>
                <%} %> /><%=listCategory[i].Name %>
            <%} %>
        </div>
        <div class="form-group">
            <button class="btn btn-success" onclick="Edit(<%=author.ID %>)">Edit</button>
        </div>
    </div>
    
    <script>
        function Edit(id) {
            var name = $("#txtName").val();
            var phone = $("#txtPhone").val();
            var desc = $("#txtDesc").val();
            var email = $("#txtEmail").val();
            var listcat = "";
            $('input[name="cbCat"]:checked').each(function (i, item) {
                listcat += $(item).val() + "@";
            });
            $.post("/do/edit-author.aspx",
                {
                    id:id,
                    name: name,
                    phone: phone,
                    desc: desc,
                    email: email,
                    listcat: listcat
                }, function () {
                    location.href = "Author.aspx";
                });
        }
    </script>
</body>
</html>

