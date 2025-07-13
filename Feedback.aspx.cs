using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace To_do
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["feedback"] != null)
            {
                // Display the feedback value from the query string
                LabelFeedbackResult.Text = Request.QueryString["feedback"];
            }
            if (!IsPostBack)
            {
                string feedback = Request.QueryString["feedback"];
                string comment = Request.QueryString["comment"];

                if (!string.IsNullOrEmpty(feedback) && !string.IsNullOrEmpty(comment))
                {
                    // Display the feedback and comment
                    LabelFeedback.Text = "Satisfaction: " + feedback;
                    LabelComment.Text = "Comment: " + comment;
                }
                else
                {
                    LabelFeedback.Text = "No feedback provided.";
                    LabelComment.Text = "No comment provided.";
                }
            }
        }

    }
}
