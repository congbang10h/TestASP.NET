using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AuthorManager
/// </summary>
public class AuthorManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(AuthorTBx author)
    {
        db.AuthorTBxes.InsertOnSubmit(author);
        Save();
    }
    public AuthorTBx GetByID(int id)
    {
        return db.AuthorTBxes.Where(u => u.ID == id && u.Status != -1).FirstOrDefault();
    }

    public List<AuthorTBx> GetList()
    {
        return db.AuthorTBxes.Where(u => u.Status != -1).ToList();
    }
    public AuthorManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}