# Multitracks DotNetCore & DotNet5 Project

## Description
This project A take home test for a great potential job by Import into Visual Studio and install dependencies with 

      Update-Package Microsoft.CodeDom.Providers.DotNetCompilerPlatform -r

My motivation for this project was to to share a love of music in the worship space.
I was to create an API to showcase different artists, albums, and songs.  
I learned many things about this project, including some of the snippets below.  It was first time creating a fullstack DotNet application!

# Table of Contents
- [Installation](#Installation)
- [Description](#Description)
- [Usage](#Usage)
- [What-I-learned](#What-I-Learned)
- [Screenshot-of-Application](#Screenshot-of-Application)
- [Links](#Links)
- [Questions?](#Questions?)

## Installation
In order to install this project you will need to clone the repo and make sure you have Microsoft SQL Server installed.  I also highly recommend you install Microsoft SQL Server Management Studio.  Once you have connected your local computer to the the SQL server, you will then need to run the SQL Server Script found in Web\multitracks.com\multitracks.com\STORED_PROCEDURES_SCRIPT.
This Will create the database and run the stored Procedures on your local machine.

## Usage
This Project is used for A take home test for a great potential job. It will serve as a template to help musicians spread the love of music and the worship of God with a special application to aid in rehearsals, performances, and learning great worship songs.

## What-I-Learned
These were the steps of my learning process:
- I had to install SQL Server and create the database in the terminal using Transact-SQL commands
- Installed SQL server Management Studio (SSMS) to getter a better view of the database
- right clicked on "publish" in the folder directory here to get the database connection started
- right click "build" to populate the database MultitracksDB in the same submenu as above

![how to publish DB](./ScreenshotPublishDB.png)

- opened up "SQL Server Object Explorer" and right clicked on the correct database to find properties.

![how to open up database properties](./ScreenshotSQLserverObjEx.png)

- After locating the connection string I had to delete parts of it that were unnecessary
- It started out like this

        Data Source=(localdb)\ProjectModels;Initial Catalog=master;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False

- and I deleted the part of the string after `Encrypt=False;` and placed it in the SQL.cs file in the SQL class

        private string connectionString = "Data Source=(localdb)\\ProjectModels;Initial Catalog=MultiTracksDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;";

- and had to modify it in the Web.config to simply include a `.` for Data Source, I found this resource [StackOverFlow](https://stackoverflow.com/questions/46663151/changing-connection-strings-in-web-config-to-access-local-database-instead-of-on)

        <connectionStrings>
        <add name="admin" connectionString="Data Source=.;Initial Catalog=MultiTracksDB;Integrated Security=True;Connect Timeout=30;Encrypt=False;" />
        </connectionStrings>

- This was another code snippet that led me to discover how to populate the Data on the Front end

  		  <ul runat="server" id="artistItems">
              <asp:Repeater runat="server" ID="artists">
                  <ItemTemplate>
                      <li><%#Eval("title") %></li>
					  <li><%#Eval("biography") %></li>
                      <img src=<%#Eval("imageURL") %> alt=<%#Eval("title")%> "photo"/>
					  <img src=<%#Eval("heroURL") %> alt=<%#Eval("title")%> "photo"/>
                  </ItemTemplate>
              </asp:Repeater>
           </ul>

- I also learned a lot from Data types to allow non repeated Values for the Albums
           
      protected HashSet<string> AlbumTitlesHash { get; set; }
    protected HashSet<string> AlbumImagesHash { get; set; }
                AlbumTitlesHash = new HashSet<string>();
            AlbumImagesHash = new HashSet<string>();
                        foreach (DataRow row in data.Rows)
            {
                string albumTitle = row["AlbumTitle"].ToString();
                string albumImage = row["AlbumImage"].ToString();
                AlbumTitlesHash.Add(albumTitle);
                AlbumImagesHash.Add(albumImage);
                            }

-There was several times where I had to debug the code on how variables were stored in Session objects, and often restarted Visual Studio to delete some of the session variables that would cause NullReferenceExceptions.
-I also employed some styling features to enhance the look of the basic solutions to the assessment
-I really enjoyed working on this, and wanted to hold true to the specifics asked in the assessment steps as much as possible.  Including the URL paths and the parameters of Artist ID to display Data to the Overview, Songs, and Albums pages.

## Screenshot of Application
![Screen Shot of Finished Assessment](MultiTracks.com.gif)

## Links
[Made with my homemade readme generator!](https://github.com/Byrdbass/MarkDown-MUHsheeen)

## Questions?
My gitHub user name is Byrdbass, and you may email me at byrdsjobhunt@gmail.com for Questions.
You may contribute to this project by loving god and find your way of worship through song.



