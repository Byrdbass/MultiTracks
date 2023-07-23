<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="api_artist_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<asp:TextBox ID="txtArtistName" runat="server" placeholder="Artist Name"></asp:TextBox>
<br />
<asp:TextBox ID="txtBiography" runat="server" placeholder="Biography"></asp:TextBox>
<br />
<asp:TextBox ID="txtImageUrl" runat="server" placeholder="Image URL"></asp:TextBox>
<br />
        <asp:TextBox ID="txtHeroUrl" runat="server" placeholder="Hero Image URL"></asp:TextBox>
<br />
        <asp:Label ID="lblResultMessage" runat="server" Visible="false" Text="Please type in an artist name"></asp:Label>
<asp:Button ID="btnAddArtist" runat="server" Text="Add Artist" OnClick="btnAddArtist_Click" />
    </form>
</body>
</html>
