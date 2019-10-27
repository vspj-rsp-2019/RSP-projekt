<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Emailová adresa<br />
            <asp:TextBox ID="TB_email" runat="server" Width="153px"></asp:TextBox>
            <asp:Label ID="LB_email" runat="server" ForeColor="Red"></asp:Label>
            <br />
            Heslo<br />
            <asp:TextBox ID="TB_heslo" runat="server" TextMode="Password" Width="151px"></asp:TextBox>
            <asp:Label ID="LB_heslo" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Button ID="BT_login" runat="server" OnClick="BT_login_Click" Text="Login" Width="97px" />
        </div>
    </form>
</body>
</html>
