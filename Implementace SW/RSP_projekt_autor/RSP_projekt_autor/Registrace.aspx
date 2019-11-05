<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registrace.aspx.cs" Inherits="registrAutor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

 <style type="text/css">
        .auto-style2 {
            width: 169px;
        }
        .auto-style4 {
            width: 40px;
        }
        .auto-style5 {
            width: 228px;
        }
        .auto-style6 {
            width: 67%;
            height: 216px;
        }
    </style>
  </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    
        <div align="center">
            <div>
                &nbsp;<br />
               
              <table class="auto-style6">
                    <tr>
                        <td align="right" class="auto-style5">Jméno:</td>
                        <td class="auto-style4"><asp:TextBox ID="TB_jmeno" runat="server"></asp:TextBox>
                </td>
                        <td class="auto-style2">
                            <asp:Label ID="LB_jmeno" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style5">Příjmení:</td>
                        <td class="auto-style4"><asp:TextBox ID="TB_prijmeni" runat="server"></asp:TextBox>
                                            
                        <td class="auto-style2">
                            <asp:Label ID="LB_prijmeni" runat="server" ForeColor="Red"></asp:Label>
                
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="auto-style5">E-mail:</td>
                        <td class="auto-style4"><asp:TextBox ID="TB_email" runat="server" TextMode="Email"></asp:TextBox>
                        </td>
                        <td class="auto-style2">
                <asp:Label ID="LB_email" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                      <tr>
                        <td align="right" class="auto-style5">Potvrzení e-mailu:</td>
                        <td class="auto-style4"><asp:TextBox ID="TB_emailConfirm" runat="server" TextMode="Email"></asp:TextBox>
                          </td>
                        <td class="auto-style2">
                <asp:Label ID="LB_emailConfirm" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                      <tr>
                        <td align="right" class="auto-style5">Heslo:</td>
                        <td class="auto-style4"><asp:TextBox ID="TB_heslo" runat="server" TextMode="Password"></asp:TextBox>
                          </td>
                        <td class="auto-style2">
                <asp:Label ID="LB_heslo" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                      <tr>
                        <td align="right" class="auto-style5">Potvrzení hesla:</td>
                        <td class="auto-style4"><asp:TextBox ID="TB_hesloConfirm" runat="server" TextMode="Password"></asp:TextBox>
                          </td>
                        <td class="auto-style2">
                <asp:Label ID="LB_hesloConfirm" runat="server" ForeColor="Red"></asp:Label></td>
                    </tr>
                      <tr>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style4"><asp:Button ID="Button1" runat="server" OnClick="BTN_registrace_Click" Text="Potvrdit registraci" />
                            &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" OnClick="BTN_cancel_Click" Text="Zrušit" />
                        </td>
                        <td class="auto-style2"></td>
                    </tr>
                </table>
                <br />
            </div>
        </div>
</asp:Content>
