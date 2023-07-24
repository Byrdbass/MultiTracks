<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="api_artist_search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

	<!-- set the encoding of your site -->
	<meta charset="utf-8">
	<title>MultiTracks.com</title>
	<!-- include the site stylesheet -->
	
	<link media="all" rel="stylesheet" href="../../../css/index.css">
</head>
<body>
    <form id="searchForm" runat="server">
        <input type="text" id="txtSearchArtist" runat="server" placeholder="Enter Artist Name" />
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />

        <asp:Label ID="lblMessage" runat="server" Visible="true" Text="Type in an artists name"></asp:Label>

        <div class="details-banner">
            <div class="details-banner--overlay"></div>
            <div class="details-banner--hero">
                <img class="details-banner--hero--img" src="<%= HeroImg %>" alt="<%= ArtistTitle %>" />
                <!-- SHOULD I PUT THE SRCSET PROPERTY BACK?-->
            </div>
            <div class="details-banner--info">
                <a href="#" class="details-banner--info--box">
                    <img class="details-banner--info--box--img"
                        src="<%= Img %>" alt="<%= ArtistTitle%>" />
                    <!-- SHOULD I PUT THE SRCSET PROPERTY BACK?-->
                </a>
                <h1 class="details-banner--info--name">
                    <a class="details-banner--info--name--link" href="#">
                        <%= ArtistTitle%>
                    </a>
                </h1>
            </div>
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
                <li class="discovery--nav--list--item tab-filter--item  is-active">
                    <a class="tab-filter" href="/">Search Artist</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../song/list.aspx">Songs By Page</a>
                </li>
                <li class="discovery--nav--list--item tab-filter--item">
                    <a class="tab-filter" href="../artist/add.aspx">Add an Artist</a>
                </li>
            </ul> <!-- /.browse-header-filters -->
        </nav>
        <section class="standard--holder">
            <div class="discovery--section--header">
                <h2>Biography</h2>
            </div>
            <!-- /.discovery-section-header -->

            <div class="artist-details--biography biography">
                <p><%= Bio %> </p>
                <!-- FIGURE OUT HOW TO REDUCE TEXT BY CERTAIN AMOUNT OF LINES -->
                <a href="#">Read More...</a>

            </div>
        </section>
        <!-- /.biography-section -->
    </form>

</body>
</html>
