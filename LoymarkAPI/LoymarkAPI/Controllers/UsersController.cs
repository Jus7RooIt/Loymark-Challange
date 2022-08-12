using LoymarkAPI.Entities;
using LoymarkAPI.Entities.Dtos;
using LoymarkAPI.Repository.IRepository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LoymarkAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private IUser _userRepository;
        private IActivity _activityRepository;
        private ICountry _countryRepository;


        public UsersController(IConfiguration config, IUser userRepository, IActivity activityRepository, ICountry countryRepository)
        {
            _userRepository = userRepository;
            _activityRepository = activityRepository;
            _countryRepository = countryRepository;
        }


        [HttpPost("CreateUser")]
        public IActionResult Create([FromBody] User newUser)
        {
            try
            {
                if (_userRepository.ExistEmail(newUser.Email))
                {
                    return StatusCode(412, "Email ya existe en base de datos");
                }
                Country country;
                country = _countryRepository.GetByCode(newUser.CountryCode);
                if (country == null )
                {
                    return StatusCode(412, "Codigo de país incorrecto");
                }
                newUser.CountryCode=country.CountryCode;

                var resp = _userRepository.Create(newUser);
                if (resp)
                {
                    Activity activity = new Activity();
                    activity.User = newUser;
                    activity.CreationDate = DateTime.Now;
                    string detail = "Usuario Creado - "
                        + "Nombre: " + newUser.Name + " - "
                        + "Apellido: " + newUser.LastName + " - "
                        + "Email: " + newUser.Email + " - "
                        + "Fecha Nac.: " + newUser.BirthDate.ToShortDateString() + " - "
                        + "Telefono: " + newUser.PhoneNumber + " - "
                        + "País: " + country.Name + " - "
                        + "Recibe Info: " + (newUser.IsNewsletterConfirmed ? "Si" : "No");
                    activity.Detail = detail;
                    activity.Type = Activity.ActivityType.CREATE;
                    _activityRepository.Create(activity);


                    return StatusCode(201, true);
                }
                else
                    return StatusCode(400, false);
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }

        // GET: api/Users/5
        [HttpGet("GetById")]
        public IActionResult GetById(int id)
        {
            try
            {
                var user = _userRepository.GetById(id);
                if (user != null)
                {
                    if (user.IdUser > 0)
                        return StatusCode(200, user);
                    else
                        return StatusCode(404, "No existe ese usuario");
                }
                else
                    return StatusCode(404, "No existe ese usuario");
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }

        [HttpGet("GetAll")]
        public IActionResult GetAllUsers()
        {
            try
            {
                var users = _userRepository.GetAll();
                if (users != null)
                {
                    if (users.Count > 0)
                        return StatusCode(200, users);
                    else
                        return StatusCode(200, users);
                }
                else
                    return StatusCode(200, users);
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }

        [HttpPatch("UpdateUser")]
        public IActionResult Update([FromBody] User userEdit)
        {
            try
            {
                if (_userRepository.ExistEmail(userEdit.Email,userEdit.IdUser))
                {
                    return StatusCode(412, "Email ya existe en base de datos");
                }
                Country country;
                country = _countryRepository.GetByCode(userEdit.CountryCode);
                if (country == null)
                {
                    return StatusCode(412, "Codigo de país incorrecto");
                }
                userEdit.CountryCode = country.CountryCode;

                if (!String.IsNullOrEmpty(userEdit.IdUser.ToString()))
                {
                    var resp = _userRepository.Update(userEdit);
                    if (resp)
                    {
                        Activity activity = new Activity();
                        activity.User = userEdit;
                        activity.CreationDate = DateTime.Now;
                        string detail = "Usuario Editado - "
                            + "Nombre: " + userEdit.Name + " - "
                            + "Apellido: " + userEdit.LastName + " - "
                            + "Email: " + userEdit.Email + " - "
                            + "Fecha Nac.: " + userEdit.BirthDate.ToShortDateString() + " - "
                            + "Telefono: " + userEdit.PhoneNumber + " - "
                            + "País: " + country.Name + " - "
                            + "Recibe Info: " + (userEdit.IsNewsletterConfirmed ? "Si" : "No");
                        activity.Detail = detail;
                        activity.Type = Activity.ActivityType.UPDATE;
                        _activityRepository.Create(activity);

                    }
                    return StatusCode(200, new { code = 1, message = "Se actualizo el usuario correctamente" });
                }
                else
                    return StatusCode(404, new { code = 2, message = "No se encontro el usuario" });
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }

        [HttpPost("DeleteUser")]
        public IActionResult Delete([FromBody] UserDeleteDto deleteUserDto)
        {
            try
            {
                User deleteUser = new Entities.User();
                bool resp = false;
                if (deleteUser != null)
                    deleteUser = _userRepository.GetById(deleteUserDto.IdUser);
                if (deleteUser != null)
                {
                    Country country;
                    country = _countryRepository.GetByCode(deleteUser.CountryCode);
                    if (country == null)
                    {
                        return StatusCode(412, "Codigo de país incorrecto");
                    }
                    deleteUser.LowDate = DateTime.Now;
                    resp = _userRepository.Update(deleteUser);
                    if (resp)
                    {
                        Activity activity = new Activity();
                        activity.User = deleteUser;
                        activity.CreationDate = DateTime.Now;
                        string detail = "Usuario Eliminado - "
                            + "Nombre: " + deleteUser.Name + " - "
                            + "Apellido: " + deleteUser.LastName + " - "
                            + "Email: " + deleteUser.Email + " - "
                            + "Fecha Nac.: " + deleteUser.BirthDate.ToShortDateString() + " - "
                            + "Telefono: " + deleteUser.PhoneNumber + " - "
                            + "País: " + country.Name + " - "
                            + "Recibe Info: " + (deleteUser.IsNewsletterConfirmed ? "Si" : "No");
                        activity.Detail = detail;
                        activity.Type = Activity.ActivityType.DELETE;
                        _activityRepository.Create(activity);
                    }
                }
                else
                    return StatusCode(404, false);

                if (resp)
                    return StatusCode(200, true);
                else
                    return StatusCode(400, false);
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }
    }
}