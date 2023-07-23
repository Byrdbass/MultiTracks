using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

public partial class api_artist_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["artistName"]))
        {
            string artistName = Request.QueryString["artistName"];
            // Call the stored procedure and bind the data to the GridView control
            BindArtistDetails(artistName);
        }
        else
        {
            // Show the message label since there's no artist name provided
            lblMessage.Visible = true;
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        // Get the artist name from the input field
        string artistName = txtSearchArtist.Value.Trim();

        // Call the stored procedure and bind the data to the GridView control
        BindArtistDetails(artistName);
    }
    private void BindArtistDetails(string artistName)
    {
        var sql = new SQL();
        sql.Parameters.Add("@artistName", "%" + artistName + "%");
        var data = sql.ExecuteStoredProcedureDT("GetArtistDetailsByName");

            // Bind the DataTable to the GridView control to display the results
            gvArtistDetails.DataSource = data;
            gvArtistDetails.DataBind();
        
    }
}