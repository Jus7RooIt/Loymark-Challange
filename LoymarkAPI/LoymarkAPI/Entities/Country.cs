using System.ComponentModel.DataAnnotations;

namespace LoymarkAPI.Entities
{
    public class Country
    {
        [Key]
        public string CountryCode { get; set; }
        public string Name { get; set; }
    }
}
