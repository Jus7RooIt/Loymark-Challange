using LoymarkAPI.Entities;
using AutoMapper;
using LoymarkAPI.Entities.Dtos;

namespace LoymarkAPI.Mappers
{
    public class Mappers : Profile
    {
        public Mappers()
        {
            CreateMap<User, UserDeleteDto>().ReverseMap();
        }
    }
}
