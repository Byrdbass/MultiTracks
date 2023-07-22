using DataAccess;
using System;
using System.Data;

public partial class Default : MultitracksPage
{
    protected string ArtistTitle { get; set; }
    protected string Img { get; set; }
    protected string HeroImg { get; set; }
    protected string Bio { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

        //this will only run during initial page load and not during subsequent requests to server on user click
        if (!IsPostBack)
        {
            FetchArtistDetails(107);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (int.TryParse(txtArtistID.Text, out int artistID))
        {
            FetchArtistDetails(artistID);
        }
        else
        {
            // Insert error message here for the user to see
        }
    }

    private void FetchArtistDetails(int artistID)
    {
        var sql = new SQL();
        sql.Parameters.Add("@artistID", artistID);
        var data = sql.ExecuteStoredProcedureDT("GetArtistDetails");

        if (data.Rows.Count > 0)
        {
            ArtistTitle = data.Rows[0]["ArtistTitle"].ToString();
            Img = data.Rows[0]["Img"].ToString();
            HeroImg = data.Rows[0]["HeroImg"].ToString();
            Bio = data.Rows[0]["Bio"].ToString();


        }
    }
}
