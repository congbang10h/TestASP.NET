using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserManager
/// </summary>
public class UserManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(UserTBx user)
    {
        db.UserTBxes.InsertOnSubmit(user);
        Save();
    }

    public List<UserTBx> GetList()
    {
        return db.UserTBxes.ToList();
    }

    public UserTBx GetByUsername(string username)
    {
        return db.UserTBxes.Where(u => u.Username == username && u.Status != -1).FirstOrDefault();
    }

    public UserTBx GetByEmail(string email)
    {
        return db.UserTBxes.Where(u => u.Email == email && u.Status != -1).FirstOrDefault();
    }

    public UserManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}