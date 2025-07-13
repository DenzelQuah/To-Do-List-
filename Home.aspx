<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="To_do.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>To-do Home</title>
    <style type="text/css">
        /* Basic Styling */
        body {
            color: black;
            font-family: "Courier New";
            text-align: center;
            background-color: #e0efff; /* Slightly darker background for better contrast */
            margin: 0;
            padding: 0;
        }

        /* Navigation Button Styling */
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

        /* Layout for Page Sections */
        .header-container {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 50px;
            gap: 20px;
        }

        .header-container img {
            width: 350px;
            height: auto;
        }

        /* Main Content Section */
        .main-content {
            display: flex;
            flex-direction: row;
            justify-content: center;
            gap: 40px;
            margin-top: 30px;
            padding: 20px;
        }

        .content-box {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 8px;
            color: white;
            max-width: 350px;
            text-align: justify;
        }

        /* Benefits Table Styling */
        .benefits-table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
        }

        .benefits-table .benefit-label-row {
            background-color: orange;
            color: white;
        }

        .benefits-table .benefit-description-row {
            background-color: lightgray;
            color: #333333;
        }

        .benefits-table td {
            padding: 15px;
            border: 1px solid #333;
            font-family: 'Times New Roman', serif;
            text-align: center;
        }

        .benefit-description {
            font-size: 14px;
            text-align: justify;
        }

        .label-red, .label-green, .label-blue {
            font-weight: bold;
            font-size: 18px;
            color: cyan;
        }

        /* Footer Table Styling */
        .footer-table {
            width: 80%;
            margin: 40px auto;
            border-collapse: collapse;
            color: black; /* Ensure all footer text is black */
        }

        .footer-table td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        .logo-image {
            width: 150px;
            height: auto;
            margin: 20px auto;
            display: block;
            padding: 5px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Tagline Styling */
        .tagline-label {
            display: block;
            font-size: 20px;
            color: #333;
            margin-top: 10px;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header with Logo and TextBox -->
        <div class="header-container">
            <asp:Image ID="Image1" src="logo-color.png" class="logo-image" runat="server" />
        </div>
        <asp:Label ID="Label1" runat="server" Text="The Website That Provides You Satisfaction On Doing Notes" CssClass="tagline-label"></asp:Label>

        <!-- Navigation Links -->
        <div class="nav-container">
            <asp:Button ID="Button1" runat="server" Text="Home" CssClass="nav-button" OnClientClick="navigateToPage('home.aspx'); return false;" />
            <asp:Button ID="Button2" runat="server" Text="To-do Notes" CssClass="nav-button" OnClientClick="navigateToPage('notes.aspx'); return false;" />
        </div>

        <script type="text/javascript">
            function navigateToPage(page) {
                window.location.href = page; // Redirect to the specified page
            }
        </script>

        <!-- Main Content Area -->
        <div class="main-content">
            <div class="content-box">
                <asp:Image ID="Image2" src="logo-grayscale.png" runat="server" Width="100%" Height="350px" />
                <p>
                    Welcome to our organization, where we are committed to excellence and innovation. Our goal is to create value and positively impact the communities we serve by delivering high-quality solutions and fostering an inclusive environment.
                    We believe in teamwork, transparency, and continuous improvement as we work together to achieve a sustainable future for all.
                </p>
            </div>

            <!-- Benefits Table -->
            <table class="benefits-table">
                <tr class="benefit-label-row">
                    <td>
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <div style="width: 20px; height: 20px; background-color: black; margin-right: 10px; border-radius: 3px;"></div>
                            <asp:Label ID="Label2" runat="server" Text="Benefits #1" Font-Bold="true" Font-Names="Georgia"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr class="benefit-description-row">
                    <td>
                        <p class="benefit-description" style="font-family: Helvetica; font-weight: 600; color: #333333;">
                            Seamlessly switch between your to-do list and notes. Capture ideas, reminders, and important details without missing a beat.
                        </p>
                    </td>
                </tr>
                <tr class="benefit-label-row">
                    <td>
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <div style="width: 20px; height: 20px; background-color: black; margin-right: 10px; border-radius: 3px;"></div>
                            <asp:Label ID="Label3" runat="server" Text="Benefits #2" Font-Bold="true" Font-Names="Georgia"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr class="benefit-description-row">
                    <td>
                        <p class="benefit-description" style="font-family: Helvetica; font-weight: 600; color: #333333;">
                            No more worries about forgetting tasks! Our platform keeps your to-do list front and center, helping you stay organized and focused.
                        </p>
                    </td>
                </tr>
                <tr class="benefit-label-row">
                    <td>
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <div style="width: 20px; height: 20px; background-color: black; margin-right: 10px; border-radius: 3px;"></div>
                            <asp:Label ID="Label4" runat="server" Text="Benefits #3" Font-Bold="true" Font-Names="Georgia"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr class="benefit-description-row">
                    <td>
                        <p class="benefit-description" style="font-family: Helvetica; font-weight: 600; color: #333333;">
                            Access your to-do list, notes, and calendar all in one place, saving you valuable time each day.
                        </p>
                    </td>
                </tr>
            </table>
        </div>

        <!-- Footer Information Table -->
        <table class="footer-table">
            <tr>
                <td>
                    <asp:Label ID="Label21" runat="server" Text="Are You Satisfied?" BorderColor="Black" ForeColor="Black"></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                        <asp:ListItem>Please Select The Feedback </asp:ListItem>
                        <asp:ListItem>Yes</asp:ListItem>
                        <asp:ListItem>No</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label22" runat="server" Text="Leave A Comment"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                   <asp:Button ID="SubmitFeedback" runat="server" Text="Submit Feedback" OnClick="SubmitFeedback_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
