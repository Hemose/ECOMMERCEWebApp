<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VendorRegister.aspx.cs" Inherits="ECOMMERCEWebApp.VendorRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="username"></asp:Label>
            <br />
        </div>
        <asp:TextBox ID="TextBoxv1" runat="server" Height="23px" Width="240px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="firstname"></asp:Label>
        <p>
            <asp:TextBox ID="TextBoxv2" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="lastname"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBoxv3" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBoxv4" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="email"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBoxv5" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label6" runat="server" Text="company name"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBoxv6" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="bank account number"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBoxv7" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="regvv" runat="server" OnClick="register" Height="84px" Text="register" Width="209px" />
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Back to Login" Width="206px" />
        </p>
    </form>
</body>
</html>
