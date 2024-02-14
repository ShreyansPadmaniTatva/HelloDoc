using System.ComponentModel.DataAnnotations;

namespace HelloDoc.Models
{
    public class ViewPatientDashboard
    {
        public int? Requestid { get; set; }
        public int? Status { get; set; }
        public DateTime? Createddate { get; set; }
        public int? FileCount { get; set; }
        public string? Filename { get; set; }

    }
}
