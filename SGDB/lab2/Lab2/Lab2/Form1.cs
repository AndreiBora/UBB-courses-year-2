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
using System.Configuration;

namespace Lab2
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
            //Create connection
            ConnectionStringSettings conSet = ConfigurationManager.ConnectionStrings["conStr"];
            string conString = conSet.ConnectionString;
            SqlConnection conn = new SqlConnection(conString);

            string parentSelectCmd = ConfigurationManager.AppSettings["ParentSelectCmd"];
            string childSelectCmd = ConfigurationManager.AppSettings["ChildSelectCmd"];
            daParinte = new SqlDataAdapter(parentSelectCmd, conn);
            daChild = new SqlDataAdapter(childSelectCmd, conn);
            cmdbuilder = new SqlCommandBuilder(daChild);
            dset = new DataSet();


            daParinte.Fill(dset, "parentTable");
            daChild.Fill(dset, "childTable");

            string parentId = ConfigurationManager.AppSettings["parentId"];

            DataRelation drel = new DataRelation("Parent_Child_FK",
                dset.Tables["parentTable"].Columns[parentId],
                dset.Tables["childTable"].Columns[parentId]);

            dset.Relations.Add(drel);

            bsParinte = new BindingSource();
            bsParinte.DataSource = dset;
            bsParinte.DataMember = "parentTable";

            bsCopil = new BindingSource();
            bsCopil.DataSource = bsParinte;
            bsCopil.DataMember = "Parent_Child_FK";

            this.dgParent.DataSource = bsParinte;
            this.dgChild.DataSource = bsCopil;


        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            daChild.Update(dset, "childTable");
        }
    }
}
