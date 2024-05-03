using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace CPLEARNING.FirstTopic
{
    public partial class CRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GetData(empgrid);
            }
        }

        private static void GetData(GridView empgrid)
        {
            string connection_string = @"data source=10.228.50.6\classplus; Initial Catalog=TESTDB;  User ID=sa; Password=ms";

            SqlConnection connection = new SqlConnection(connection_string);

            SqlCommand command = new SqlCommand("spGetData", connection);

            command.CommandType = CommandType.StoredProcedure;

            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            ClearGridView(empgrid);

            empgrid.DataSource = reader;

            empgrid.DataBind();

            connection.Close();
        }

        private static void ClearGridView(GridView empgrid)
        {
            empgrid.DataSource = null;
            empgrid.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string connection_string = @"data source=10.228.50.6\classplus; Initial Catalog=TESTDB;  User ID=sa; Password=ms";

            SqlConnection connection = new SqlConnection(connection_string);

            SqlCommand command = new SqlCommand("spInsert", connection);

            command.CommandType = CommandType.StoredProcedure;

            string fname = txtfname.Text;
            string lname = txtlname.Text;
            int age = Convert.ToInt32(txtage.Text);
            int salary = Convert.ToInt32(txtsalary.Text);

            command.Parameters.AddWithValue("@fname", fname);
            command.Parameters.AddWithValue("@lname", lname);
            command.Parameters.AddWithValue("@age", age);
            command.Parameters.AddWithValue("@salary", salary);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();

            lblmsg.Text = "Record Inserted!....";

            GetData(empgrid);

            txtfname.Text= " ";
            txtlname.Text= " ";
            txtage.Text= " ";
            txtsalary.Text= " ";

        }

        protected void btnclear_Click(object sender, EventArgs e)
        {
            
            lblmsg.Text = "Record Cleared!....";

            txtfname.Text = " ";
            txtlname.Text = " ";
            txtage.Text = " ";
            txtsalary.Text = " ";

        }

        protected void empgrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int id = Convert.ToInt32(empgrid.DataKeys[e.RowIndex].Value);

            string connection_string = @"data source=10.228.50.6\classplus; Initial Catalog=TESTDB;  User ID=sa; Password=ms";

            SqlConnection connection = new SqlConnection(connection_string);

            
            SqlCommand command = new SqlCommand("spDeleteData", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@id", id);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();

            GetData(empgrid);

        }

        protected void empgrid_RowEditing(object sender, GridViewEditEventArgs e)
        {

            empgrid.EditIndex = e.NewEditIndex;

            GetData(empgrid);
        }

        protected void empgrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

            empgrid.EditIndex = -1;

            GetData(empgrid);
        }

        protected void empgrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string connection_string = @"data source=10.228.50.6\classplus; Initial Catalog=TESTDB;  User ID=sa; Password=ms";

            SqlConnection connection = new SqlConnection(connection_string);

            string fname = (empgrid.Rows[e.RowIndex].FindControl("txtfname") as TextBox).Text;
            string lname = (empgrid.Rows[e.RowIndex].FindControl("txtlname") as TextBox).Text;
            int age = Convert.ToInt32((empgrid.Rows[e.RowIndex].FindControl("txtage") as TextBox).Text);
            int salary = Convert.ToInt32((empgrid.Rows[e.RowIndex].FindControl("txtsalary") as TextBox).Text);

            int id = Convert.ToInt32(empgrid.DataKeys[e.RowIndex].Value);

            SqlCommand command = new SqlCommand("spUpdateData", connection);

            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@fname", fname);
            command.Parameters.AddWithValue("@lname", lname);
            command.Parameters.AddWithValue("@age", age);
            command.Parameters.AddWithValue("@salary", salary);
            command.Parameters.AddWithValue("@id", id);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();

            empgrid.EditIndex = -1;

            GetData(empgrid);

        }
    }
}