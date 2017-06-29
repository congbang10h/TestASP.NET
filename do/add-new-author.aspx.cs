using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_author : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AuthorTBx author = new AuthorTBx();
        AuthorManager am = new AuthorManager();
        author.Name = Request["name"];
        author.Phone = Request["phone"];
        author.Desc = Request["desc"];
        author.Email = Request["email"];
        author.Status = 1;
        am.AddNew(author);
        string listcat = Request["listcat"];
        List<Author_CategoryTBx> listauthorcat = new List<Author_CategoryTBx>();
        Author_CategoryManager acm = new Author_CategoryManager();
        for(int i = 0; i < listcat.Split('@').Length - 1; i++)
        {
            Author_CategoryTBx authorcat = new Author_CategoryTBx();
            authorcat.AuthorID = author.ID;
            authorcat.CategoryID = Convert.ToInt32(listcat.Split('@')[i]);
            listauthorcat.Add(authorcat);
        }
        acm.AddNew(listauthorcat);
    }
}