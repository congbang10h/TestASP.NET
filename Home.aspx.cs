using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    public List<BookTBx> listbook;
    public int page;
    public int max;

    protected void Page_Load(object sender, EventArgs e)
    {
        BookManager bm = new BookManager();
        listbook = bm.GetList();

        page = RouteData.Values["page"] != null ? Convert.ToInt32(RouteData.Values["page"].ToString()) : 1;
        int num = 3;
        max = (listbook.Count - 1) / num;
        listbook = listbook.Skip((page - 1) * num).Take(num).ToList();
    }
}