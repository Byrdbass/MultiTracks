using DataAccess;
using System;

public partial class Default : MultitracksPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var sql = new SQL();

        try
        {
            //sql.Parameters.Add("@stepID", 1);
            var data = sql.ExecuteStoredProcedureDT("GetAssessmentSteps");


        }
        catch
        {

        }
    }
}