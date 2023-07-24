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
    <div class="wrapper mod-standard remodal-bg">
        <div class="text-hero mod-headphones ly-delta">
            <h1 class="text-hero--title">Add an artist!</h1>
        </div>
        <div style="display:flex ; justify-content:center; align-items:center ; margin-top: 20px" >
        <form id="form1" runat="server" class="row">
            <asp:TextBox ID="txtArtistName" runat="server" placeholder="Artist Name" CssClass="form-row--input"
                style="margin:auto ; width: 15vw ; margin-bottom: 20px"
                ></asp:TextBox>
            <asp:TextBox ID="txtBiography" runat="server" placeholder="Biography" CssClass="form-row--input"
                style="margin:auto ; height: 15vh ; margin-bottom: 20px"
                ></asp:TextBox>
            <asp:TextBox ID="txtImageUrl" runat="server" placeholder="Image URL" CssClass="form-row--input"
                style="margin:auto ; margin-bottom: 20px"
                ></asp:TextBox>
            <asp:TextBox ID="txtHeroUrl" runat="server" placeholder="Hero Image URL" CssClass="form-row--input"
                style="margin:auto ; margin-bottom: 20px"
                ></asp:TextBox>
            <asp:Label ID="lblResultMessage" runat="server" Visible="false" Text="Please type in an artist name"
                style="margin:auto ; margin-bottom: 20px"
                ></asp:Label>
            <asp:Button ID="btnAddArtist" runat="server" Text="Add Artist" OnClick="btnAddArtist_Click" 
                style="margin:auto ; border-radius: 9px ; color:#43b1e6" CssClass="tab-filter"
                />
        </form>
        </div>
</body>
</html>
