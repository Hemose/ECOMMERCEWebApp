<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="ECOMMERCEWebApp.order" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Home.aspx");
    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Order ID :&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
&nbsp;Tootal amount :&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <p>
            &nbsp;</p>
        <p>
            <asp:button id="Button1" runat="server" height="105px" onclick="makeorder" text="make order" width="253px" />
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Height="51px" OnClick="Button2_Click" Text="Back" Width="215px" />
        </p>
    </form>
</body>
</html>
