using DataAccess;
using System;
using System.Data;

public partial class Default : MultitracksPage
{
    private object errorMessage;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int artistID = 107;

            var sql = new SQL();

            try
            {
                sql.Parameters.Add("@artistID", artistID);
                var data = sql.ExecuteStoredProcedureDT("GetArtistDetails");
                artists.DataSource = data;
                artists.DataBind();

                //artistItems.Visible = (data.Rows.Count > 0);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Get the artistID entered by the user in the TextBox
        if (int.TryParse(txtArtistID.Text, out int artistID))
        {
            var sql = new SQL();

            try
            {
                sql.Parameters.Add("@artistID", artistID);
                //MAY HAVE TO MAKE THIS DS AND NOT DT
                var data = sql.ExecuteStoredProcedureDT("GetArtistDetails");

                artists.DataSource = data;
                artists.DataBind();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        else
        {
            //insert error message here for user to see
        }
    }
}
