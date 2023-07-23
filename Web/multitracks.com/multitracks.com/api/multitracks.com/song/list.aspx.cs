using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_song_list : System.Web.UI.Page
{
    private const int ItemsPerPage = 5;
    protected string ArtistTitle { get; set; }
    protected string Img { get; set; }
    protected string HeroImg { get; set; }
    protected string Bio { get; set; }
    protected List<int> AlbumIds { get; set; }
    protected List<string> AlbumTitles { get; set; }
    protected List<string> AlbumImages { get; set; }
    protected List<int> AlbumYears { get; set; }
    protected List<int> SongIds { get; set; }
    protected List<DateTime> SongDates { get; set; }
    protected List<string> SongTitles { get; set; }
    protected List<decimal> BPMs { get; set; }
    protected List<string> TimeSignatures { get; set; }
    protected List<bool> Multitracks { get; set; }
    protected List<bool> CustomMixes { get; set; }
    protected List<bool> Charts { get; set; }
    protected List<bool> RehearsalMixes { get; set; }
    protected List<bool> Patches { get; set; }
    protected List<bool> ProPresenters { get; set; }



    protected void Page_Load(object sender, EventArgs e)
    {

        //this will only run during initial page load and not during subsequent requests to server on user click
        if (Session["artistID"] != null && int.TryParse(Session["artistID"].ToString(), out int artistID))
        {
            FetchArtistDetails(artistID);
        }
        else
        {
            FetchArtistDetails(5);
        }
    }
    private int CurrentPageNumber
    {
        get { return Session["CurrentPageNumber"] != null ? Convert.ToInt32(Session["CurrentPageNumber"]) : 1; }
        set { Session["CurrentPageNumber"] = value; }
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (Session["artistID"] != null && int.TryParse(Session["artistID"].ToString(), out int artistID))
        {

            int currentPageNumber = Session["CurrentPageNumber"] != null ? Convert.ToInt32(Session["CurrentPageNumber"]) : 1;
            currentPageNumber++;
            Session["CurrentPageNumber"] = currentPageNumber;

            FetchArtistDetails(artistID);
        }
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        if (Session["artistID"] != null && int.TryParse(Session["artistID"].ToString(), out int artistID))
        {
            int currentPageNumber = Session["CurrentPageNumber"] != null ? Convert.ToInt32(Session["CurrentPageNumber"]) : 1;
            currentPageNumber--;
            if (currentPageNumber < 1)
            {
                currentPageNumber = 1;
            }
            Session["CurrentPageNumber"] = currentPageNumber;

            FetchArtistDetails(artistID);
        }
    }
    private void FetchArtistDetails(int artistID)
    {
        int startIndex = (CurrentPageNumber - 1) * ItemsPerPage;
        int endIndex = startIndex + ItemsPerPage;

        var sql = new SQL();
        sql.Parameters.Add("@artistID", artistID);
        var data = sql.ExecuteStoredProcedureDT("GetArtistDetails");

        if (data.Rows.Count > 0)
        {
            ArtistTitle = data.Rows[0]["ArtistTitle"].ToString();
            Img = data.Rows[0]["Img"].ToString();
            HeroImg = data.Rows[0]["HeroImg"].ToString();
            Bio = data.Rows[0]["Bio"].ToString();

            //using new keyword to clear data before next search
            AlbumIds = new List<int>();
            AlbumTitles = new List<string>();
            AlbumImages = new List<string>();
            AlbumYears = new List<int>();

            SongIds = new List<int>();
            SongDates = new List<DateTime>();
            SongTitles = new List<string>();
            BPMs = new List<decimal>();
            TimeSignatures = new List<string>();
            Multitracks = new List<bool>();
            CustomMixes = new List<bool>();
            Charts = new List<bool>();
            RehearsalMixes = new List<bool>();
            Patches = new List<bool>();
            ProPresenters = new List<bool>();

            foreach (DataRow row in data.Rows)
            {
                int albumId = Convert.ToInt32(row["AlbumId"]);
                string albumTitle = row["AlbumTitle"].ToString();
                string albumImage = row["AlbumImage"].ToString();
                int year = Convert.ToInt32(row["AlbumYear"]);

                int songId = Convert.ToInt32(row["SongId"]);
                DateTime dateCreation = Convert.ToDateTime(row["SongDate"]);
                string songTitle = row["SongTitle"].ToString();
                decimal bpm = Convert.ToDecimal(row["BPM"]);
                string timeSignature = row["TS"].ToString();
                bool multitrack = Convert.ToBoolean(row["MT"]);
                bool customMix = Convert.ToBoolean(row["Mix"]);
                bool chart = Convert.ToBoolean(row["Chart"]);
                bool rehearsalMix = Convert.ToBoolean(row["RM"]);
                bool patch = Convert.ToBoolean(row["patches"]);
                bool proPresenter = Convert.ToBoolean(row["Pro"]);


                AlbumIds.Add(albumId);
                AlbumTitles.Add(albumTitle);
                AlbumImages.Add(albumImage);
                AlbumYears.Add(year);

                SongIds.Add(songId);
                SongDates.Add(dateCreation);
                SongTitles.Add(songTitle);
                BPMs.Add(bpm);
                TimeSignatures.Add(timeSignature);
                Multitracks.Add(multitrack);
                CustomMixes.Add(customMix);
                Charts.Add(chart);
                RehearsalMixes.Add(rehearsalMix);
                Patches.Add(patch);
                ProPresenters.Add(proPresenter);


            }
                //pagination fuctionality
                AlbumIds = AlbumIds.Skip(startIndex).Take(ItemsPerPage).ToList();
                AlbumTitles = AlbumTitles.Skip(startIndex).Take(ItemsPerPage).ToList();
                AlbumImages = AlbumImages.Skip(startIndex).Take(ItemsPerPage).ToList();
                AlbumYears = AlbumYears.Skip(startIndex).Take(ItemsPerPage).ToList();

                SongIds = SongIds.Skip(startIndex).Take(ItemsPerPage).ToList();
                SongDates = SongDates.Skip(startIndex).Take(ItemsPerPage).ToList();
                SongTitles = SongTitles.Skip(startIndex).Take(ItemsPerPage).ToList();
                BPMs = BPMs.Skip(startIndex).Take(ItemsPerPage).ToList();
                TimeSignatures = TimeSignatures.Skip(startIndex).Take(ItemsPerPage).ToList();
                Multitracks = Multitracks.Skip(startIndex).Take(ItemsPerPage).ToList();
                CustomMixes = CustomMixes.Skip(startIndex).Take(ItemsPerPage).ToList();
                Charts = Charts.Skip(startIndex).Take(ItemsPerPage).ToList();
                RehearsalMixes = RehearsalMixes.Skip(startIndex).Take(ItemsPerPage).ToList();
                Patches = Patches.Skip(startIndex).Take(ItemsPerPage).ToList();
                ProPresenters = ProPresenters.Skip(startIndex).Take(ItemsPerPage).ToList();

        }
    }
}
