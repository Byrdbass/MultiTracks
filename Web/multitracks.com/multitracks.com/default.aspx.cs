using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
public partial class Default : MultitracksPage
{
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
    protected HashSet<Album> AlbumsHashSet { get; set; }



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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (int.TryParse(txtArtistID.Text, out int artistID))
        {
            Session["artistID"] = artistID;
            FetchArtistDetails(artistID);
        }
        else
        {
            // Insert error message here for the user to see
        }
    }

    public class Album : IEquatable<Album>
    {
        public string Title { get; set; }
        public string ImageUrl { get; set; }

        public bool Equals(Album other)
        {
            if (other == null) return false;
            return Title == other.Title && ImageUrl == other.ImageUrl;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as Album);
        }

        public override int GetHashCode()
        {
            int hashTitle = Title == null ? 0 : Title.GetHashCode();
            int hashImageUrl = ImageUrl == null ? 0 : ImageUrl.GetHashCode();
            return hashTitle ^ hashImageUrl;
        }
    }

    public class AlbumEqualityComparer : IEqualityComparer<Album>
    {
        public bool Equals(Album x, Album y)
        {
            if (x == null && y == null) return true;
            if (x == null || y == null) return false;
            return x.Equals(y);
        }

        public int GetHashCode(Album obj)
        {
            return obj.GetHashCode();
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

            //using new keyword to clear data before next search
            AlbumIds = new List<int>();
            AlbumTitles = new List<string>();
            AlbumImages = new List<string>();
            AlbumYears = new List<int>();
            AlbumsHashSet = new HashSet<Album>(new AlbumEqualityComparer());

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
                AlbumsHashSet.Add(new Album { Title = albumTitle, ImageUrl = albumImage });

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

        }
    }
}
