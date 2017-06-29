using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditAuthor : System.Web.UI.Page
{
    public AuthorTBx author;
    public List<CategoryTBx> listCategory;
    public List<Author_CategoryTBx> listauthorcat;
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthorManager am = new AuthorManager();
        author = am.GetByID(Convert.ToInt32(Request["id"]));
        CategoryManager cm = new CategoryManager();
        listCategory = cm.GetList();
        Author_CategoryManager acm = new Author_CategoryManager();
        listauthorcat = acm.GetListID(author.ID);
    }
}