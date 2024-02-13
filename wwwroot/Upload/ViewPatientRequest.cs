﻿namespace HELLO_DOC.Models
{
    public class ViewPatientRequest
    {
        public string Id { get; set; } = null!;
        public string Symptoms { get; set; }
        public string FirstName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string RoomSite { get; set; }
    }
}