using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserTBx user = new UserTBx();
        UserManager um = new UserManager();
        user.Username = Request["name"];
        user.Password = UTIL.Encrypt(Request["pass"],true);    
        user.Email = Request["email"];
        user.Status = 1;   
        um.AddNew(user);
    }
}