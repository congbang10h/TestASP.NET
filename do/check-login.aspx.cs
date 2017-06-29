using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_check_login : System.Web.UI.Page
{
    public UserTBx user = new UserTBx();
    public string check = "false";
    public string valid()
    {
        UserManager um = new UserManager();
        string pass = Request["pass"];
        var name = Request["name"];
        var compare = UTIL.Encrypt(pass,true);
        user = um.GetByUsername(name);
        if (name == null)
        {
            return "false";
        }
        if(user.Password==compare)
        {
            check = "true";
            return check;
        }
        else
        {
            return "false";
        }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(valid());
    }
}