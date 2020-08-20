<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="ECOMMERCEWebApp.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Payment Mathods :<br />
        </div>
        <p>
            Cash amount &nbsp; :&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="137px"></asp:TextBox>
        </p>
        <p>
            &nbsp;</p>
        <p>
            Credit amount :&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" Height="31px" Width="137px"></asp:TextBox>
        </p>
        <p>
            Credit card&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Height="31px" Width="137px" ></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Order No  :"></asp:Label>
&nbsp;
            <asp:Label ID="Label2" runat="server" Text="order_id"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="64px" OnClick="specify_amount" Text="Pay" Width="190px" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button2" runat="server" Height="29px"  Text="Back" Width="274px" OnClick="Button2_Click" />
        </p>
    </form>
</body>

</html>
