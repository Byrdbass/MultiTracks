﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="Details" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- set the viewport width and initial-scale on mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

	<!-- set the encoding of your site -->
	<meta charset="utf-8">
	<title>MultiTracks.com</title>
	<!-- include the site stylesheet -->
	<link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-32x32.png" type="image/png">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-svg2.svg" type="image/svg+xml">
	<link media="all" rel="stylesheet" href="../../css/index.css">

    <link href="./css/showAllSongs.css" rel="stylesheet" />
    <script defer src="showAllSongs.js"></script>
</head>
	<body class="premium standard u-fix-fancybox-iframe">
		<form runat="server" id="artistItems">
					<noscript>
						<div>Javascript must be enabled for the correct page display</div>
					</noscript>

			<!-- allow a user to go to the main content of the page -->
			<a class="accessibility" href="#main" tabindex="21">Skip to Content</a>

			<div class="wrapper mod-standard mod-gray">
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
				        <div style="display:flex ; justify-content:center ; align-items:center; margin-top: 20px">
				                <asp:Label ID="ErrorLabel" runat="server" Visible="false"
                    style="font-style: italic; font-weight: 900 ; text-align:center"></asp:Label>
							</div>
				<nav class="discovery--nav">
					<ul class="discovery--nav--list tab-filter--list u-no-scrollbar">
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../../default.aspx">Overview</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../songs/details.aspx">Songs</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item is-active">
							<a class="tab-filter" href="/">Albums</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../../api/multitracks.com/artist/search.aspx">Search Artist</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../../api/multitracks.com/song/list.aspx">Songs By Page</a>
						</li>
						<li class="discovery--nav--list--item tab-filter--item">
							<a class="tab-filter" href="../../api/multitracks.com/artist/add.aspx">Add an Artist</a>
					</ul> <!-- /.browse-header-filters -->
				</nav>
				<div class="row" style="display:flex ; justify-content:center ; align-items:center; margin-top: 20px">
                            
					<asp:TextBox runat="server" ID="txtArtistID" placeholder="Enter Artist ID"
						style=" width: 15vw"
						></asp:TextBox>
	<asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" 
		style="border-radius: 9px ; color:#43b1e6" CssClass="tab-filter"
		/>
				</div>
				<div class="discovery--container u-container">
							<main class="discovery--section">

								<section class="standard--holder">
                                    <!-- /.discovery-select -->

                                    <ul id="playlist" class="song-list mod-new mod-menu">
                                     

								<div class="discovery--space-saver">
									<section class="standard--holder">
										<div class="discovery--section--header">
											<h2>Albums</h2>
										</div><!-- /.discovery-select -->

										<div class="discovery--grid-holder">

											<div class="ly-grid ly-grid-cranberries">


                                                <% foreach (var album in AlbumsHashSet)
                                                    {
                                                %>
                                                <div class="media-item">
                                                    <a class="media-item--img--link" href="#" tabindex="0">
                                                        <img class="media-item--img" alt="<%= album.Title %>" src="<%= album.ImageUrl %>">
                                                        <span class="image-tag">Master</span>
                                                    </a>
                                                    <a class="media-item--title" href="#" tabindex="0"><%= album.Title %></a>
                                                </div>
                                                <% } %>
											</div><!-- /.grid -->
										</div><!-- /.discovery-grid-holder -->
									</section><!-- /.songs-section -->
								</div>
							</main><!-- /.discovery-section -->
				</div><!-- /.standard-container -->
			</div><!-- /.wrapper -->


			

			<a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
		</form>
	</body>
</html>

