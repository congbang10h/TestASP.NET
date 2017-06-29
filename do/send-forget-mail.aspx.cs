using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_send_forget_mail : System.Web.UI.Page
{
    public string valid()
    {
        UserTBx user = new UserTBx();
        UserManager um = new UserManager();       
        user = um.GetByEmail(Request["email"]);
        if (user == null)
        {
            return "false";
        }
        else
        {          
            return "true";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (valid() == "true")
        {
            string subject = "Password Reset & Old Password";
            string body = "Hello. Here is the link to reset your password!Link: http://localhost:16790/NewPassword.aspx";
            string fromname = "Van Cong Bang";         
            UTIL.SendMail(Request["email"], subject, body, fromname,
            "test@ferya.info", "Capsole1@", "mail.iris.arvixe.com", 25);
        }
        Response.Write(valid());
    }
}