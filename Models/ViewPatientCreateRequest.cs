using System.ComponentModel.DataAnnotations;

namespace HelloDoc.Models
{
    public class ViewPatientCreateRequest 
    {
        [Required(ErrorMessage = "Symptoms is required")]
        public string Symptoms { get; set; }
        [Required(ErrorMessage = "Name is required")]
        [MaxLength(12)]
        public string FirstName { get; set; }

        public int? UserId { get; set; }

        public string? UserName { get; set; }

        public string? PassWord { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public DateTime BirthDate { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Contact is required")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid Phone number")]
        public string PhoneNumber { get; set; }
        [Required]
        public string Street { get; set; }
        [Required]
        public string City { get; set; }
        [Required]
        public string State { get; set; }
        [Required]
        public string ZipCode { get; set; }
        [Required]
        public string RoomSite { get; set; }

        public string? UploadImage { get; set; }
        [Required]
        public IFormFile? UploadFile { get; set; }


        public string? Realtion { get; set; }
    }
}
