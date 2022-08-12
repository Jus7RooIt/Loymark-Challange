using LoymarkAPI.Repository.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LoymarkAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CountriesController : ControllerBase
    {
        private ICountry _countryRepository;

        public CountriesController(IConfiguration config, ICountry countryRepository)
        {
            _countryRepository = countryRepository;
        }
        [HttpGet("GetAllCountries")]
        public IActionResult GetAllCountries()
        {
            try
            {
                var countries = _countryRepository.GetAll().OrderBy(x => x.Name).ToList();
                if (countries != null)
                {
                    if (countries.Count > 0)
                        return StatusCode(200, countries);
                    else
                        return StatusCode(200, "No existen países guardados");
                }
                else
                    return StatusCode(200, "No existen países guardados");
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }
    }
}
