﻿using DataAccess;
using System;


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

        if (string.IsNullOrEmpty(artistName) || string.IsNullOrEmpty(biography) || 
            string.IsNullOrEmpty(imageUrl) || string.IsNullOrEmpty(heroUrl))
        {
            lblResultMessage.Visible = true;
            lblResultMessage.Text = "You must complete all fields to enter into Database";
        }
        else
        {
        string resultMessage = InsertArtistIntoDatabase(artistName, biography, imageUrl, heroUrl);
        lblResultMessage.Visible = true;
        // Display the result message on the page
        lblResultMessage.Text = resultMessage;

        }

        // Insert the artist details into the database and get the result message
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
