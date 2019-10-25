<%@ Page Language="C#" AutoEventWireup="true" CodeFile="registrAutor.aspx.cs" Inherits="registrAutor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registrace</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                &nbsp;<br />
                Jméno:&nbsp;&nbsp;
                <br />
                <asp:TextBox ID="TB_jmeno" runat="server"></asp:TextBox>
                <asp:Label ID="LB_jmeno" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Příjmení<br />
                <asp:TextBox ID="TB_prijmeni" runat="server"></asp:TextBox>
                <asp:Label ID="LB_prijmeni" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Email<br />
                <asp:TextBox ID="TB_email" runat="server"></asp:TextBox>
                <asp:Label ID="LB_email" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Potvrzení email<br />
                <asp:TextBox ID="TB_emailConfirm" runat="server"></asp:TextBox>
                <asp:Label ID="LB_emailConfirm" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Heslo<br />
                <asp:TextBox ID="TB_heslo" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="LB_heslo" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Znovu heslo<br />
                <asp:TextBox ID="TB_hesloConfirm" runat="server" TextMode="Password"></asp:TextBox>
                <asp:Label ID="LB_hesloConfirm" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="BTN_registrace" runat="server" OnClick="BTN_registrace_Click" Text="Potvrdit registraci" />
&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BTN_cancel" runat="server" OnClick="BTN_cancel_Click" Text="Zrušit" />
            </div>
        </div>
    </form>
</body>
</html>
