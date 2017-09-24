User.create!([
  {username: "admin", email: "admin@admin.com", password:"password", password_confirmation:"password", role: 1, remember_digest: nil},
  {username: "superadmin", email: "superadmin@favplay.com", password:"password", password_confirmation:"password",role: 2, remember_digest: nil},
  {username: "user1", email: "user1@favplay.com", password:"password", password_confirmation:"password", role: 0, remember_digest: nil},
  {username: "user2", email: "user2@favplay.com", password:"password", password_confirmation:"password", role: 0, remember_digest: nil}
])
Genre.create!([
  {name: "Hip Hop", user_id: 1},
  {name: "Soul", user_id: 1},
  {name: "Alternative ", user_id: 1},
  {name: "Pop", user_id: 1},
  {name: "Rock", user_id: 1},
  {name: "Funk", user_id: 1}
])
Artist.create!([
  {name: "Kendrick Lamar", artist_image: "http://cache.umusic.com/_sites/kendricklamar.com/images/og.jpg", user_id: 1, genre_id: 1, artist_details: "Kendrick Lamar Duckworth (born June 17, 1987)[2] is an American rapper and songwriter. Born and raised in Compton, California, he embarked on his musical career as a teenager under the stage name K-Dot, releasing a mixtape that garnered local attention and led to his signing with indie record label Top Dawg Entertainment (TDE). He began to gain recognition in 2010, after his first retail release, Overly Dedicated. The following year, Lamar independently released his first studio album, Section.80, which included his debut single, \"HiiiPoWeR\". By that time, he had amassed a large Internet following and collaborated with several prominent artists in the hip hop industry, including The Game, Busta Rhymes, and Snoop Dogg."},
  {name: "Queens of the stone age", artist_image: "https://i.ytimg.com/vi/-90obSa1Az4/maxresdefault.jpg", user_id: 1, genre_id: 5, artist_details: "Queens of the Stone Age (sometimes shortened to QotSA or Queens) is an American rock band formed in 1996 in Palm Desert, California. The band's line-up includes founder Josh Homme (lead vocals, guitar, piano), alongside longtime members Troy Van Leeuwen (guitar, lap steel, keyboard, percussion, backing vocals), Michael Shuman (bass guitar, keyboard, backing vocals), Dean Fertita (keyboards, guitar, percussion, backing vocals), and recent addition Jon Theodore (drums, percussion)."},
  {name: "Ariana Grande", artist_image: "https://media.pitchfork.com/photos/5929a9cf5e6ef9596932149d/1:1/w_600/35c4daff.jpg", user_id: 1, genre_id: 4, artist_details: "Ariana Grande-Butera (born June 26, 1993), known as Ariana Grande (/ˌɑːriˈɑːnə ˈɡrɑːndeɪ/),[1] is an American singer and actress. She began her career in 2008 in the Broadway musical 13, before playing the role of Cat Valentine in the Nickelodeon television series Victorious, and in the spinoff Sam & Cat until 2014. She has also appeared in other theatre and television roles and has lent her voice to animated television and films."},
  {name: "Radiohead", artist_image: "https://consequenceofsound.files.wordpress.com/2013/03/radiohead.jpg?quality=80", user_id: 1, genre_id: 3, artist_details: "Radiohead are an English rock band from Abingdon, Oxfordshire, formed in 1985. The band consists of Thom Yorke (lead vocals, guitar, piano, keyboards), Jonny Greenwood (lead guitar, keyboards, other instruments), Ed O'Brien (guitar, backing vocals), Colin Greenwood (bass), and Phil Selway (drums, percussion, backing vocals). They have worked with producer Nigel Godrich and cover artist Stanley Donwood since 1994."},
  {name: "Marvin Gaye", artist_image: "https://d063e17xn2-flywheel.netdna-ssl.com/wp-content/uploads/2012/11/marvin_gaye.jpg", user_id: 1, genre_id: 2, artist_details: "Marvin Gaye (/ɡeɪ/;[1] born Marvin Pentz Gay Jr.; April 2, 1939 – April 1, 1984)[2] was an American singer, songwriter and record producer. Gaye helped to shape the sound of Motown in the 1960s, first as an in-house session player and later as a solo artist with a string of hits, including \"Ain't That Peculiar\", \"How Sweet It Is (To Be Loved By You)\" and \"I Heard It Through the Grapevine\", and duet recordings with Mary Wells, Kim Weston, Diana Ross and Tammi Terrell, later earning the titles \"Prince of Motown\" and \"Prince of Soul\"."},
  {name: "Metallica", artist_image: "https://up-1.cdn-fullscreendirect.com/production/photos/7549/large/20161022_184841_7549_958066.jpeg", user_id: 1, genre_id: 5, artist_details: "Metallica is an American heavy metal band based in San Rafael, California. The band was formed in 1981 in Los Angeles when vocalist/guitarist James Hetfield responded to an advertisement posted by drummer Lars Ulrich in a local newspaper. Metallica's current lineup comprises founding members Hetfield and Ulrich, longtime lead guitarist Kirk Hammett, and bassist Robert Trujillo. Guitarist Dave Mustaine (who went on to form Megadeth) and bassists Ron McGovney, Cliff Burton, and Jason Newsted are also former members of the band."},
  {name: "Jamiroquai", artist_image: "https://lastfm-img2.akamaized.net/i/u/300x300/14114cdf782941b6be4c3d96fd02d919.jpg", user_id: 1, genre_id: 6, artist_details: "Jamiroquai are a British funk and acid jazz band formed in 1992.[7] Fronted by lead singer Jay Kay, Jamiroquai was initially the most prominent component in the London-based funk/acid jazz movement, alongside groups such as Incognito, the James Taylor Quartet, and the Brand New Heavies. Subsequent albums have explored other musical directions such as pop, rock, and electronica."}
])
Album.create!([
  {name: "DAMN", released: 2017, img_url: "http://www.xxlmag.com/files/2017/04/kendrick-lamar-damn-cover.jpeg", artist_id: 1, user_id: 1, genre_id: 1},
  {name: "Dangerous Woman", released: 2016, img_url: "https://upload.wikimedia.org/wikipedia/en/4/4b/Ariana_Grande_-_Dangerous_Woman_%28Official_Album_Cover%29.png", artist_id: 3, user_id: 1, genre_id: 4},
  {name: "Villian", released: 2017, img_url: "http://cdn.shopify.com/s/files/1/0342/2497/products/queens-of-the-stone-age-villains-south-records-ltd-2_grande.jpeg?v=1497642728", artist_id: 2, user_id: 1, genre_id: 5},
  {name: "A Moon Shaped Pool", released: 2016, img_url: "https://upload.wikimedia.org/wikipedia/en/c/c1/A_Moon_Shaped_Pool.jpg", artist_id: 4, user_id: 1, genre_id: 3},
  {name: "To pimp a buterfly", released: 2015, img_url: "https://upload.wikimedia.org/wikipedia/en/f/f6/Kendrick_Lamar_-_To_Pimp_a_Butterfly.png", artist_id: 1, user_id: 1, genre_id: 1},
  {name: "What’s Going On", released: 1971, img_url: "https://img.discogs.com/sdQTInb-NNf58wNAp_iktAYvpLI=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-2653062-1373624039-8301.jpeg.jpg", artist_id: 5, user_id: 1, genre_id: 2},
  {name: "...And justice for all", released: 1988, img_url: "https://upload.wikimedia.org/wikipedia/en/b/bd/Metallica_-_...And_Justice_for_All_cover.jpg", artist_id: 6, user_id: 1, genre_id: 5},
  {name: "Travelling Without Moving", released: 1996, img_url: "https://img.discogs.com/KH7E0abr-MsiFjnFaROvLWpRFO0=/fit-in/600x600/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/R-21974-1481492024-8003.jpeg.jpg", artist_id: 7, user_id: 1, genre_id: 6}
])
Song.create!([
  {name: "Blood", length: "1:58", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=CRVNAfj6XdY"},
  {name: "DNA", length: "3:06", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=NLZRYQMLDW4"},
  {name: "Yah", length: "2:40", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=pmTL9aMslGo"},
  {name: "Element", length: "3:28", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=glaG64Ao7sM"},
  {name: "Feel", length: "3:35", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=TKs8BhJVI1o"},
  {name: "Loyalty", length: "3:47", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=Dlh-dzB2U4Y"},
  {name: "Pride", length: "4:35", genre_id: 1, album_id: 1, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=5pZWUJArUa8"},
  {name: "Feet Don't Fail Me", length: "5:42", genre_id: 5, album_id: 3, artist_id: 2, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=nscGRxzH2gg"},
  {name: "The Way You Used to Do", length: "4:34", genre_id: 5, album_id: 3, artist_id: 2, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=GvyNyFXHj4k"},
  {name: "Domesticated Animals", length: "5:20", genre_id: 5, album_id: 3, artist_id: 2, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=6nI1RIA-Y1Q"},
  {name: "Fortress", length: "5:27", genre_id: 5, album_id: 3, artist_id: 2, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=dNwNSU5NikU"},
  {name: "Head Like a Haunted House", length: "3:21", genre_id: 5, album_id: 3, artist_id: 2, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=x1GfW00RCpg"},
  {name: "Un-Reborn Again", length: "6:41", genre_id: 5, album_id: 3, artist_id: 2, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=b_zf9Ug1ePU"},
  {name: "Moonlight", length: "3:31", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=LN3UOb3iiTE"},
  {name: "Dangerous Woman", length: "3:56", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=9WbCfHutDSE"},
  {name: "Be Alright", length: "2:59", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=eBAHqRnSgRw"},
  {name: "Into You", length: "4:05", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=1ekZEVeXwek"},
  {name: "Side to Side", length: "3:46", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=SXiSVQZLje8"},
  {name: "Let Me Love You (feat. Lil Wayne)", length: "3:44", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=5WL672bjJgM"},
  {name: "Greedy", length: "3:35", genre_id: 4, album_id: 2, artist_id: 3, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=CGq7eI7Y9Gw"},
  {name: "Burn the Witch", length: "3:41", genre_id: 3, album_id: 4, artist_id: 4, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=yI2oS2hoL0k"},
  {name: "Wesley’s Theory", length: "4:47", genre_id: 1, album_id: 5, artist_id: 1, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=sVM6zyeqgTw"},
  {name: "King Kunta", length: "3:55", genre_id: 1, album_id: 5, artist_id: 1, user_id: 1, youtube_link: " https://www.youtube.com/watch?v=hRK7PVJFbS8"},
  {name: "What’s Going On", length: "3:53", genre_id: 2, album_id: 6, artist_id: 5, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=H-kA3UtBj4M"},
  {name: "...And justice for all", length: "9:56", genre_id: 5, album_id: 7, artist_id: 6, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=-BG1Ng2pU-8"},
  {name: "One", length: "7:26", genre_id: 5, album_id: 7, artist_id: 6, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=EzgGTTtR0kc"},
  {name: "Virtual Insanity", length: "5:41", genre_id: 6, album_id: 8, artist_id: 7, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=Et9b7LWfnxQ"},
  {name: "Cosmic Girl", length: "4:05", genre_id: 6, album_id: 8, artist_id: 7, user_id: 1, youtube_link: "https://www.youtube.com/watch?v=UBnPedWPatI"}
])
Playlist.create!([
  {name: "Day Play", user_id: 1, description: "Day routine music\r\n"},
  {name: "Night Play", user_id: 1, description: "Play before sleep\r\n"}
])
PlaylistSong.create!([
  {playlist_id: 2, song_id: 24},
  {playlist_id: 2, song_id: 28},
  {playlist_id: 2, song_id: 26},
  {playlist_id: 2, song_id: 19},
  {playlist_id: 1, song_id: 27}
])
