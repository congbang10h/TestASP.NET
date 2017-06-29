using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryTBx category = new CategoryTBx();
        CategoryManager cm = new CategoryManager();
        category.Name = Request["cat"];
        category.Status = 1;
        cm.AddNew(category);
    }
}