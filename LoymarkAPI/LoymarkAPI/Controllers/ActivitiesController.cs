using LoymarkAPI.Repository.IRepository;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace LoymarkAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActivitiesController : ControllerBase
    {
        private IActivity _activityRepository;
        private IUser _userRepository;


        public ActivitiesController(IConfiguration config, IActivity activityRepository, IUser userRepository)
        {
            _activityRepository = activityRepository;
            _userRepository = userRepository;
        }

        [HttpGet("GetAllActivities")]
        public IActionResult GetAllActivities()
        {
            try
            {
                var activities = _activityRepository.GetAll();
                //var users = _userRepository.GetAllWithDeleted();
                //foreach (var activity in activities)
                //{
                //    activity.User = users.FirstOrDefault(x => x.IdUser == activity.IdUser);
                //}
                if (activities != null)
                {
                    if (activities.Count > 0)
                        return StatusCode(200, activities);
                    else
                        return StatusCode(200, activities);
                }
                else
                    return StatusCode(200, activities);
            }
            catch (Exception)
            {
                return StatusCode(500, "Hubo un problema");
                throw;
            }
        }

    }
}
