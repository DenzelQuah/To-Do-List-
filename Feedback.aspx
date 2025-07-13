<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="To_do.Feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback</title>
    <style type="text/css">
        /* Basic styling for the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
      .nav-container {
     background-color: darkcyan;
     padding: 15px 0;
     display: flex;
     justify-content: center;
     gap: 30px; /* More space between buttons */
 }

 .nav-button {
     background-color: lightseagreen; /* Green background */
     color: white;
     font-size: 18px;
     font-weight: bold;
     padding: 12px 24px; /* Increased padding for larger buttons */
     border: none;
     border-radius: 12px; /* Rounded corners for modern look */
     cursor: pointer;
     transition: background-color 0.3s, transform 0.2s ease-in-out; /* Smooth transition for color and transform */
     outline: none;
     box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Light shadow for depth */
 }

 .nav-button:hover {
     background-color: #45a049; /* Darker green on hover */
     transform: scale(1.05); /* Slight zoom effect on hover */
 }
        .feedback-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .feedback-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="nav-container">
        <a href="Home.aspx" class="nav-button">Home</a>
        <a href="notes.aspx" class="nav-button">To-do Notes</a>
    </div>

    <form id="form1" runat="server">
        <!-- Feedback Form Section -->
        <div class="feedback-container">
            <h2>Feedback Page</h2>

            <!-- Display Feedback -->
            <asp:Label ID="LabelFeedback" runat="server" Text="Feedback: " Font-Bold="true" Font-Size="Medium" />
            <br />
            <asp:Label ID="LabelFeedbackResult" runat="server" Text="" Font-Size="Large" ForeColor="Blue" />
            <br />
            <br />
            <asp:Label ID="LabelComment" runat="server" Text="Your Comments: " Font-Bold="true" Font-Size="Medium" />
            <br />
            <asp:TextBox ID="TextBoxComment" runat="server" TextMode="MultiLine" Rows="4" Width="100%"></asp:TextBox>
        </div>
    </form>

    <script type="text/javascript">
        // You can add any additional JavaScript here if needed.
    </script>
</body>
</html>