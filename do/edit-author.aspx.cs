using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_edit_author : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthorTBx author = new AuthorTBx();
        AuthorManager am = new AuthorManager();
        author = am.GetByID(Convert.ToInt32(Request["id"]));
        author.Name = Request["name"];
        author.Phone = Request["phone"];
        author.Desc = Request["desc"];
        author.Email = Request["email"];

        string listcat = Request["listcat"];

        Author_CategoryManager acm = new Author_CategoryManager();
        List<Author_CategoryTBx> listauthorcatnew = new List<Author_CategoryTBx>();
        for (int i = 0; i < listcat.Split('@').Length - 1; i++)
        {
            Author_CategoryTBx authorcat = new Author_CategoryTBx();
            authorcat.CategoryID = Convert.ToInt32(listcat.Split('@')[i]);
            authorcat.AuthorID = author.ID;
            listauthorcatnew.Add(authorcat);
        }
        List<Author_CategoryTBx> listauthorcat = new List<Author_CategoryTBx>();
        listauthorcat = acm.GetListID(author.ID);
        acm.DeleteCat(listauthorcat);
        acm.AddNew(listauthorcatnew);

        am.Save();
    }
}