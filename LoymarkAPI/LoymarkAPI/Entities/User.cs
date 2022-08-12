using System.ComponentModel.DataAnnotations;

namespace LoymarkAPI.Entities
{
    public class User
    {
        [Key]
        public int IdUser { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public DateTime BirthDate { get; set; }
        public string? PhoneNumber { get; set; }
        public string CountryCode { get; set; }
        public bool IsNewsletterConfirmed { get; set; }
        public DateTime? LowDate { get; set; }
    }
}
