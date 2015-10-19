using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;

namespace Monkey_Business
{
    public partial class SuccessfullBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUploadPOP_Click(object sender, EventArgs e)
        {
            Response.Redirect("UploadProof.aspx?id=" + Session["BookingID"].ToString());
        }

        protected void btnViewInvoice_Click(object sender, EventArgs e)
        {
            Response.Redirect("Invoice.aspx?id=" + Session["BookingID"].ToString());
        }
    }
}