using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_detail : System.Web.UI.Page
{
    public BookTBx book;
    protected void Page_Load(object sender, EventArgs e)
    {
        BookManager bm = new BookManager();
        if(RouteData.Values["id"] != null)
        {
            int id = Convert.ToInt32(RouteData.Values["id"].ToString());
            book = bm.GetByID(id);
        }
        //book = bm.GetByID(Convert.ToInt32(Request["id"]));
    }
}