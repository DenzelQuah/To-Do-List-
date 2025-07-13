<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notes.aspx.cs" Inherits="To_do.notes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>To-Do List</title>
    <style>
        body {
            background-color: #FFF8DC; /* Warm 'cornsilk' color */
            font-family: Arial, sans-serif; /* Clean font for readability */
            margin: 0;
            padding: 0;
        }

        /* Container for centering the entire content */
        .centered-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            text-align: center;
            padding: 20px;
        }

        /* Table styling for borders */
        .auto-style1 {
            width: 100%;
            max-width: 943px;
            border: 2px solid #4CAF50;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .auto-style1 td {
            border: 1px solid #4CAF50;
            padding: 8px;
            vertical-align: top;
        }
        .auto-style-image {
            width: 100%;
            max-width: 280px;
            height: auto;
        }
        .auto-style20, .auto-style7, .auto-style22, .auto-style24 {
            padding: 8px;
            vertical-align: top;
            width: 100%;
        }

        /* Center the container */
        .styled-heading {
            font-size: 24px;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        /* Navigation button styling */
        .nav-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            background-color: aquamarine;
            padding: 10px;
        }
        .nav-button {
            display: inline-block;
            padding: 10px 20px;
            margin: 5px;
            border: 2px solid #4CAF50;
            border-radius: 5px;
            background-color: #ffffff;
            color: #4CAF50;
            text-decoration: none;
            font-family: 'Comic Sans MS', sans-serif;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s, color 0.3s;
        }
        .nav-button:hover {
            background-color: #4CAF50;
            color: #ffffff;
        }

        /* Light green background for panels */
        .todo-background {
            background-color: lightblue; /* Light blue for contrast */
            padding: 10px;
            border-radius: 5px;
        }

        /* Responsive styling for smaller screens */
        @media (max-width: 768px) {
            .auto-style1 {
                width: 100%;
            }
            .nav-container {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
  <div class="centered-container">
    <form id="form1" runat="server">
      <h2 class="styled-heading">To-Do List</h2>

      <table class="auto-style1">
        <tr>
          <td>
           
              <asp:Image ID="Image2" src="To-do listy.png" runat="server" Width="300px" Height="500px"  />
          </td>

          <td>
            <div class="nav-container">
              <asp:HyperLink ID="LinkButton1" runat="server" NavigateUrl="home.aspx" CssClass="nav-button">Home</asp:HyperLink>
              <asp:LinkButton ID="LinkButton2" runat="server" CssClass="nav-button">To-do Notes</asp:LinkButton>
            </div>
          </td>
          
          <td>  
              <asp:Image ID="Image1" src="WAD1.jpg" runat="server" Width="300px" Height="500px"  />
          </td>
        </tr>

        <tr> 
          <td> 
            <asp:TextBox ID="noteInput" runat="server" Placeholder="Enter a list item"></asp:TextBox>
            <asp:Button ID="btnAddNote" runat="server" Text="Add List" OnClick="AddNote_Click" />
          </td>
          <td>
            <div>
              <asp:TextBox ID="txtNewItem" runat="server" placeholder="Enter a new item"></asp:TextBox>
              <asp:Button ID="btnAddItem" runat="server" Text="Add Notes" OnClick="btnAddItem_Click" />
            </div>
          </td>
          <td>
            <asp:TextBox ID="searchInput" runat="server" Placeholder="Search notes"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchNotes_Click" />
          </td>
        </tr>

        <tr>
          <td>
            <asp:Label ID="Label3" runat="server" Text="To-do list">  </asp:Label>
          </td>
          <td>
            <asp:Label ID="Label2" runat="server" Text="Notes">  </asp:Label>
          </td>
          <td>
            <asp:Label ID="Label1" runat="server" Text="Calendar">  </asp:Label>
          </td>
        </tr>

        <tr>
          <td>
            <asp:Panel ID="todo1" runat="server" CssClass="todo-background"></asp:Panel>
          </td>

          <td>
            <asp:Panel ID="note" runat="server" CssClass="todo-background">  </asp:Panel>
          </td>

          <td>
            <asp:Calendar ID="Calendar1" runat="server">  </asp:Calendar>
          </td>
        </tr>

        <tr>
          <td>
            <asp:Label ID="Label4" runat="server" Text="Total to-do list: "></asp:Label>
            <asp:Panel ID="totaltodo" runat="server"></asp:Panel>
          </td>
          <td>
            <asp:Label ID="Label5" runat="server" Text="Total Notes: ">  </asp:Label>
            <asp:Panel ID="totalnotes" runat="server"></asp:Panel>
          </td>

          <td>
            <asp:Label ID="Label6" runat="server" Text="Comment: ">  </asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" Height="70px" Width="198px">  </asp:TextBox>
          </td>
        </tr>
      </table>

    </form>
  </div>
</body>
</html>
