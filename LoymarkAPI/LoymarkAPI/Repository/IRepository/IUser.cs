using LoymarkAPI.Entities;

namespace LoymarkAPI.Repository.IRepository
{
    public interface IUser
    {
        ICollection<User> GetAll();
        ICollection<User> GetAllWithDeleted();
        User GetById(int id);
        bool Create(User user);
        bool Update(User user);
        bool Delete(User user);
        //bool ExistEmail(string email);
        bool ExistEmail(string email, int? idUser=null);

        bool Save();

    }
}
