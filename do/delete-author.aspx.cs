using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_delete_author : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthorManager AM = new AuthorManager();
        AuthorTBx author = AM.GetByID(Convert.ToInt32(Request["id"]));
        author.Status = -1;
        AM.Save();
    }
}