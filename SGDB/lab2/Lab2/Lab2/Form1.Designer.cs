namespace Lab2
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.dgParent = new System.Windows.Forms.DataGridView();
            this.parentLbl = new System.Windows.Forms.Label();
            this.childLbl = new System.Windows.Forms.Label();
            this.dgChild = new System.Windows.Forms.DataGridView();
            this.btnUpdate = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgParent)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgChild)).BeginInit();
            this.SuspendLayout();
            // 
            // dgParent
            // 
            this.dgParent.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgParent.Location = new System.Drawing.Point(49, 25);
            this.dgParent.Name = "dgParent";
            this.dgParent.Size = new System.Drawing.Size(525, 175);
            this.dgParent.TabIndex = 0;
            // 
            // parentLbl
            // 
            this.parentLbl.AutoSize = true;
            this.parentLbl.Location = new System.Drawing.Point(46, 9);
            this.parentLbl.Name = "parentLbl";
            this.parentLbl.Size = new System.Drawing.Size(38, 13);
            this.parentLbl.TabIndex = 1;
            this.parentLbl.Text = "Parent";
            // 
            // childLbl
            // 
            this.childLbl.AutoSize = true;
            this.childLbl.Location = new System.Drawing.Point(46, 203);
            this.childLbl.Name = "childLbl";
            this.childLbl.Size = new System.Drawing.Size(30, 13);
            this.childLbl.TabIndex = 2;
            this.childLbl.Text = "Child";
            // 
            // dgChild
            // 
            this.dgChild.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgChild.Location = new System.Drawing.Point(49, 219);
            this.dgChild.Name = "dgChild";
            this.dgChild.Size = new System.Drawing.Size(525, 152);
            this.dgChild.TabIndex = 3;
            // 
            // btnUpdate
            // 
            this.btnUpdate.Location = new System.Drawing.Point(49, 377);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(75, 23);
            this.btnUpdate.TabIndex = 4;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.dgChild);
            this.Controls.Add(this.childLbl);
            this.Controls.Add(this.parentLbl);
            this.Controls.Add(this.dgParent);
            this.Name = "Form1";
            this.Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)(this.dgParent)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgChild)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgParent;
        private System.Windows.Forms.Label parentLbl;
        private System.Windows.Forms.Label childLbl;
        private System.Windows.Forms.DataGridView dgChild;
        private System.Windows.Forms.Button btnUpdate;
    }
}

