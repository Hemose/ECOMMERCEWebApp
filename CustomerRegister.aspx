<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="ECOMMERCEWebApp.CustomerRegister" %>

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
        <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="240px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="firstname"></asp:Label>
        <p>
            <asp:TextBox ID="TextBox2" runat="server"  Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="lastname"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox3" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="password"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox4" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="email"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox5" runat="server" Width="240px"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="register" Height="43px" Text="register" Width="136px" />
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back to Login" Width="142px" />
        </p>
    </form>

</body>
</html>
