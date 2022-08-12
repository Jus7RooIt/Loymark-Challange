using LoymarkAPI.Entities;

namespace LoymarkAPI.Repository.IRepository
{
    public interface IActivity
    {
        ICollection<Activity> GetAll();
        Activity GetById(int id);
        bool Create(Activity activity);
        bool Update(Activity activity);
        bool Delete(Activity activity);

        bool Save();

    }
}
