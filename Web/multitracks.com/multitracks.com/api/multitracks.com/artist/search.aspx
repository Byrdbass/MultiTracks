<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="api_artist_search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="searchForm" runat="server">
        <input type="text" id="txtSearchArtist" runat="server" placeholder="Enter Artist Name" />
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

        <asp:Label ID="lblMessage" runat="server" Visible="false" Text="Please type in an artist name"></asp:Label>
    <asp:GridView ID="gvArtistDetails" runat="server" AutoGenerateColumns="False">
        <Columns>

            <asp:BoundField DataField="ArtistTitle" HeaderText="Artist Title" />
            <asp:BoundField DataField="Bio" HeaderText="Biography" />

        </Columns>
    </asp:GridView>
    </form>

</body>
</html>
