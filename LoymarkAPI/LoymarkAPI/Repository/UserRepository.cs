using LoymarkAPI.Data;
using LoymarkAPI.Entities;
using LoymarkAPI.Repository.IRepository;

namespace LoymarkAPI.Repository
{
    public class UserRepository : IUser
    {
        private readonly ApiDbContext _bd;

        public UserRepository(ApiDbContext bd)
        {
            _bd = bd;
        }
        public bool Create(User user)
        {
            var resp = _bd.Users.Add(user);
            return Save();
        }

        public bool Delete(User user)
        {
            _bd.Users.Remove(user);
            return Save();
        }

        public ICollection<User> GetAll()
        {
            return _bd.Users.Where(x => x.LowDate == null).OrderBy(x => x.LastName).ToList();
        }
        public ICollection<User> GetAllWithDeleted()
        {
            return _bd.Users.ToList();
        }

        public User GetById(int id)
        {
            return _bd.Users.FirstOrDefault(x => x.IdUser == id);
        }
        public bool ExistEmail(string email, int? idUser=null)
        {
            if(idUser==null)
                return _bd.Users.FirstOrDefault(x => x.Email == email && x.LowDate == null) != null ? true : false;
            else
                return _bd.Users.FirstOrDefault(x => x.Email == email && x.IdUser!=idUser && x.LowDate == null) != null ? true : false;
        }

        public bool Save()
        {
            return _bd.SaveChanges() >= 0 ? true : false;
        }

        public bool Update(User user)
        {
            _bd.Users.Update(user);
            return Save();
        }
    }
}
