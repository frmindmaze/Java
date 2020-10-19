using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using System.Windows;

namespace WebApp
{
    public partial class webapp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> lst = new List<string>();
                lst = Directory.GetFiles(Server.MapPath("~/JarFiles"), "*.jar", SearchOption.AllDirectories).Select(fileName => Path.GetFileNameWithoutExtension(fileName)).Distinct().ToList();
                ddlJarFiles.DataSource = lst;
                ddlJarFiles.DataBind(); 
            }
        }

        protected void btnExecute_Click(object sender, EventArgs e)
        {
            try
            {

                string path = Server.MapPath("~/JarFiles");
                String command = string.Format(path + @"\");
                Process process = new Process();
                process.StartInfo.WorkingDirectory = command;
                process.StartInfo.FileName = "java";
                process.StartInfo.Arguments = "-jar "+ddlJarFiles.SelectedValue+".jar";
                process.Start();
                process.Close();

                //For bat file execution
                //String command = string.Format(path+@"\");
                //Process process = new Process();
                //process.StartInfo.WorkingDirectory = command;
                //process.StartInfo.FileName = "test.bat";
                //process.StartInfo.CreateNoWindow = false;
                //process.Start();
                //process.WaitForExit();
                //process.Close();
                //MessageBox.Show("Bat file executed...");
                

                //For exe file execution
                //Process process = Process.Start(path+"/test.bat");
                //int id = process.Id;
                //Process tempProc = Process.GetProcessById(id);
                //this.Visible = false;
                //tempProc.WaitForExit();
                //this.Visible = true;
            }
            catch (Exception ex)
            {

                Console.WriteLine("Exception Occurred :{0},{1}", ex.Message, ex.StackTrace.ToString());
            }
        }
    }
}