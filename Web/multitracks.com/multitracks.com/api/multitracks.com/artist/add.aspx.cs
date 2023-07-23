using DataAccess;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_artist_add : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // No specific initialization needed on page load
    }

    protected void btnAddArtist_Click(object sender, EventArgs e)
    {
        string artistName = txtArtistName.Text.Trim();
        string biography = txtBiography.Text.Trim();
        string imageUrl = txtImageUrl.Text.Trim();
        string heroUrl = txtHeroUrl.Text.Trim(); // Assuming you have an input field for the hero URL.

        // Insert the artist details into the database and get the result message
        string resultMessage = InsertArtistIntoDatabase(artistName, biography, imageUrl, heroUrl);
        lblResultMessage.Visible = true;
        // Display the result message on the page
        lblResultMessage.Text = resultMessage;
    }

    private string InsertArtistIntoDatabase(string artistName, string biography, string imageUrl, string heroUrl)
    {
        try
        {
            // Create and configure the SqlCommand object to insert the data
            var sql = new SQL();
            sql.Parameters.Add("@title", artistName);
            sql.Parameters.Add("@biography", biography);
            sql.Parameters.Add("@imageURL", imageUrl);
            sql.Parameters.Add("heroURL", heroUrl);
            var data = sql.ExecuteStoredProcedureDT("AddArtist");

            return "ADDITION SUCCESSFUL";

        }
        catch (Exception ex)
        {
            return "An error occurred while adding the artist. Please try again later.";
        }
    }
}
