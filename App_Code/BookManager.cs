using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BookManager
/// </summary>
public class BookManager
{
    DataClassesDataContext db = new DataClassesDataContext();
    public void Save()
    {
        db.SubmitChanges();
    }

    public void AddNew(BookTBx book)
    {
        db.BookTBxes.InsertOnSubmit(book);
        Save();
    }

    public BookTBx GetByID(int id)
    {
        return db.BookTBxes.Where(u => u.ID == id && u.Status != -1).FirstOrDefault();
    }

    public List<BookTBx> GetList()
    {
        return db.BookTBxes.Where(u => u.Status != -1).ToList();
    }
    public BookManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}