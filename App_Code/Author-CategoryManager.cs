using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Author_CategoryManager
/// </summary>
public class Author_CategoryManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void AddNew(List<Author_CategoryTBx> authorcategory)
    {
        DB.Author_CategoryTBxes.InsertAllOnSubmit(authorcategory);
        DB.SubmitChanges();
    }

    public List<Author_CategoryTBx>GetListID(int id)
    {
        return DB.Author_CategoryTBxes.Where(u => u.AuthorID == id).ToList();
    }
    public List<Author_CategoryTBx> GetList()
    {
        return DB.Author_CategoryTBxes.ToList();
    }
    public void DeleteCat(List<Author_CategoryTBx> authorcat)
    {
        DB.Author_CategoryTBxes.DeleteAllOnSubmit(authorcat);
        DB.SubmitChanges();
    }
    public Author_CategoryManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}