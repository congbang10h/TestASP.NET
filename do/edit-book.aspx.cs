using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_edit_book : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BookTBx book = new BookTBx();
        BookManager bm = new BookManager();
        book = bm.GetByID(Convert.ToInt32(Request["id"]));
        book.Name = Request["name"];
        book.ShortDesc = Request["shortdesc"];
        book.Desc = Request["desc"];
        book.Price = Convert.ToInt32(Request["price"]);
        ImageManager IM = new ImageManager();
        string base64 = Request["base64"];

        var imagebase64 = ImageUtilities.ConvertBase64ToImage(base64);
        var extention = ImageUtilities.getExtention(imagebase64.RawFormat);
        imagebase64 = ImageUtilities.CreateThumbnail2(1024, 800, imagebase64);

        ImageTBx ima = new ImageTBx();
        int idimage = Convert.ToInt32(Request["imageid"]);
        if (idimage != 0)
        {
            ima = IM.GetByID(Convert.ToInt32(Request["imageid"]));
            ima.Name = "sach_" + ima.ID + extention;
            IM.Save();
        }
        if (idimage == 0)
        {
            ima.Name = "demo.jpg";
            ima.BookID = book.ID;
            IM.AddNew(ima);
            ima.Name = "sach_" + ima.ID + extention;
            IM.Save();
        }

        imagebase64.Save(Server.MapPath("~/upload/" + ima.Name), imagebase64.RawFormat);

        var imagethumb = ImageUtilities.CreateThumbnail(300, 500, Server.MapPath("~/upload/" + ima.Name));
        imagethumb.Save(Server.MapPath("~/upload/thumbnails/" + ima.Name), imagethumb.RawFormat);
        imagethumb.Dispose();

        bm.Save();
        return;
    }
}