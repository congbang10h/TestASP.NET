using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BookTBx book = new BookTBx();
        BookManager bm = new BookManager();
        book.Name = Request["name"];
        book.ShortDesc = Request["shortdesc"];
        book.Desc = Request["desc"];
        book.Price = Convert.ToInt32(Request["price"]);
        book.Status = 1;
        bm.AddNew(book);

        ImageManager IM = new ImageManager();
        string base64 = Request["base64"];
        //Nut tải ảnh lên
        if (base64 != "" && base64 != null)
        {
            var imagebase64 = ImageUtilities.ConvertBase64ToImage(base64);
            var extention = ImageUtilities.getExtention(imagebase64.RawFormat);
            imagebase64 = ImageUtilities.CreateThumbnail2(1024, 800, imagebase64);

            ImageTBx ima = new ImageTBx();
            ima.Name = "demo.jpg";
            ima.BookID = book.ID;
            IM.AddNew(ima);
            ima.Name = "sach_" + ima.ID + extention;
            IM.Save();

            imagebase64.Save(Server.MapPath("~/upload/" + ima.Name), imagebase64.RawFormat);

            var imagethumb = ImageUtilities.CreateThumbnail(300, 500, Server.MapPath("~/upload/" + ima.Name));
            imagethumb.Save(Server.MapPath("~/upload/thumbnails/" + ima.Name), imagethumb.RawFormat);
            imagethumb.Dispose();
        }
        bm.Save();

        return;
    }
}