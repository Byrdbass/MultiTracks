<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="api_artist_search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

    <!-- set the encoding of your site -->
    <meta charset="utf-8">
    <title>MultiTracks.com</title>
    <!-- include the site stylesheet -->
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-32x32.png" type="image/png">
    <link rel="icon" href="https://mtracks.azureedge.net/public/images/icon/favicon/favicon-svg2.svg" type="image/svg+xml">
    <link media="all" rel="stylesheet" href="https://mtracks.azureedge.net/public/css/v22/main.min.css?v=4">
    <link media="all" rel="stylesheet" href="../../../css/index.css">
</head>
<body>
    <div class="mobile-panel mod-left js-mobile-left js-mobile-panel">
        <a href="#" class="mobile-panel--close js-click-hide-products"></a>
    </div>
    <div class="mobile-panel mod-right js-mobile-right js-mobile-panel">
        <a href="#" class="mobile-panel--close js-click-hide-account"></a>
        <nav id="mobile-menu-account" class="mobile-menu">
            <nav class="mobile-menu--breadcrumbs js-menu-breadcrumbs"><a>All</a></nav>
            <button class="mobile-menu--back is-hidden js-menu-back" aria-label="Go back"></button>
            <button class="mobile-panel--close-btn js-click-hide-account" aria-label="Close Menu">
                <svg class="mobile-panel--close-btn--icon">
                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#X-Close-thick"></use>
                </svg>
            </button>
            <div class="mobile-menu--wrap">
                <ul data-menu="main" data-menu-id="0" class="mobile-menu--level js-menu-level is-current">
                    <li id="header_registerLinkMobile" class="mobile-menu--item js-menu-item"><a class="mobile-menu--link js-menu-link" href="/register/">Sign Up</a></li>
                    <li id="header_loginItemMobile" class="mobile-menu--item js-menu-item"><a href="/login/" id="header_loginLinkMobile" class="mobile-menu--link js-menu-link">Log In </a></li>
                    <li class="mobile-menu--item js-menu-item"><a href="/cart/" id="header_mobileCartButton" class="mobile-menu--link js-menu-link js-cart-count">Cart</a></li>
                    <li class="mobile-menu--item js-menu-item"><a href="https://intercom.help/multitracks/en/" id="header_supportLinkMobile" class="mobile-menu--link js-menu-link">Help Center</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <header class="header mod-interior remodal-bg">
        <div class="header--holder">
            <div class="header--mobile js-media-search-mobile-container">
                <a class="header--mobile--logo" href="/resources">
                    <img src="//mtracks.azureedge.net/public/images/site/logo/en/logo-mono.svg" id="header_logo" class="header--mobile--logo--img mod-full" alt="MultiTracks.com">
                    <svg class="header--mobile--logo--img mod-mark">
                        <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#mt-death-star"></use>
                    </svg>
                </a>
                <div class="header--mobile--right">
                    <div class="header--mobile--search search">
                        <input accesskey="4" type="text" placeholder="Search" class="search--input input mod-search js-media-search-mobile" name="" value="">
                        <a href="#" class="search--submit js-media-search-mobile-btn">
                            <svg class="search--submit--icon">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#Search-Input"></use>
                            </svg>
                        </a>
                    </div>
                    <a href="#" class="header--mobile--search--close btn-text js-media-search-mobile-close">Cancel</a>
                </div>
            </div>
            <div class="header--left">
                <a class="header--left--logo" href="/resources">
                    <img src="//mtracks.azureedge.net/public/images/site/logo/en/logo-mono.svg" id="header_logoFull" class="header--left--logo--img mod-full" alt="MultiTracks.com"></a>
                <div class="header--mobile mod-right">
                    <a class="header--mobile--link js-click-show-account" href="#">
                        <svg class="header--mobile--link--icon">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="/images/sprite.symbol.svg#account"></use>
                        </svg>
                    </a>
                </div>
            </div>
            <div class="header--right"></div>
        </div>
    </header>
    <form id="searchForm" runat="server">
        <asp:Panel ID="headphonesPanel" Visible="true" runat="server">

            <div class="wrapper mod-standard remodal-bg">
                <div class="text-hero mod-headphones ly-delta">
                    <h1 class="text-hero--title">Search For an Artist</h1>
                </div>
        </asp:Panel>


        <asp:Panel ID="artistImages" Visible="false" runat="server">

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
        </asp:Panel>

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
            </ul>
            <!-- /.browse-header-filters -->
        </nav>
        <div class="row" style="display:flex ; justify-content:center ; align-items:center; margin-top: 20px">
            <input type="text" id="txtSearchArtist" runat="server" placeholder="Enter Artist Name" 
                 style=" width: 15vw"
                />
            <asp:Button ID="btnSearch" runat="server" Text="Search By Name" OnClick="btnSearch_Click" 
                style="border-radius: 9px ; color:#43b1e6" CssClass="tab-filter"
                />
        </div>
        <div style="display:flex ; justify-content:center ; align-items:center; margin-top: 20px">

            <asp:Label ID="lblMessage" runat="server" Visible="false"
                style="text-align:center"
                ></asp:Label>
        </div>
        <asp:Panel ID="bioPanel" runat="server" Visible="false">

            <section class="standard--holder">
                <div class="discovery--section--header">
                    <h2>Biography</h2>
                </div>
                <div class="artist-details--biography biography">
                    <p><%= Bio %> </p>
                </div>
            </section>
        </asp:Panel>

    </form>

</body>
</html>
