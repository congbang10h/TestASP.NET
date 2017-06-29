using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ImageManager
/// </summary>
public class ImageManager
{
    DataClassesDataContext DB = new DataClassesDataContext();
    public void Save()
    {
        DB.SubmitChanges();
    }
    public void AddNew(ImageTBx item)
    {
        DB.ImageTBxes.InsertOnSubmit(item);
        Save();
    }
    public ImageTBx GetByID(int? ID)
    {
        try
        {
            return DB.ImageTBxes.Where(u => u.ID == ID).FirstOrDefault();
        }
        catch
        {
            return null;
        }
    }
    public ImageTBx GetIDByBookID(int id)
    {
        return DB.ImageTBxes.Where(u => u.BookID == id).FirstOrDefault();
    }
    public ImageManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}