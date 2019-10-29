<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registrace.aspx.cs" Inherits="registrAutor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
  
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    
        <div align="center">
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
                <asp:TextBox ID="TB_email" runat="server" TextMode="Email"></asp:TextBox>
                <asp:Label ID="LB_email" runat="server" ForeColor="Red"></asp:Label>
                <br />
                Potvrzení email<br />
                <asp:TextBox ID="TB_emailConfirm" runat="server" TextMode="Email"></asp:TextBox>
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

</asp:Content>
