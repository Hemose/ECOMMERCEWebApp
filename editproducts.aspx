<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editproducts.aspx.cs" Inherits="ECOMMERCEWebApp.editproducts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label8" runat="server" Text="Please enter serial number of the product you want to edit"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="serialnumber"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label9" runat="server" Text="Please enter the new details of the product "></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="new product name"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="new category"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="new product description"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox5" runat="server" Height="18px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="new price"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label7" runat="server" Text="new color"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" Height="34px" OnClick="editproduct" Text="Edit this product" Width="213px" />
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="Back" Width="219px" />
        </p>
    </form>
</body>
</html>
