using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Author : System.Web.UI.Page
{
    public AuthorTBx author;
    public List<AuthorTBx> listAuthor;
    public List<CategoryTBx> listCategory;
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthorManager am = new AuthorManager();
        listAuthor = am.GetList();
        CategoryManager cm = new CategoryManager();
        listCategory = cm.GetList();
    }
}