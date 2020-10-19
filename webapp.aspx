<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="webapp.aspx.cs" Inherits="WebApp.webapp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="style.css">
    <style>
        body, html {
    background: teal;
    margin: 0;
    padding: 0;
}

.header {
    background: white;
    width: 100%;
    height: 50px;
    margin: 0;
    padding: 0;
    display:inline-flex;
}

.container{
    margin: 90px 30px;
}
.dropdown{
    width:300px;
    height:25px;
    border-radius:15px;
}
.label{
    width: 300px;
    height: 25px;
    font-size: large;
    color: white;
}
.button{
    width:100px;
    height:25px;
    border-radius:15px;
    border: none;
    background: Lightgray;
}

h2{
    color:teal;
    text-align: center;
    margin: 10px 500px;
}


    </style>
</head>
<body>
    <div class="header">
        <div>
        <span class="logo"><img src="Standard_Chartered_logo.png" alt="" height= 50px ></span></div>
        <div>
            <h2>File Execution Utility</h2>
            </div>
    </div>
    <div class="container">
    <form id="form1" runat="server">
        <div class="table">
            <table>
                <tr><td>
                    <label class="label">Select the file for execution:</label>
                    </td>
                    <td >
                        <asp:DropDownList  ID="ddlJarFiles" runat="server" class="dropdown"></asp:DropDownList></td>
                    <td>
                        <asp:Button Text="Execute" ID="btnExecute" OnClick="btnExecute_Click" class="button" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>
    <%--<form id="form1" runat="server">

        <div>
            <table align="center" style="width: 100%">
                <tr>
                    <td>
                        <div style="width: 100%;">
                            <div style="float: left; width: 30%;">
                                <img style="width: 150px;" src="https://av.sc.com/corp-en/content/images/SC_Full_colour_preview_logo.jpg" />
                            </div>
                            <div style="float: right; width: 70%;">
                                <h2>Heading</h2>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table align="center">
                            <tr>
                                <td>Jar Files: 
                                    <asp:DropDownList ID="ddlJarFiles" AutoPostBack="false" runat="server"></asp:DropDownList></td>
                                <td>
                                    <asp:Button Text="Execute" ID="btnExecute" OnClick="btnExecute_Click" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>--%>

</body>
</html>
