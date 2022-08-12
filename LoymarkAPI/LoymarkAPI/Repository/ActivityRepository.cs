using LoymarkAPI.Data;
using LoymarkAPI.Entities;
using LoymarkAPI.Repository.IRepository;
using Microsoft.EntityFrameworkCore;

namespace LoymarkAPI.Repository
{
    public class ActivityRepository : IActivity
    {
        private readonly ApiDbContext _bd;

        public ActivityRepository(ApiDbContext bd)
        {
            _bd = bd;
        }

        public bool Create(Activity activity)
        {
            var resp = _bd.Activities.Add(activity);
            return Save();
        }

        public ICollection<Activity> GetAll()
        {
            return _bd.Activities.Include(x=>x.User).OrderByDescending(x=>x.CreationDate).ToList();
        }

        public Activity GetById(int id)
        {
            return _bd.Activities.FirstOrDefault(x => x.IdUser == id);
        }

        public bool Update(Activity activity)
        {
            _bd.Activities.Update(activity);
            return Save();
        }

        public bool Delete(Activity activity)
        {
            _bd.Activities.Remove(activity);
            return Save();
        }

        public bool Save()
        {
            return _bd.SaveChanges() >= 0 ? true : false;
        }
    }
}
