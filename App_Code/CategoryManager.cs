using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CategoryManager
/// </summary>
public class CategoryManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }
    public void AddNew(CategoryTBx category)
    {
        db.CategoryTBxes.InsertOnSubmit(category);
        Save();
    }
    public CategoryTBx GetByID(int id)
    {
        return db.CategoryTBxes.Where(u => u.ID == id && u.Status != -1).FirstOrDefault();
    }

    public List<CategoryTBx> GetList()
    {
        return db.CategoryTBxes.Where(u => u.Status != -1).ToList();
    }
    public CategoryManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}