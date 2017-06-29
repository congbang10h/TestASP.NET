<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditBook.aspx.cs" Inherits="EditBook" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container">
        <div class="form-group">
            <label for="usr">Name:</label>
            <input type="text" class="form-control" id="txtName" value="<%=book.Name %>">
        </div>
        <div class="form-group">
            <label for="pwd">ShortDesc:</label>
            <input type="text" class="form-control" id="txtShortDesc" value="<%=book.ShortDesc %>">
        </div>
        <div class="form-group">
            <label for="pwd">Desc:</label>
            <input type="text" class="form-control" id="txtDesc" value="<%=book.Desc %>">
        </div>
        <div class="form-group">
            <label for="pwd">Price:</label>
            <input type="text" class="form-control" id="txtPrice" value="<%=book.Price %>">
        </div>
        <div class="form-group">
            <div class="col-md-12 text-center">
                <%ImageManager IM = new ImageManager();
                    var image = IM.GetIDByBookID(book.ID);
                    string img = image != null ? "upload/thumbnails/" + image.Name: "/upload/No_Image_Available.png";
                    int imgID = image != null ? image.ID : 0; %>
                <img id="avatar" width="70%" src="<%=img %>">
            </div>
            <div class="form-group col-md-9 col-sm-9 col-xs-9 btn btn-primary" style="position: relative; margin-right: 0px; margin-left: 10%; margin-top: 20px;">
                <input onclick="Remove_imageid()" name="file" type="file" id="file" style="position: absolute; left: 0; top: 0; width: 100%; height: 100%; opacity: 0;">
                Tải hình lên
            </div>
            <input type="hidden" id="imageid" name="image_id" value="<%=imgID%>" />
        </div>
        <div class="form-group">
            <button class="btn btn-danger" onclick="Edit(<%=book.ID %>)">Edit</button>
        </div>
    </div>
    <script>
        function Edit(id) {
            var name = $("#txtName").val();
            var shortdesc = $("#txtShortDesc").val();
            var desc = $("#txtDesc").val();
            var price = $("#txtPrice").val();
            var imageid = $("#imageid").val();
            var src = $("#avatar").attr('src');
            var base64 = "";
            if (src.indexOf('base64') != -1)
                base64 = src.replace(/data:image\/(jpeg|png|gif|jpq);base64,/, '');
            $.post("/do/edit-book.aspx",
                {
                    id: id,
                    name:name,
                    shortdesc: shortdesc,
                    desc: desc,
                    price: price,
                    imageid: imageid,
                    base64: base64
                }, function () {
                    location.href = "Default.aspx";
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
