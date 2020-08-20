<div style="margin-left: 640px">
    <asp:Label ID="A" runat="server" Font-Size="Large" ForeColor="#000066" Text="Available Products"></asp:Label>
</div>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="ECOMMERCEWebApp.products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView runat="server" ID="GridView1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1413px">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <br />
        <br />
        <br />
        Product Serial Number<br />
        <asp:TextBox ID="TextBox1" runat="server" Width="183px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Height="33px" OnClick="Button1_Click" Text="Add to my cart" Width="146px" />
&nbsp;
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Product Serial Number"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="WishList Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Width="183px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" Width="183px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Height="33px" OnClick="Button2_Click" Text="Add to my WishList" Width="160px" />
&nbsp;
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Product Serial Number"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="WishList Name"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox4" runat="server" Width="183px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" Width="183px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Rrmove from my WishList" Width="225px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Back" Width="192px" />
        <br />
    </form>
</body>
</html>

