using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditBook : System.Web.UI.Page
{
    public BookTBx book;
    protected void Page_Load(object sender, EventArgs e)
    {
        BookManager bm = new BookManager();
        book = bm.GetByID(Convert.ToInt32(Request["id"]));
        bm.Save();
        return;
    }
}