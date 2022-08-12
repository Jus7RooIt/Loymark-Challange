using LoymarkAPI.Data;
using LoymarkAPI.Entities;
using LoymarkAPI.Repository.IRepository;

namespace LoymarkAPI.Repository
{
    public class CountryRepository : ICountry
    {
        private readonly ApiDbContext _bd;

        public CountryRepository(ApiDbContext bd)
        {
            _bd = bd;
        }   

        ICollection<Country> ICountry.GetAll()
        {
            return _bd.Countries.ToList();
        }

        Country ICountry.GetByCode(string countryCode)
        {
            return _bd.Countries.FirstOrDefault(x => x.CountryCode.ToUpper() == countryCode.ToUpper());
        }
    }
}
