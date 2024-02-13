using System.Net.Mail;
using System.Net;
using HelloDoc.Controllers;

namespace HelloDoc.Data
{

    public class EmailConfiguration
    {
        
        public string From { get; set; }
        public string SmtpServer { get; set; }
        public int Port { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public Boolean SendMail(String To, String Subject, String Body)
        {
            ServicePointManager.ServerCertificateValidationCallback =
                (sender, certificate, chain, sslPolicyErrors) => true;

            //send mail
            MailMessage message = new MailMessage();
            message.From = new MailAddress(From);
            message.Subject = Subject;
            message.To.Add(new MailAddress(To));
            message.Body = Body;
            message.IsBodyHtml = true;
            using (var smtpClient = new SmtpClient(SmtpServer))
            {
                smtpClient.Port = Port;
                smtpClient.Credentials = new NetworkCredential(UserName, Password);
                smtpClient.EnableSsl = true;

                smtpClient.Send(message);
            }
            return true;
        }
    }
   
}
