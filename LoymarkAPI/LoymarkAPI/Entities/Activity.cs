using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LoymarkAPI.Entities
{
    public class Activity
    {
        [Key]
        public int IdActivity { get; set; }
        public DateTime CreationDate { get; set; }
        public int IdUser { get; set; }
        [ForeignKey("IdUser")]
        public User User { get; set; }
        public string Detail { get; set; }
        public ActivityType Type { get; set; }

        public enum ActivityType
        {
            CREATE   = 1,
            READ_ONE = 2,
            UPDATE   = 3,
            DELETE   = 4,
            READ_ALL = 5,
        }
   
    }
}
