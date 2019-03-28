using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace lab1
{
    public partial class Form1 : Form
    {
        SqlDataAdapter daParinte;
        SqlDataAdapter daChild;
        DataSet dset;
        BindingSource bsParinte;
        BindingSource bsCopil;
        SqlCommandBuilder cmdbuilder;

        public Form1()
        {
            InitializeComponent();
            FillData();
        }

        void FillData()
        {
            SqlConnection conn = new SqlConnection(getConnString());
            daParinte = new SqlDataAdapter("select * from customer", conn);
            daChild = new SqlDataAdapter("select * from purchase", conn);
            cmdbuilder = new SqlCommandBuilder(daChild);
            dset = new DataSet();


            daParinte.Fill(dset, "customer");
            daChild.Fill(dset, "purchase");

            DataRelation drel = new DataRelation("fk_customer_purchase",
                dset.Tables["customer"].Columns["cID"],
                dset.Tables["purchase"].Columns["cID"]);

            dset.Relations.Add(drel);

            bsParinte = new BindingSource();
            bsParinte.DataSource = dset;
            bsParinte.DataMember = "customer";

            bsCopil = new BindingSource();
            bsCopil.DataSource = bsParinte;
            bsCopil.DataMember = "fk_customer_purchase";

            this.dgParent.DataSource = bsParinte;
            this.dgChild.DataSource = bsCopil;
            

        }

        private string getConnString()
        {
            return "Data Source =DESKTOP-QLSBE2K\\SQLEXPRESS;" +
                "Initial Catalog = shop;" +
                "Integrated Security = true";
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            daChild.Update(dset, "purchase");
        }
    }
}
