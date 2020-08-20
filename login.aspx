<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ECOMMERCEWebApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
        </div>

        <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label>
    
        <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
    
        <br />
    
        <br />
        <asp:Button ID="btn_login" runat="server" Text="Login" onclick="loginn" Width="90px"/>
        <p>
            <asp:Button ID="butC" runat="server" OnClick="Button1_Click" Text="register As a Customer" Width="195px" />
            <asp:Button ID="butV" runat="server" OnClick="Button2_Click" style="margin-left: 99px" Text="register As a Vendor" Width="239px" />
        </p>

        </form>
</body>
</html>
