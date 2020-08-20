<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home page vendor.aspx.cs" Inherits="ECOMMERCEWebApp.home_page_vendor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Height="55px" OnClick="Button1_Click" Text="Post product" Width="207px" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Height="55px" OnClick="Button2_Click" Text="Edit Product" Width="207px" />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" Height="55px" OnClick="Button3_Click" Text="Offers" Width="207px" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Logout" Width="207px" />
        </div>
    </form>
</body>
</html>
