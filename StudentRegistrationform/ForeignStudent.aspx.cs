using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace StudentRegistrationform
{

    public partial class ForeignStudent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-R54CT7O;initial catalog=ForeignStudent;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // code
                BindCountry();
                BindGenderRadioList();
                MarriageStatus();


                ShowDataInGridView();
            }

        }


        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(stdname.Text) ||
       string.IsNullOrWhiteSpace(fathername.Text) ||
       stdgender.SelectedIndex == 0 ||
       maritalstatus.SelectedIndex == 0 ||
       nationality.SelectedIndex == 0 ||
       stdstate.SelectedIndex == 0 ||
       stdcity.SelectedIndex == 0 ||
       string.IsNullOrWhiteSpace(passportnumber.Text))
            {
                // Show some message
                lblMessage.Text = "All fields are required!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            lblMessage.Text = "";

            con.Open();
            string querystring = @"insert into StudentInfo(studentname,fathename,stdgender
,stdmaritalstatus,stdcountryname,stdstatename,stdcity,stdpass) values('" + stdname.Text + "','"
+ fathername.Text + "','" + stdgender.SelectedValue + "','" + maritalstatus.SelectedValue + "'," +
"'" + nationality.SelectedValue + "','" + stdstate.SelectedValue + "','" + stdcity.SelectedValue + "','" + passportnumber.Text + "')";

            SqlCommand command = new SqlCommand(querystring, con);
            command.ExecuteNonQuery();
            con.Close();
            ClearFields();
            ShowDataInGridView();
            BindCountry();
        }

        public void BindGenderRadioList()
        {
            con.Open();
            SqlCommand sqlCommand = new SqlCommand("select * from tblgender", con);
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            stdgender.DataValueField = "genderid";
            stdgender.DataTextField = "gendername";
            stdgender.DataSource = dt;
            stdgender.DataBind();


        }

        public void MarriageStatus()
        {
            con.Open();
            SqlCommand sqlCommand = new SqlCommand("select * from tblMaritalstatus", con);
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            maritalstatus.DataValueField = "maritialid";
            maritalstatus.DataTextField = "maristatus";
            maritalstatus.DataSource = dt;
            maritalstatus.DataBind();
        }

        public void ClearFields()
        {
            stdname.Text = "";
            fathername.Text = "";
            passportnumber.Text = "";
            stdgender.ClearSelection();
            maritalstatus.ClearSelection();
            nationality.Items.Clear();

            stdstate.Items.Clear();
            stdcity.Items.Clear();
        }

        public void BindCountry()
        {
            con.Open();
            SqlCommand sqlCommand = new SqlCommand("select * from tblNationlity", con);
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            nationality.DataValueField = "countryid";
            nationality.DataTextField = "countryname";
            nationality.DataSource = dt;
            nationality.DataBind();
            nationality.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        public void ShowDataInGridView()
        {
            string joinDataShowToGrid = @"SELECT *
FROM StudentInfo
JOIN tblgender ON stdgender= genderid
JOIN tblMaritalstatus ON stdmaritalstatus =maritialid
JOIN tblNationlity n ON stdcountryname = n.countryid
JOIN tblState st ON stdstatename = st.stateid
JOIN tblCity c ON stdcity = c.cityid;";
            con.Open();
            SqlCommand cmd = new SqlCommand(joinDataShowToGrid, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            gvdata.DataSource = dt;
            gvdata.DataBind();
            con.Close();
        }
        protected void nationality_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sqlCommand = new SqlCommand("select * from tblState where countryid='" + nationality.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            stdstate.DataValueField = "stateid";
            stdstate.DataTextField = "statename";
            stdstate.DataSource = dt;
            stdstate.DataBind();
            stdstate.Items.Insert(0, new ListItem("--Select--", "0"));
        }

        protected void stdstate_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand sqlCommand = new SqlCommand("select * from tblcity where stateid='" + stdstate.SelectedValue + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(sqlCommand);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            stdcity.DataValueField = "cityid";
            stdcity.DataTextField = "cityname";
            stdcity.DataSource = dt;
            stdcity.DataBind();
            stdcity.Items.Insert(0, new ListItem("--Select--", "0"));
        }
        protected void gvdata_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}