using LoymarkAPI.Entities;

namespace LoymarkAPI.Repository.IRepository
{
    public interface ICountry
    {
        ICollection<Country> GetAll();
        Country GetByCode(string countryCode);

    }
}
