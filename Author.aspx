<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Author.aspx.cs" Inherits="Author" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Author</title>
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
        <h2>Author: input</h2>
        <div class="form-group">
            <label for="usr">Name:</label>
            <input type="text" class="form-control" id="txtName">
        </div>
        <div class="form-group">
            <label for="pwd">Phone:</label>
            <input type="text" class="form-control" id="txtPhone">
        </div>
        <div class="form-group">
            <label for="pwd">Desc:</label>
            <input type="text" class="form-control" id="txtDesc">
        </div>
        <div class="form-group">
            <label for="pwd">Email:</label>
            <input type="text" class="form-control" id="txtEmail">
        </div>
        <div class="form-group">
            <label for="pwd">Category:</label>
            
            <%for (int i = 0; i < listCategory.Count; i++)
                {%>        
            <input type="checkbox" class="[ btn-group ]" name="cbCat" id="cbCat_<%=listCategory[i].ID %>" id="txtcbCat" value="<%=listCategory[i].ID %>"
                <%for (int j = 0; j < listCategory.Count; j++)
                {
                    //if (listCategory[i].ID == listauthorcat[j].CategoryID)
                    {%>
                checked
                <% break;
                }%>
                <%} %> /><%=listCategory[i].Name %>
            <%} %>

        </div>
        <div class="form-group">
            <label for="pwd">Category:</label>
            <input type="text" class="form-control" id="txtCat">
            <button class="btn btn-danger" onclick="AddCat()">Add Category</button>
        </div>
        <div class="form-group">
            <button class="btn btn-danger" onclick="Add()">Add New</button>
        </div>

    </div>
    <table style="width: 60%; margin: auto">
        <tbody>
            <th>Name</th>
            <th>Phone</th>
            <th>Desc</th>
            <th>Email</th>
            <th>Category</th>
            <th>Action</th>
            <%for (int i = 0; i < listAuthor.Count; i++)
                { %>
            <tr>
                <td><%=listAuthor[i].Name %></td>
                <td><%=listAuthor[i].Phone %></td>
                <td><%=listAuthor[i].Desc %></td>
                <td><%=listAuthor[i].Email %></td>
                <td><%List<Author_CategoryTBx> listAuthorCat = new List<Author_CategoryTBx>();
                        Author_CategoryManager acm = new Author_CategoryManager();
                        listAuthorCat = acm.GetListID(listAuthor[i].ID);
                        for (int e = 0; e < listAuthorCat.Count; e++)
                        {%>
                    <%=listAuthorCat[e].CategoryTBx.Name %>
                    <%}
                    %>
                </td>

                <td>
                    <button class="btn btn-success" onclick="Edit(<%=listAuthor[i].ID %>)">Edit</button></td>
                <td>
                    <button class="btn btn-block" onclick="Delete(<%=listAuthor[i].ID %>)">Delete</button></td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>
        function Add() {
            var name = $("#txtName").val();
            var phone = $("#txtPhone").val();
            var desc = $("#txtDesc").val();
            var email = $("#txtEmail").val();
            var listcat = "";
            $('input[name="cbCat"]:checked').each(function (i, item) {
                listcat += $(item).val() + "@";
            });        
            $.post("/do/add-new-author.aspx",
                {
                    name: name,
                    phone: phone,
                    desc: desc,
                    email: email,
                    listcat: listcat
                }, function () {
                    location.href = "Author.aspx";
                });
        }
        function AddCat() {
            var cat = $("#txtCat").val();
            $.post("/do/add-new-category.aspx", {
                cat:cat
            }, function () {
                location.href = "/Author.aspx";
            });
        }
        function Edit(id) {
            location.href = "EditAuthor.aspx?id=" + id;
        }
        function Delete(id) {
            $.post("/do/delete-author.aspx", {
                id: id
            }, function () {
                location.href = "/Author.aspx";
            });
        }
    </script>
</body>
</html>
