using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace To_do
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is a postback to avoid executing this on initial load
            if (IsPostBack)
            {
                // Check if the selected value is "Yes"
                if (DropDownList1.SelectedItem.Text == "Yes")
                {
                    // Trigger a JavaScript alert to display the message for "Yes" selection
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "alert('Thank you for the feedback');", true);
                }
                else if (DropDownList1.SelectedItem.Text == "No")
                {
                    // Trigger a JavaScript alert to display the message for "No" selection
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "alert('We appreciate your feedback');", true);
                }
            }
        }


        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void SubmitFeedback_Click(object sender, EventArgs e)
        {
            string feedback = DropDownList1.SelectedItem.Text;
            string comment = TextBox1.Text;

            // Redirect to feedback page with query string containing the feedback data
            Response.Redirect("Feedback.aspx?feedback=" + feedback + "&comment=" + Server.UrlEncode(comment));
        }

    }
}