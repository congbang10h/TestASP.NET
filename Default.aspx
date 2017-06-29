<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
            <input type="text" class="form-control" id="txtName">
        </div>
        <div class="form-group">
            <label for="pwd">ShortDesc:</label>
            <input type="text" class="form-control" id="txtShortDesc">
        </div>
        <div class="form-group">
            <label for="pwd">Desc:</label>
            <input type="text" class="form-control" id="txtDesc">
        </div>
        <div class="form-group">
            <label for="pwd">Price:</label>
            <input type="text" class="form-control" id="txtPrice">
        </div>
        <div class="form-group">
            <div class="col-md-12 text-center">
                <img id="avatar" width="70%" src="#">
            </div>
            <div class="form-group col-md-9 col-sm-9 col-xs-9 btn btn-primary" style="position: relative; margin-right: 0px; margin-left: 10%; margin-top: 20px;">
                <input onclick="Remove_imageid()" name="file" type="file" id="file" style="position: absolute; left: 0; top: 0; width: 100%; height: 100%; opacity: 0;">
                Tải hình lên
            </div>
            <input type="hidden" id="image_id" name="image_id" value="" />
        </div>

        <div class="form-group">
            <button class="btn btn-danger" onclick="Add()">Add New</button>
        </div>
    </div>
    <table style="width: 60%; margin: auto">
        <tbody>
            <th>Name</th>
            <th>ShortDesc</th>
            <th>Desc</th>
            <th>Price</th>
            <th>Image</th>
            <th>Action</th>
            <%for (int i = 0; i < listbook.Count; i++)
                { %>
            <tr>
                <td><%=listbook[i].Name %></td>
                <td><%=listbook[i].ShortDesc %></td>
                <td><%=listbook[i].Desc %></td>
                <td><%=listbook[i].Price %></td>
                <%ImageManager IM = new ImageManager();
                    var image = IM.GetIDByBookID(listbook[i].ID);
                    string img = image != null ? "upload/thumbnails/" + image.Name: "/upload/No_Image_Available.png"; %>
                <td><img style="width:150px;height:90px;" src="<%=img %>"></td>
                <td>
                    <button class="btn btn-success" onclick="Edit(<%=listbook[i].ID %>)">Edit</button></td>
                <td>
                    <button class="btn btn-block" onclick="Delete(<%=listbook[i].ID %>)">Delete</button></td>
                <td>
                    <button class="btn btn-lg" onclick="AddCart(<%=listbook[i].ID %>)">Add to cart</button></td>             
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>
        function Add() {
            var name = $("#txtName").val();
            var shortdesc = $("#txtShortDesc").val();
            var desc = $("#txtDesc").val();
            var price = $("#txtPrice").val();
            var imageid = $("input[name='image_id'").val();
            var src = $("#avatar").attr('src');
            var base64 = "";
            if (src.indexOf('base64') != -1)
                base64 = src.replace(/data:image\/(jpeg|png|gif|jpq);base64,/, '');
            $.post("/do/add-new.aspx",
                {
                    name:name,
                    shortdesc: shortdesc,
                    desc: desc,
                    price: price,
                    imageid:imageid,
                    base64:base64
                }, function () {
                    location.href = "Default.aspx";
                });
        }
        function Edit(id) {
            location.href = "EditBook.aspx?id=" + id;
        }
        function Delete(id) {
            $.post("/do/delete-book.aspx", {    
                id: id
            }, function () {
                location.href = "/Default.aspx";
            });
        }
        function AddCart(id) {
            $.post("/do/add-to-cart.aspx", {
                id: id
            }, function () {
                location.href = "/Default.aspx";
            });
        }
        function Remove_imageid() {
            $("#image_id").val("");
        }
        $(document).ready(function () {
            $('#file').change(function (event) {
                var input = event.target;
                var reader = new FileReader();
                reader.onload = function () {
                    var dataURL = reader.result;
                    var output = document.getElementById('avatar');
                    output.src = dataURL;
                };
                reader.readAsDataURL(input.files[0]);
            });
        });
    </script>
</body>
</html>
