using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;
using System.Web.Security;
using BLL;
using DAL;

namespace Monkey_Business
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            MemberHandler memberHandler = new MemberHandler();
            Member member = null;
            BusinessHandler businessHandler = null;
            Business business = null;

            string destinationEmail = txtEmail.Text;

            //check email exists
            if (memberHandler.ValidateEmail(destinationEmail) == false)
            {
                //email doesn't exist in DB
                lblProgress.Text = "Invalid Email Address";
            }

            else
            {
                //get business email and password
                string businessName, businessEmail, businessPassword, emailServer, newPassword;
                int port;

                businessHandler = new BusinessHandler();
                business = new Business();
                business = businessHandler.GetBusinessDetails();

                businessName = business.Name;
                businessEmail = business.Email;
                businessPassword = business.EmailPassword;
                emailServer = business.EmailServer;
                port = business.EmailPort;

                //generate new password
                newPassword = Membership.GeneratePassword(7, 0);

                //update database
                member = new Member();
                member.Email = destinationEmail;
                member.Password = newPassword;

                //send email
                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient smtpClient = new SmtpClient(emailServer);
                    mail.From = new MailAddress(businessEmail);
                    mail.To.Add(destinationEmail);
                    mail.Subject = businessName + " Password Reset";
                    mail.Body = "Your password has been reset. Please use the following phrase as your new password when you log in: " + newPassword;

                    //code to include an attatchment
                    //System.Net.Mail.Attachment attachment;
                    //attachment = new System.Net.Mail.Attachment("attatchment.jpg");
                    //mail.Attachments.Add(attachment);

                    smtpClient.Port = port;
                    smtpClient.Credentials = new NetworkCredential(businessEmail, businessPassword);
                    smtpClient.EnableSsl = true;

                    smtpClient.Send(mail);
                    memberHandler.UpdateMemberPassword(member);

                    lblProgress.CssClass = "label label-success";
                    lblProgress.Text = "An email was sent, check you email for your new password.";

                    //delay redirect to alert user of page change
                    lblRedirect.Text = "Redirecting to log in, in 5 seconds.";
                    Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"Login.aspx\"; }, 5000);</script>");
                }
                catch (Exception ex)
                {
                    lblProgress.Text = "Failed to send an email." + ex.ToString();
                }
            }
        }
    }
}