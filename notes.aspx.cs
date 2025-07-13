using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace To_do
{
    public partial class notes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize ViewState lists and counters
                if (ViewState["Notes"] == null)
                    ViewState["Notes"] = new List<string>();

                if (ViewState["TodoList"] == null)
                    ViewState["TodoList"] = new List<string>();

                if (ViewState["AddNoteClickCount"] == null)
                    ViewState["AddNoteClickCount"] = 0;

                if (ViewState["AddListClickCount"] == null)
                    ViewState["AddListClickCount"] = 0;
            }
            else
            {
                // Repopulate notes and list items on postback
                PopulateNotes();
                PopulateTodoList();
            }
            DisplayTotalClicks();
            DisplayTotalNotes();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            // Handle checkbox change event
        }

        // FUNCTION FOR ADD NOTE LIST
        protected void AddNote_Click(object sender, EventArgs e)
        {
            string newInput = noteInput.Text.Trim();

            if (!string.IsNullOrEmpty(newInput))
            {
                // Increment the Add To-do List counter
                int addTodoClickCount = (int)ViewState["AddListClickCount"];
                ViewState["AddListClickCount"] = ++addTodoClickCount;

                // Add the new note to the TodoList in ViewState
                var todoList = (List<string>)ViewState["TodoList"];
                todoList.Add(newInput);
                ViewState["TodoList"] = todoList;

                // Clear the textbox
                noteInput.Text = "";

                // Refresh the todo list panel to show the new item with a checkbox
                PopulateTodoList();

                // Update and display the to-do list count
                DisplayTotalClicks();
            }
        }


        //FUNCTION FOR ADD LIST


        // FUNCTION FOR ADD NOTES
        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            string newItemText = txtNewItem.Text.Trim();

            if (!string.IsNullOrEmpty(newItemText))
            {
                // Increment the Add Note counter
                int addNoteClickCount = (int)ViewState["AddNoteClickCount"];
                ViewState["AddNoteClickCount"] = ++addNoteClickCount;

                // Add the new note to the Notes list in ViewState
                var notes = (List<string>)ViewState["Notes"];
                notes.Add(newItemText);
                ViewState["Notes"] = notes;

                // Clear the textbox
                txtNewItem.Text = "";

                // Refresh the notes panel to show the new item
                PopulateNotes();

                // Update and display the notes count
                DisplayTotalNotes();
            }
        }


        // FUNCTION FOR ADD NOTES
        private void PopulateNotes()
        {
            note.Controls.Clear(); // Clear existing controls

            // Retrieve notes from ViewState
            var notes = ViewState["Notes"] as List<string>;
            if (notes != null && notes.Count > 0)
            {
                foreach (string noteText in notes)
                {
                    Label lblNote = new Label
                    {
                        Text = noteText,
                        CssClass = "note-item" // Optional styling
                    };
                    note.Controls.Add(lblNote);
                    note.Controls.Add(new Literal { Text = "<br />" }); // Line break
                }
            }
            else
            {
                Label lblNoNotes = new Label
                {
                    Text = "No notes available.",
                    CssClass = "note-item" // Optional styling
                };
                note.Controls.Add(lblNoNotes);
            }
        }

        private void PopulateTodoList()
        {
            todo1.Controls.Clear(); // Clear existing controls

            // Retrieve list items from ViewState and add them to the panel
            var todoList = (List<string>)ViewState["TodoList"];
            if (todoList != null)
            {
                for (int i = 0; i < todoList.Count; i++)
                {
                    string item = todoList[i];

                    // Create a CheckBox for each item with a unique ID
                    CheckBox chkItem = new CheckBox
                    {
                        Text = item,
                        ID = "chkItem_" + i, // Unique ID based on index
                        AutoPostBack = true // Allows triggering event on check
                    };

                    // Add event handler for checkbox change
                    chkItem.CheckedChanged += new EventHandler(CheckBox1_CheckedChanged);

                    // Add the CheckBox to the panel
                    todo1.Controls.Add(chkItem);

                    // Add a line break after each item
                    todo1.Controls.Add(new Literal { Text = "<br />" });
                }
            }
        }
        protected void SearchNotes_Click(object sender, EventArgs e)
        {
            string searchTerm = searchInput.Text.Trim();

            if (!string.IsNullOrEmpty(searchTerm))
            {
                // Search notes with a for loop and IndexOf
                var notes = (List<string>)ViewState["Notes"];
                var filteredNotes = new List<string>();
                foreach (string note in notes)
                {
                    if (note.IndexOf(searchTerm, StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        filteredNotes.Add(note);
                    }
                }
                DisplayFilteredNotes(filteredNotes);

                // Search to-do list with a for loop and IndexOf
                var todoList = (List<string>)ViewState["TodoList"];
                var filteredTodoList = new List<string>();
                foreach (string item in todoList)
                {
                    if (item.IndexOf(searchTerm, StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        filteredTodoList.Add(item);
                    }
                }
                DisplayFilteredTodoList(filteredTodoList);
            }
            else
            {
                PopulateNotes();
                PopulateTodoList();
            }
        }


        // Helper method to display filtered notes in the 'note' panel
        private void DisplayFilteredNotes(List<string> filteredNotes)
        {
            note.Controls.Clear();
            if (filteredNotes.Count > 0)
            {
                foreach (string noteText in filteredNotes)
                {
                    Label lblNote = new Label
                    {
                        Text = noteText,
                        CssClass = "note-item"
                    };
                    note.Controls.Add(lblNote);
                    note.Controls.Add(new Literal { Text = "<br />" });
                }
            }
            else
            {
                Label lblNoNotes = new Label
                {
                    Text = "No matching notes found.",
                    CssClass = "note-item"
                };
                note.Controls.Add(lblNoNotes);
            }
        }

        // Helper method to display filtered to-do items in the 'todo1' panel
        private void DisplayFilteredTodoList(List<string> filteredTodoList)
        {
            todo1.Controls.Clear();
            if (filteredTodoList.Count > 0)
            {
                for (int i = 0; i < filteredTodoList.Count; i++)
                {
                    string item = filteredTodoList[i];
                    CheckBox chkItem = new CheckBox
                    {
                        Text = item,
                        ID = "chkItem_" + i,
                        AutoPostBack = true
                    };
                    chkItem.CheckedChanged += new EventHandler(CheckBox1_CheckedChanged);
                    todo1.Controls.Add(chkItem);
                    todo1.Controls.Add(new Literal { Text = "<br />" });
                }
            }
            else
            {
                Label lblNoItems = new Label
                {
                    Text = "No matching to-do items found.",
                    CssClass = "note-item"
                };
                todo1.Controls.Add(lblNoItems);
            }
        }

        private void DisplayTotalClicks()
        {
            // Retrieve the Add To-do List click count from ViewState
            int addTodoClickCount = (int)ViewState["AddListClickCount"];

            // Display the count in the Label
            Label4.Text = $"Total to-do list: {addTodoClickCount}";
        }

        private void DisplayTotalNotes()
        {
            // Retrieve the Add Note click count from ViewState
            int addNoteClickCount = (int)ViewState["AddNoteClickCount"];

            // Display the count in the Label
            Label5.Text = $"Total Notes: {addNoteClickCount}";
        }


    }
}