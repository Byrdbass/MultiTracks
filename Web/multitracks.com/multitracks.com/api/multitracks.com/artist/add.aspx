<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add.aspx.cs" Inherits="api_artist_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MultiTracks
    </title>
    <meta charset="utf-8">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-32x32.png" type="image/png">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-svg2.svg" type="image/svg+xml">
    <meta name="theme-color" content="#ffffff">
    <link media="all" rel="stylesheet" href="https://mtracks.azureedge.net/public/css/v22/main.min.css?v=4">
    <link rel="stylesheet" href="../../../css/index.css">
    <style type="text/css">
        .is-slide-hidden {
            position: absolute;
            left: -9999px;
            top: -9999px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="wrapper mod-standard remodal-bg">
        <div class="text-hero mod-headphones ly-delta">
            <h1 class="text-hero--title">Add an artist!</h1>
        </div>
        <nav class="discovery--nav">
            <ul class="discovery--nav--list tab-filter--list u-no-scrollbar">
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../../../default.aspx">Overview</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../../../artists/songs/details.aspx">Songs</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../../../artists/albums/details.aspx">Albums</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../../../api/multitracks.com/artist/search.aspx">Search Artist</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../song/list.aspx">Songs By Page</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item is-active">
                    <a class="tab-filter" href="/">Add an Artist</a>
                </li>
            </ul>
            <!-- /.browse-header-filters -->
        </nav>
        <div style="display: flex; justify-content: center; align-items: center; margin-top: 20px">
            <form id="form1" runat="server" class="row">
                <div style="display:flex ; justify-content: center ; align-items: center">

                <asp:Label ID="lblResultMessage" runat="server" Visible="false"
                    Style="margin-bottom: 20px "></asp:Label>
                </div>

                <asp:TextBox ID="txtArtistName" runat="server" placeholder="Artist Name" CssClass="form-row--input"
                    Style="margin: auto; width: 15vw; margin-bottom: 20px"></asp:TextBox>
                <asp:TextBox ID="txtBiography" runat="server" placeholder="Biography" CssClass="form-row--input"
                    Style="margin: auto; height: 15vh; margin-bottom: 20px"></asp:TextBox>
                <asp:TextBox ID="txtImageUrl" runat="server" placeholder="Image URL" CssClass="form-row--input"
                    Style="margin: auto; margin-bottom: 20px"></asp:TextBox>
                <asp:TextBox ID="txtHeroUrl" runat="server" placeholder="Hero Image URL" CssClass="form-row--input"
                    Style="margin: auto; margin-bottom: 20px"></asp:TextBox>

                <asp:Button ID="btnAddArtist" runat="server" Text="Add Artist" OnClick="btnAddArtist_Click"
                    Style="margin: auto; border-radius: 9px; color: #43b1e6" CssClass="tab-filter" />
                <div>
                </div>
            </form>
        </div>
</body>
</html>
