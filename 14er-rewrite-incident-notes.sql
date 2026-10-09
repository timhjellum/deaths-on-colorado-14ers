-- =====================================================================
-- 14er-deaths.com  |  Rewrite incident notes (Oct 7, 2026)
-- Paste this whole file into Supabase > SQL Editor and click Run.
--
--   230 notes rewritten in full ("Name, a 28-year-old male, tragically lost his life ...")
--   21 long narratives kept, with a new lead sentence added on top
--   empty notes on unnamed records get a sentence built from their fields
--   research / source lists at the bottom of each note are kept
--   Drew Sikes: original note (a private message marked confidential) moved
--     to reviewer_notes, which the site never shows
--   Maynard Grant Brandsma: cause 'Cardiac' -> 'Cardiac event', age '61' -> '60+'
--   Sex filled in for 16 records where sources state it; Jadyn Weiss -> female
--   Unnamed Castle Peak fall (9/6/2026) rejected as a probable duplicate of Drew Sikes
--
-- All-or-nothing: if any rewrite doesn't match exactly one record, or any
-- record with a note has no rewrite, nothing is changed.
-- Undo: every note is copied to incidents_notes_backup_20261007 first.
-- Expected result at the bottom: 305 approved rows, 0 rows still using the
-- old shorthand ("yo M", "Additional information:").
-- =====================================================================

create table incidents_notes_backup_20261007 as
  select id, incident_details, reviewer_notes, cause, age from incidents;
alter table incidents_notes_backup_20261007 enable row level security;

create table _notes_rewrite (id8 text primary key, mode text not null, txt text not null);
alter table _notes_rewrite enable row level security;
insert into _notes_rewrite (id8, mode, txt) values
('00ca82e2','r','Robert E. “Bob” Love, a male aged 57 or 58 from Earlham, Iowa, tragically lost his life while racing in the 1992 Pikes Peak Ascent, his third race on the mountain.'),
('016d8109','p','Linda M. Pryor, a 49-year-old female, tragically lost her life after suddenly losing her footing and falling while climbing a gully on Crestone Needle with a party of six.'),
('05d7719c','r','Sallie Skinner, a 45-year-old female, tragically lost her life to exposure and exhaustion half a mile below the summit of Pikes Peak after she and Willis A. Skinner, 55, were caught in a severe summer blizzard.

The couple set out to hike the mountain along the Cog Railway route at the height of tourist season, ignoring warnings about a sudden change in the weather. They were unprepared for the storm, and their bodies were found side by side the next day beneath a foot of fresh snow.'),
('07c132ef','r','Robert F. Smith, a male climber, tragically lost his life in a fall along the North Face (Cable Route) of Longs Peak.'),
('07da5d90','r','Micah Tice, a male in his 20s from Las Vegas, Nevada, tragically lost his life to hypothermia and exposure on Longs Peak.'),
('0831e0d7','r','Mark Stice, a 36-year-old male, disappeared on a five-day trip into the South Colony Basin near Crestone Peak and is presumed to have lost his life.

His vehicle was found at the lower South Colony trailhead, but his body was never located despite 800 hours of searching.'),
('08f61f64','r','Glenn R. McDonald, a male climber, tragically lost his life after being struck by lightning on nearby Hallett Peak, filed here under Longs Peak.

His party saw violent electrical storms striking Longs Peak at the same time.'),
('09a8d064','r','Barney Cruz IV, a 27-year-old male from Texas, tragically lost his life in a fall while hiking Blanca Peak.'),
('0b1ab60b','r','Luis Corkern, a 41-year-old male from Dallas, tragically lost his life after apparently falling from the ridge between Kit Carson Peak and Challenger Point into the Kirk Couloir.

He had climbed Kit Carson by the North Ridge, and his body was recovered on July 12, 2022.'),
('0b6239be','r','Ingrid Johnson, a female in her 20s from Denver, tragically lost her life in a fall from the section of Mount Eolus known as the Catwalk.'),
('0e665d7f','r','Brendan Culbert, a 25-year-old, tragically lost their life when the private plane they were aboard struck Wilson Peak just below the summit on a flight to Telluride.

All four people aboard the Beech 35-C33 were killed.'),
('0fdbe3fe','p','Captain David C. Jacobs tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('0ff186cd','r','Gary P. Williams, a 59-year-old runner, tragically lost their life after collapsing on the ascent leg of the Pikes Peak Marathon, about 2 to 2.5 miles below the summit.

Race reporting described a suspected heart attack.'),
('10100ae9','r','Ryan Marcil, a 26-year-old male from Aspen, tragically lost his life alongside Carlin “Carly” Brightwell in a fall while descending off route on Capitol Peak.

The two were last seen near the summit on August 20, 2017, and their bodies were found on August 22.'),
('124eb69e','r','An unnamed man from Montana tragically lost his life in an apparent fall on Longs Peak; his body was recovered at the bottom of the Lamb''s Slide mountaineering route.'),
('13806adf','r','Chris Gray, a male climber, tragically lost his life in a fall while attempting the North Buttress of Crestone Peak with his wife, Taylor.

He was found the next day.'),
('13cfeed7','r','An unnamed 80-year-old male tragically lost his life near the summit of Mount Elbert; initial reports pointed to natural causes.

Lake County Search and Rescue crews requested air support and tried to save him, but he was declared deceased. The Lake County Coroner''s Office investigated further.'),
('161f07ef','r','Dwayne Johnson, a 46-year-old male, tragically lost his life in a rockslide at Agnes Vaille Falls, below Mount Princeton.

Five people were killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon, below Mount Princeton.'),
('18408e63','r','Sandy Sigman, a female Flight for Life nurse aged 42 or 43, tragically lost her life when her rescue helicopter crashed on Huron Peak.

Pilot Gary McCall was also killed.'),
('185c760c','r','Clayton M Smith, a 58-year-old male, tragically lost his life in a fall in the Loft, between Mount Meeker and Longs Peak.'),
('18bb5c3f','r','Peter Andrew Clarke, a 54-year-old male, tragically lost his life after falling about 1,000 feet while descending the Southwest Ridge of Mount Sneffels alone.'),
('1b0651e2','r','John Regan, a 57-year-old male, tragically lost his life after slipping from a narrow section of the Ledges on Longs Peak''s Keyhole Route and falling 200 to 300 feet.

The fall happened where two metal bars protrude from the rock.'),
('1b863a97','r','Dr. Harold Affsprung, a 45-year-old male, tragically lost his life after falling at least 200 feet while climbing unroped above his party on the Northwest Face of Little Bear Peak.

He called out “Rock” as he fell; the AAC analysis considered a loose hold the most likely cause.'),
('1cd4e876','r','Jeremy Shull, a 35-year-old male from Parker, Colorado, tragically lost his life after falling about 200 feet while ascending toward the Knife Edge on Capitol Peak.

He was ahead of his party and out of sight when he fell, and weather delayed the recovery.'),
('1d4916cf','r','Scott Corliss, a 61-year-old male, tragically lost his life after slipping on ice and falling 100 to 150 feet from the Narrows on Longs Peak''s Keyhole Route.

This exposed section of the route has been the site of at least five deaths.'),
('1d81db3c','r','Rei Hwa Lee, a 57-year-old female from Littleton, tragically lost her life in a fall on the north face of North Maroon Peak.'),
('1ef47ceb','r','An unnamed 24-year-old male from Fort Collins tragically lost his life on Longs Peak; his body was found 1,000 feet below the Keyhole Route in the Trough.'),
('1ffdde33','r','Neil Campbell, a male climber, tragically lost his life in a fall near Blanca Peak and its glacier around 1960, along with an unnamed climbing partner.

Their bodies were recovered June 20–21, 1960.'),
('20a3af1f','p','Agnes Vaille, a 34-year-old female, tragically lost her life to exhaustion and exposure on Longs Peak after a fall during the descent from the first winter ascent of the East Face.'),
('219e580c','r','Robert Silver, a 16-year-old male, tragically lost his life in a fall while climbing Longs Peak.'),
('21a3a5b6','r','Lucas Macaj, a male in his 20s from Colorado Springs, tragically lost his life in a fall in the Lamb''s Slide area of Longs Peak.'),
('21cc90ec','r','Jeremy Fuerst, a male aged 43 or 44 from Everett, Washington, tragically lost his life after falling about 300 feet from the traverse between Crestone Peak and Crestone Needle.'),
('22e09f35','r','Walter Johnson, a male in his 20s, tragically lost his life in a blast at the Oil Creek Mining Company operation in Ghost Town Hollow, on the upper slopes of Pikes Peak.

Although not a climbing accident, his death is included as part of the mining history of Colorado''s fourteeners.'),
('23105565','p','Alexe Mericle, a 38-year-old male, tragically lost his life in a fall after going off route on the traverse between Crestone Peak and Crestone Needle with his wife, Laura, who was rescued.'),
('23171c90','r','Gray Secor Jr., a 16-year-old male, tragically lost his life in a fall on Longs Peak.'),
('2343bed7','r','Kelly McDermott, a 32-year-old male climbing solo, tragically lost his life in an apparent fall from the Knife Edge on Capitol Peak.

His remains were found about 500 feet below the ridge. Constant rockfall from climbers above, which struck and injured rescuers, made the recovery too dangerous.'),
('25ae2943','r','Sarah Beechler, a female in her 30s from Denver, tragically lost her life after a handhold broke loose and she fell about 900 feet near the summit of Capitol Peak.

Capitol was to be her final Colorado fourteener.'),
('25cc83cc','r','Duane Best, a 22-year-old male Western State College student, tragically lost his life after falling more than 80 meters while ascending Crestone Needle.

Best and his partner, Geoffrey Bogar, carried climbing equipment but were not using it, and Best was wearing tennis shoes.'),
('25ce138b','r','Maynard Grant Brandsma, a 62-year-old male from Durango, tragically lost his life after suffering a heart attack about 110 yards short of the summit of Longs Peak.'),
('268a9fe7','r','Catherine M. Pugin, a 29-year-old female from Boulder, tragically lost her life when lightning struck her at about 13,920 feet on Mount Princeton during a violent afternoon storm.

Dangerous weather delayed search and rescue overnight, and her body was recovered the following day. A bronze memorial plaque was later placed near the site.'),
('26a23f55','r','Keith Ross, a 50-year-old male, tragically lost his life after falling about 30 feet near Broken Hand Pass while descending Crestone Needle.

He was celebrating his 50th birthday by attempting 50 of Colorado''s fourteeners in 30 days.'),
('26c1c551','r','Levi Strobel, a 15-year-old male, tragically lost his life after being struck by lightning near the summit of Mount Blue Sky (Mount Evans) while trying to protect his brother.

* Source: https://coloradosun.com/2026/07/27/teen-boy-killed-hikers-injured-lightning-mount-blue-sky/'),
('279cef1d','p','First Lieutenant David W. Gill tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('2c6d8762','r','David Morano, a 41-year-old male, tragically lost his life after falling about 200 feet from a ridge on Thunder Pyramid, near Pyramid Peak.

A very experienced mountaineer who had climbed 129 of Colorado''s 200 highest peaks, he fell on loose, dangerous terrain.'),
('2d3f0545','r','Tyler Cline, a male in his 20s from Lakewood, Colorado, tragically lost his life in a reported fall in the area between Kit Carson Peak and Challenger Point.

He had been missing since June 23, 2019, and his body was found on June 27.'),
('2eba5d36','r','Nicholas L. Hellbusch, an 18-year-old male, tragically died by suicide near the Ledges on Longs Peak''s Keyhole Route.'),
('2f2a48a2','p','Dr. Heinz Pagels, a 49-year-old physicist and author, tragically lost his life after stepping on an unstable rock and falling while descending Pyramid Peak with Dr. Seth Lloyd.'),
('2f3dba83','r','Paul Nahon, a 20-year-old male, tragically lost his life after falling about 150 feet from the Narrows on Longs Peak''s Keyhole Route in icy conditions and high winds.

The winds kept rangers from reaching his body for days.'),
('30176fd4','p','Master Sergeant Helen M. Schuyler of the Women in the Air Force (WAF) tragically lost her life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('30369fef','r','Joy Cipoletti, a 60-year-old female from Colorado Springs, tragically lost her life after falling 500 to 800 feet while descending the exposed north ridge of Ellingwood Point.

She texted her daughter from the summit around 3 p.m. on October 10, 2020, and was found on October 15.'),
('30a4518a','r','Joseph Stolla, a male in his 30s, tragically lost his life in a fall on Mount Eolus after a rock block broke off.'),
('3168b5e9','r','Ryan Joseph Palmer, a 35-year-old male, tragically lost his life after falling 200 to 300 feet on the north face of Capitol Peak, which he chose to descend instead of recrossing the Knife Edge after summiting with friends.'),
('3263e5cc','r','Jeffrey Carlin, a 41-year-old male, tragically lost his life in an accidental fall on Kiener''s Route, on the upper East Face of Longs Peak.

He last contacted someone from the summit on July 4, 2026, and was found the next day. A senior claims representative in Denver, he was remembered by his F45 Training community as disciplined, hardworking and supportive.'),
('329223f1','r','David L. Jones, an 18-year-old male, tragically lost his life in a fall on the East Face of Longs Peak after his party was caught in a severe, unseasonable storm near Alexander''s Chimney.

Jones and Prince D. Willmon fell the morning after spending a night high on the mountain, badly frostbitten. Their companion, Jane R. Bendixen, survived and reached Allenspark to raise the alarm.'),
('33eb5d2e','r','Russell Jacobs, a male in his 20s from Westminster, Colorado, tragically lost his life to exposure after spending the night above the Ledges on Longs Peak''s Keyhole Route.'),
('357b932b','p','Colonel Charles Arthur Miller, the pilot, tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('35881f49','r','Dillon Blanksma, a male in his 20s from Golden, tragically lost his life after a 600-foot fall from Broadway Ledge on the East Face of Longs Peak.'),
('39ba4f14','r','Chief Warrant Officer 4 Terrance W. Geer, a 40-year-old male soldier, tragically lost his life in an Army MH-60K helicopter crash on Mount Massive.

Four soldiers were killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training.'),
('39f445e6','r','Joe Anderson, a 45-year-old male and the mayor pro tem of Englewood, Colorado, tragically lost his life after struggling to breathe and losing consciousness on the lower slopes of Quandary Peak.

Hikers began CPR before deputies and emergency responders took over around 6:40 a.m., but he was pronounced dead at the scene. The cause of death has not been determined.'),
('3a17ff08','r','James Duffy III, a 24-year-old male, tragically lost his life to hypothermia and exposure after becoming stranded in a severe blizzard on Longs Peak.'),
('3a58b4a1','r','Rudi Moder, a 27-year-old male from West Germany living in Fort Collins, tragically lost his life, likely in an avalanche, on a planned two- to three-night backcountry ski trip near Longs Peak.

He was reported missing six days after setting out. His remains were found 38 years later in Skeleton Gulch.'),
('3b992792','p','Staff Sergeant William E. MacKenzie Jr. tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('3bd158dd','r','Carrie J. Welton, a female in her 40s, tragically lost her life to exhaustion and hypothermia near the Keyhole on Longs Peak after reaching the summit and becoming trapped in a severe storm on her descent.

She is the first recorded fatality on Longs Peak.'),
('3d8dc862','r','Kevin Hayne, an 18-year-old male, tragically lost his life after a hold broke loose and he fell several hundred feet beside the iced-over Hourglass on Little Bear Peak.

Finding the Hourglass impassable, he and his partner moved onto a ledge to its left to wait for the sun to melt it out. About 30 seconds later, the hold gave way.'),
('3da1433c','r','Sudheer Averineni, a 26-year-old male, tragically lost his life to exposure and hypothermia after becoming separated from his group in worsening weather on Longs Peak.

Park rangers found his body the next day.'),
('3dfaeacd','r','James Brian “JB” Nelson, a 31-year-old male, tragically lost his life on a solo five-day, 25-mile backpacking trip in the Holy Cross Wilderness.

His remains were found at a campsite near Holy Cross City in 2012, and his journal suggested he may have been suffering from altitude sickness.'),
('3e963a27','r','An unnamed climber tragically lost their life on the lower portion of Capitol Peak, below the Knife Edge.

It is the first documented death on Capitol Peak.'),
('3ecb17e9','r','Tim Finnegan, a male climber, tragically lost his life after being struck by lightning on Longs Peak.'),
('41d000f8','r','Frank Pretzel, a 44-year-old male, tragically lost his life when the rope team led by Dr. Herbert Ungnade fell in a steep snow couloir on South Maroon Peak.

To save time, three members of the four-man party climbed simultaneously while one belayed. When one climber slipped, he pulled all four into the fall. Bob Day, Frank Pretzel and Herbert Ungnade were killed; the youngest member, William Martin, survived, reportedly thanks to the construction hard hat he was wearing.'),
('43eba1a6','r','Bob Day, a 42-year-old male, tragically lost his life when the rope team led by Dr. Herbert Ungnade fell in a steep snow couloir on South Maroon Peak.

To save time, three members of the four-man party climbed simultaneously while one belayed. When one climber slipped, he pulled all four into the fall. Bob Day, Frank Pretzel and Herbert Ungnade were killed; the youngest member, William Martin, survived, reportedly thanks to the construction hard hat he was wearing.'),
('43fad6a7','r','Dawna Johnson, a 45-year-old female, tragically lost her life in a rockslide at Agnes Vaille Falls, below Mount Princeton.

Five people were killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon, below Mount Princeton.'),
('44a86475','r','James Slack, a 20-year-old male, tragically lost his life after slipping and falling 15 to 20 feet below the summit of Pikes Peak during a solo climb.

He set out on July 24, 1948, and was found on July 28 with a fractured skull; his exact date of death is unknown.'),
('45bee46d','r','Beatrice Venice Sawyer, a 24-year-old female, tragically lost her life after falling about 1,000 feet in the loose, blocky terrain between North and South Maroon Peaks.'),
('466c0511','p','Specialist Third Class William L. Simpson tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('46be0c36','r','Mostafa Salehi, a 48-year-old male, tragically lost his life after suffering cardiac arrest near the summit of Quandary Peak.'),
('483c7fa3','r','An unnamed man tragically died by suicide at the Narrows on Longs Peak''s Keyhole Route.'),
('48862d55','r','Theodore James Leach, a 42-year-old male from Littleton, tragically lost his life in an accidental fall on North Maroon Peak and was found at about 11,200 feet.'),
('4901ecd5','r','Don Thurman, a 63-year-old male, tragically lost his life in a fall on steep terrain near Kit Carson Avenue after he and his partner became separated when they missed the exit on their descent of Kit Carson Peak.'),
('4af0f724','p','Oscar M. Rupert, a civilian passenger, tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('4b817ac7','r','Sean A. Wylam, a 25-year-old male, tragically lost his life when the rock beneath him failed shortly after he reached the summit of Snowmass Mountain, sending a mass of rock and dirt down the south gully.

He fell about 30 feet before his leg caught in a crevice, leaving him gravely injured. Climbers nearby reached him and called for help, and he died after rescue helicopters arrived.'),
('4bc2fc37','r','Herbert M. “Hal” Wise, a 53-year-old male from Rochester, New York, tragically lost his life after falling 300 to 400 feet while ascending Wilson Peak.'),
('4c08b3ad','r','Gregory Aubuchon, a male climber, tragically lost his life in a fall on Longs Peak while descending alone, likely from the Notch Chimney.'),
('4dd9b026','r','Bobby Goodin, a 54-year-old male motorcycle racer, tragically lost his life after crashing his Triumph Daytona 675R moments after crossing the summit finish line of the Pikes Peak Hill Climb.'),
('4e194dbc','r','Ron Webber, a 58-year-old male, tragically lost his life after a 200-foot fall during a mountaineering trek near Chasm Lake; his body was found at the base of Longs Peak.'),
('50768ec7','r','Peter Wing, a male in his 20s from Denver, tragically lost his life in a fall while skiing from the summit of Quandary Peak.'),
('522fc10e','r','James Hasse, a 61-year-old male from Summit County, tragically lost his life after falling about 200 feet on South Maroon Peak.'),
('5358d66c','r','John W. Heckert, a male climber, tragically lost his life after losing control during a sitting glissade on hard snow while descending Capitol Peak and striking a boulder about 100 feet below.

He had reached the summit with Eileen Ginter and Richard Slusser.'),
('547141ac','r','Herbert Sortland, a male volunteer rescuer, tragically lost his life to exposure on Longs Peak while searching for Agnes Vaille during a severe winter storm.

Forced to turn back by the storm, he never made it back to shelter. His frozen body was found on February 25, 1925, only a few hundred feet from the cabin.'),
('54a06dd7','r','Christopher Kiryluk, a 34-year-old male, tragically lost his life after falling more than 800 feet in the Red Gully while descending Crestone Peak in lingering snow and ice.'),
('55308923','r','Kristyne “Teeny” H. Jeung, a 37-year-old female, tragically lost her life in an avalanche that killed three skiers traversing from the Pearl Pass area toward Castle Peak.

Her body was eventually recovered, though sources disagree on when.'),
('5661bef2','r','Martin Pigeon, a 45-year-old male, tragically lost his life after falling about 230 feet while descending Windom Peak in a rain and hail storm.

He and his climbing partner, Yves Marcoux, were attempting 20 peaks in three weeks. They became separated on the descent, and Marcoux found his body at the base of a cliff at 13,300 feet.'),
('56fabf8f','p','Captain (USN) James Joseph Richardson, the copilot, tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('57ea193d','r','Carlin Dunne, a 36-year-old male motorcycle racer from Santa Barbara, California, tragically lost his life when he crashed his Ducati Streetfighter V4 prototype 20 yards before the finish line of the 2019 Pikes Peak Hill Climb.'),
('590d1a7f','r','Bill Gross, a male motorcycle racer, tragically lost his life during the 1982 Fourth of July Pikes Peak Hill Climb when another motorcycle struck him after he fell from his bike.

He died that day from liver injuries.'),
('5b7a6db9','r','An unnamed 26-year-old male climber tragically lost his life after a 600- to 800-foot fall from Broadway Ledge near Field''s Chimney on the East Face of Longs Peak.'),
('5bdf3fe5','r','Herbert "Herb" Martin, a male climber, tragically lost his life in the 1950s when a boulder knocked loose by another climber struck him as he ascended the steep east side of Mount Wilson.'),
('5d2c4104','p','Sergeant Phillip Lenz tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('5d33e17e','r','Steve Castellano, a 51-year-old male from Littleton, tragically lost his life after a loose handhold gave way and he fell about 150 feet while descending Snowmass Mountain.'),
('5d7d3cff','r','Rebecca Maxfield, a female in her 30s, tragically lost her life in an apparent fall near the Golden Stairs on the Barr Trail on Pikes Peak.

* Source: https://krdo.com/news/2018/11/02/hiker-identified-after-death-on-barr-trail/'),
('5df6c2c1','r','Linda Buhrmester, a 56-year-old female, tragically lost her life alongside her husband, Duane, when a violent thunderstorm triggered a rock and mudslide that swept them from the Ellingwood Arête area of Crestone Needle.

The couple from Texas fell about 500 feet and were carried another 300 feet by the debris flow, which buried them. They had climbing rope with them, though it is unknown whether they were roped in; the force of the storm may have overwhelmed any protection. Their bodies were found on August 1, 2010.'),
('5df88a51','p','Peter Topp, a 59-year-old male, tragically lost his life when falling rock struck him on the ridge traverse between El Diente Peak and Mount Wilson.'),
('5fa072e5','r','Michael Cormier, a 56-year-old male, tragically lost his life in a fall while descending Kit Carson Peak, apparently by the alternate Class 4 North Ridge.

He had told other climbers he was considering that route, and his body was found in a location consistent with it. The exact circumstances are unknown.

* Forum thread: https://www.14ers.com/forum/viewtopic.php?style=8&t=40779'),
('606cf5a0','r','David McKinley, a 47-year-old male county judge, tragically lost his life in a fall from Ellingwood Point, possibly while seeking shelter from a heavy mountain storm.'),
('618468e1','p','Lenny Joyner, a 31-year-old male, tragically lost his life in a fall of 500 to 1,000 feet while descending North Maroon Peak after traversing from South Maroon Peak.'),
('62c9d99f','r','Ronald Earl Fjeseth, a male aged 18 or 19, tragically lost his life in a long fall down a steep hard-snow gully on North Maroon Peak during an early spring ascent.

Richard Alan Cole was also killed; Joe Fullop survived.'),
('62cc3454','r','A 26-year-old climber identified only as “T.F.” in National Park Service logs tragically lost their life from a head injury after an unroped fall southwest of the summit of Longs Peak.

Online reports disagree on the year, citing 1991, 2002 or 2004.'),
('62eb08d2','r','Carl Sorensen, a 39-year-old male motorcycle racer from Centennial, tragically lost his life when he went off a cliff during the final practice session for the 2015 Pikes Peak Hill Climb.

A father of one, he had raced motorcycles for about 10 years and was hired to ride a Ducati that year.'),
('6307dc27','r','Charles W. Thiemeyer, a 28-year-old male, tragically lost his life after falling more than 1,000 feet while climbing the Notch Chimney on Longs Peak.'),
('64f6e165','r','Andrew Tyler “Drew” Sikes, a 37-year-old male, tragically lost his life in a fall on the north face of Castle Peak.'),
('65d72391','r','An unnamed male hiker from Denver tragically lost his life after falling about 100 feet from a steep embankment in the Ellingwood Ridge area of La Plata Peak while hiking with friends.

He suffered severe head trauma in the fall, which happened at about 3:15 p.m.'),
('66705dd3','p','Karl Pfiffner, a 25-year-old male, tragically lost his life when an avalanche swept him away as his party descended toward La Plata Basin after turning back on the Ellingwood Ridge of La Plata Peak.'),
('6ab18500','r','Evan McManus, an 18-year-old male, tragically lost his life alongside his father, Damian, on an attempted hike in the Echo Lake and Vance Creek area of Mount Blue Sky (Mount Evans).

Their remains were found in July 2014. They were last heard from on April 2, 2014, but the date and cause of death have not been established.'),
('6e3d0463','r','Derek Kelley, a 34-year-old male, tragically lost his life after a loose boulder gave way near the top of the crux chimney on North Maroon Peak, sending him more than 600 feet over the ledge below.'),
('6f455bc9','r','Wayne Kirkbride, a 61-year-old male, tragically lost his life after setting out alone to hike Mount Antero; how he died is unclear.

His wife reported him missing when he did not return. Searchers found his car at the Cascade Hill trailhead, which is not a standard route up the mountain.'),
('70d06d02','r','Charles Grant, a 19-year-old male from Chicago, tragically lost his life after falling nearly 800 feet while climbing Longs Peak.'),
('712b78dc','r','Edward H. Hilliard Jr., a 47-year-old, tragically lost their life alongside Ann Noyes Fowler when a dislodged rock sent them falling down a couloir near the top of North Maroon Peak.

Rodney Aller and his son, Rodney Aller Jr., survived.'),
('7165c7df','r','David Lee Syring, a 58-year-old male hiking alone, tragically lost his life when a large rock slide buried him on Mount Lindsey.

Two hikers from Steamboat Springs heard the slide shortly after passing him, and one of them found his body on the way down. Jurisdictional handoffs, treacherous terrain and two feet of new snow delayed the recovery for about a month, until rescuers lowered him 1,800 feet to the valley floor and a private helicopter brought him out.'),
('74c6c52f','r','Dr. Douglas Christensen, a male in his 50s from Denver, tragically lost his life after a fall of 30 to 40 feet on Windom Peak.'),
('7545645e','r','Jason Buehler, a 43-year-old male from Niwot, tragically lost his life after falling 500 to 1,000 feet during the traverse from South Maroon Peak to North Maroon Peak.'),
('75930def','r','Jeffrey R. Rosinski, a 29-year-old male, tragically lost his life after falling as much as 300 feet into the Trough on Longs Peak''s Keyhole Route amid ferocious winds.

He was likely hiking late at night and may have gone off route or been blown off his feet. Another climber, Corbin Mabon, who had to crawl onto the summit on his hands and knees in the wind, found his body at 3 a.m. the next morning.'),
('760576bb','r','Mark Cochran, a 27-year-old male pilot, tragically lost his life when his plane lost control in mountain-wave turbulence and struck Wilson Peak just below the summit.

All four people aboard were killed. His body was never recovered.'),
('763be511','r','Banks Caywood, a male climber, tragically lost his life after falling about 500 feet below the summit of Little Bear Peak while descending from the Blanca–Little Bear traverse.

He was climbing with four companions, and his body was recovered the following day.'),
('77392960','r','Andrew Graham Perkins, a 27-year-old male from Greenwood Village, Colorado, tragically lost his life after a large chunk of rock broke loose at the crux of the West Ridge Indirect route on Little Bear Peak and he fell.'),
('7817d1e9','r','Steve Gladbach, a 52-year-old male and a pillar of the 14ers community who had finished Colorado''s 13ers, tragically lost his life in an apparent fall on Thunder Pyramid, near Pyramid Peak, after separating from his group.'),
('7a5059d9','r','Zackaria White, a 21-year-old male from Pine, Colorado, tragically lost his life after falling about 600 feet in a gully off the standard route while descending Capitol Peak.

He had separated from his partner after they disagreed about the descent route.'),
('7a97e85e','r','Don Chambliss, a 71-year-old male from Englewood, Colorado, tragically lost his life in an apparent fall on the Kelso Ridge of Torreys Peak.

He set out on July 16, 2019, was found on July 18, and was recovered the next day.'),
('7be8ddf3','p','Colonel Frederick W. Ledeboer tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('7ddbafe3','r','James “Jimi” Flowers, a 47-year-old male, tragically lost his life after slipping on snow and ice and falling hundreds of feet from the ridge between K2 and Daly Saddle while descending Capitol Peak.'),
('807c7994','r','William Frechtling, a 24-year-old male, tragically lost his life after suffering a heart attack at his campsite on Longs Peak.'),
('80aad910','r','Matthew Wayne Lackey, a 31-year-old male from Boulder, tragically lost his life in a fall on Mount Princeton triggered by loose rock.'),
('8310b4a0','r','An unnamed male aged 60 or older tragically lost his life in a fall on the Maroon Bells.'),
('84095fbe','r','Carlin “Carly” Brightwell, a 27-year-old female from Aspen, tragically lost her life alongside Ryan Marcil in a fall while descending off route on Capitol Peak.

The two were last seen near the summit on August 20, 2017, and their bodies were found on August 22.'),
('84d8725b','r','Jeffrey Pickering, a 44-year-old male, tragically lost his life in the Mount Yale area; the cause is unknown.

He was expected back at work on September 5, 2016, and was reported missing on September 9. His body was found that evening in heavy brush near County Road 306 and the Avalanche Trailhead.'),
('86bf89d5','r','Ben Brownlee, a 26-year-old male, tragically lost his life after falling from a steep, rocky ridge southeast of Cooper Creek Peak, near Redcloud Peak.

Working toward finishing Colorado''s 13ers, he was on a long loop that also took in several fourteeners. His body was spotted 75 to 100 feet below the ridge.'),
('87780960','r','Robert Elliott, a 26-year-old male, tragically lost his life in a fall during a winter ascent of Longs Peak.'),
('88ed1639','r','An unnamed climber tragically lost their life when a four-person party triggered a slab avalanche on a winter approach to Pyramid Peak, carrying them about 1,400 vertical feet and over a cliff.

The body was found three weeks later.'),
('8a5350ca','r','An unnamed 37-year-old male from Aspen tragically lost his life in the Conundrum Couloir; the cause of death has not been released.

He set out on July 29, 2023, was located on July 31, and was recovered on August 2. His body was partly covered by snow.'),
('8b17e4b0','r','G. Inestine B. Roberts, an 87-year-old female, tragically lost her life to exposure after disappearing in deteriorating weather while descending Pikes Peak following her 14th ascent of the mountain.

Last seen on August 5, 1957, she was found on August 14.'),
('8d2a1ef8','r','Michael Levine, a 42-year-old male, tragically lost his life in an 800-foot fall, likely while traversing south from Ellingwood Point toward Blanca Peak after leaving his Colorado Mountain Club group.

Helicopters and ground crews searched for more than a month. His body was spotted on August 31, 1986, in a steep ravine below the Ellingwood summit and recovered on September 2.'),
('8fcad6bd','r','Ralph Chandler Bruning Jr., a 31-year-old male race driver, tragically lost his life when his Super Stock car left the dirt road at 80 mph and struck a tree during qualifying practice for the Pikes Peak Hill Climb.'),
('8fd78912','r','Ryan Albert, a male in his 30s from Marlton, New Jersey, tragically lost his life in a fall from the Ledges on Longs Peak''s Keyhole Route.'),
('91738c44','r','"Jack" J. Seerley Jr., a 50-year-old male, tragically lost his life in a fall while descending the Trough on Longs Peak''s Keyhole Route alone.'),
('92074b08','r','James Edgar Nelson, a 53-year-old male climbing solo, tragically lost his life in a fall in the Mount Daly Basin above Moon Lake after reaching the summit of Capitol Peak.

His body was found at about 11,000 feet on August 6, 2014. During the recovery, a climber high above triggered massive rockslides that injured rescuers.'),
('933160f2','r','Tucker Shivers, a male in his 20s from Colorado Springs, tragically lost his life in a fall while snowboarding a couloir on Pikes Peak.'),
('939344c3','p','Mathew Zimmer, a 38-year-old male from Wichita, Kansas, tragically lost his life when a large rock broke loose on the upper headwall of Little Bear Peak''s Northwest Face, sending him tumbling 300 to 400 feet.'),
('9419b582','r','Clinton S. McHugh, a 32-year-old male, tragically lost his life in a fall from the west side of the Sawtooth Ridge while attempting the traverse to Mount Blue Sky after a solo summit of Mount Bierstadt.'),
('947d0741','r','Paul Rockwood, a male in his 20s, tragically lost his life in a fall on the South Ridge of Mount Eolus.

He died about a month after Joseph Stolla''s July 6, 1984, death on the same mountain; the exact date is unknown.'),
('96c84d9f','r','Lygon Stevens, a 20-year-old female, tragically lost her life when she and her brother were swept away by a large slab avalanche while descending Little Bear Peak.

Her brother survived. Severe weather suspended the initial search, and her body was recovered by helicopter on June 24, 2008, after the snow melted.'),
('972f293c','r','Robert “Rob” Jansen, a 24-year-old male, tragically lost his life in a fall or rock slide while traversing from Snowmass Mountain toward Hagerman Peak.'),
('97a1a19e','r','Debra Stith, a female aged 60 or older from Fort Collins, tragically lost her life in a fall on the scree slopes near Chasm Lake, below Longs Peak.'),
('989cab52','r','Robert "Bob" K. McCammon, an 18-year-old male student, tragically lost his life in a fall while attempting a technical route on the East Face of Longs Peak.'),
('9b67e264','r','Vaughn Fetzer, a 57-year-old male from Durango, tragically lost his life in a fall while descending Blanca Peak toward the steep gullies below Gash Ridge after reaching the summit.

Friends found his body on September 26, 2021.'),
('9e241228','r','Curt Dale, a male in his 50s, tragically lost his life in an avalanche while backcountry skiing on the south side of Elkhead Pass, near Mount Belford.'),
('9ee18dfa','r','Pawel Abramczyk, a male in his 30s from Thornton, Colorado, tragically lost his life in a fall while descending Longs Peak.'),
('9f855a1c','r','Dr. Matthew Davis, a 41-year-old male, tragically lost his life after slipping on unroped third-class terrain and falling more than 100 feet near the Ellingwood Arête on Crestone Needle.'),
('9feea214','r','Bill Blair, a male, tragically lost his life in an avalanche on Pikes Peak.

* Podcast: https://www.cpr.org/podcast-episode/wish-we-were-here-episode-12-avalanche-on-americas-mountain/'),
('a1f65831','r','Makana von Gortler, a 20-year-old female, tragically lost her life alongside her father, Robert Michael von Gortler, in an apparent fall on Missouri Mountain.

Both had head and neck trauma consistent with a fall. After a five-day search, helicopters spotted them off trail, about 500 feet above the main trail at 12,000 feet.'),
('a23e0fd0','r','Jake Lord, a 25-year-old male from Parker, Colorado, tragically lost his life after a large boulder came loose and he fell at least 160 feet while descending Capitol Peak.

He and his partner were on a ridge between Daly Saddle and K2 that is often mistaken for the standard route.'),
('a273aa1f','p','Ann Noyes Fowler, a 39-year-old female, tragically lost her life alongside Edward H. Hilliard when a dislodged rock sent them falling down a couloir near the top of North Maroon Peak.'),
('a455a64b','r','Forest Ketring, a male, tragically lost his life in an accident on Longs Peak; the details were not recorded.'),
('a5238fde','r','Kathleen Bartlett, a 31-year-old female, tragically lost her life after being struck by lightning above treeline near the Denny Creek Trail on Mount Yale.'),
('a6390932','r','Patrick David Niedringhaus, an 18-year-old male, tragically lost his life in an avalanche near Kelso Ridge while retreating from a winter attempt on Torreys Peak.'),
('a6516225','r','Jens “Jay” Yambert, a 60-year-old male from Urbana, Illinois, tragically lost his life in an apparent 200-foot fall on Longs Peak.'),
('a97a32ad','r','Philip Gahn, a male, tragically lost his life while descending Andrews Glacier in Rocky Mountain National Park; the nature of the accident is unknown.'),
('ac2ae1f7','r','Ryan Torpey, a 31-year-old male, tragically lost his life after falling down a steep cliff face near the exposed West Ridge and Monte Cristo Couloir area of Quandary Peak.

He was reported missing on August 6, 2008, and his body was recovered the next day.'),
('ad2c1102','r','Jadyn Weiss, a 21-year-old female from Severance, Colorado, tragically lost her life after a 300-foot fall in the Flying Dutchman Couloir, between Longs Peak and Mount Meeker.'),
('ad30a6d4','r','Stephen Hunt, a 55-year-old male, tragically lost his life in a 100-foot fall on Crestone Needle.'),
('ad8a6ffd','r','Mark A. Golden, a 31-year-old male, tragically lost his life after falling roughly 2,000 feet while apparently attempting a shortcut on the descent of Snowmass Mountain.'),
('adaa1c9c','r','Frank Stryker, a male in his 20s, tragically lost his life on the Homestretch of Longs Peak''s Keyhole Route when a loaded pistol fell from his pocket and discharged into his neck.'),
('ae0dc942','r','An unnamed climber tragically lost their life when a severe rockslide on the west face of Capitol Peak, near K2, swept them about 300 feet.

Their climbing partner witnessed the accident and reported it.'),
('aec05e1f','r','An unnamed male skier tragically lost his life in an avalanche that killed three skiers traversing from the Pearl Pass area toward Castle Peak.

Kristyne “Teeny” H. Jeung and a second man were also killed.'),
('af22a569','r','Kristin Kirkley, a 26-year-old, tragically lost their life when the private plane they were aboard struck Wilson Peak just below the summit on a flight to Telluride.

All four people aboard the Beech 35-C33 were killed.'),
('af5b9b33','r','Paris Walkup, a 22-year-old male, tragically lost his life in a rockslide at Agnes Vaille Falls, below Mount Princeton.

Five people were killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon, below Mount Princeton.'),
('af89e34b','r','Michael Lepold, a 52-year-old male, tragically lost his life in a fall while descending Challenger Point alone, shortly after calling his wife from the summit.

Climbers later spotted his body on a ledge above the bowl, and a helicopter lifted him off the mountain after a multi-day operation.'),
('afe6f9ae','r','An unnamed male tragically lost his life in a fall on Castle Peak.'),
('b07aade9','r','Peter Jeffris, a 25-year-old male, tragically lost his life to hypothermia after setting out for the summit of Longs Peak in wintry late-season weather.

He was found 200 feet below the Keyhole Route.'),
('b143afe6','r','John Ashby, a 28-year-old male, tragically lost his life in an unroped fall down Alexander''s Chimney and Lamb''s Slide on Longs Peak.'),
('b488bfe0','r','Kevin Massey, a 55-year-old male, tragically lost his life after suffering a heart attack on a short hike in the Devil''s Playground area of Pikes Peak.

He was visiting by way of the Pikes Peak Highway; despite efforts to help him, he died on the mountain.'),
('b4ae9ca2','r','Mary Elizabeth Bowles, a 50-year-old female, tragically lost her life in a fall from the Sawtooth Ridge between Mount Bierstadt and Mount Blue Sky.

Rescuers said her party had recognized they were ill-equipped for the terrain and were turning back when she fell.'),
('b538145d','r','Jeffry Deardorff, a male aged 60 or older from Hartsel, Colorado, tragically lost his life after falling about 1,000 feet while descending Crestone Needle toward Cottonwood Lake.

His body was found on September 27, 2020.'),
('b737e418','r','Willis A. Skinner, a 55-year-old male, tragically lost his life to exposure and exhaustion half a mile below the summit of Pikes Peak after he and Sallie Skinner, 45, were caught in a severe summer blizzard.

The couple set out to hike the mountain along the Cog Railway route at the height of tourist season, ignoring warnings about a sudden change in the weather. They were unprepared for the storm, and their bodies were found side by side the next day beneath a foot of fresh snow.'),
('ba546330','r','Jarod S. Wetherell, a 37-year-old male from Vail, tragically lost his life in a fall after going off route while descending North Maroon Peak, having traversed from South Maroon Peak.

His companion, David Richardson, was rescued.'),
('bad5775f','r','John Arthur Merrill, a 30-year-old male from Cortez, tragically lost his life when falling rock crushed him on the south face of El Diente Peak while he was climbing alone with his dog.

His dog, an Alaskan malamute mix, stayed by his side until rescuers arrived the next day. He died in nearly the same place as Peter Topp, exactly two months later.'),
('be60c176','r','Jeffrey Bushroe, a male in his 20s from Tucson, Arizona, tragically lost his life to hypothermia after a fall in the Grand Couloir on the Maroon Bells left him with a head injury.'),
('be7f912a','r','Rudolf Postweiler, a 48-year-old male, tragically lost his life after suffering a heart attack on the Chasm Lake Trail below Longs Peak.'),
('c34a67a8','r','Rich Buzzelli, a male in his 30s, tragically lost his life after being struck by lightning on Pikes Peak.'),
('c36fa9ee','r','Duane Buhrmester, a 57-year-old male, tragically lost his life alongside his wife, Linda, when a violent thunderstorm triggered a rock and mudslide that swept them from the Ellingwood Arête area of Crestone Needle.

The couple from Texas fell about 500 feet and were carried another 300 feet by the debris flow, which buried them. They had climbing rope with them, though it is unknown whether they were roped in; the force of the storm may have overwhelmed any protection. Their bodies were found on August 1, 2010.'),
('c3c233b5','r','Robert Lyon Spurr, a male aged 57 or 58, tragically lost his life after losing his footing early in the descent of North Maroon Peak and falling roughly 250 to 500 feet.'),
('c4a6ea2a','r','Eric A. Poehlmann, a 46-year-old male, tragically lost his life after suffering a heart attack near the summit of Mount Harvard.

His death shows how altitude and exertion can worsen pre-existing health conditions, whether or not a climber knows about them.'),
('c699139c','r','An unnamed driver tragically lost their life when their vehicle rolled several times at Jaws 2 on the Lake Como Road below Blanca Peak.

Both occupants were ejected; the passenger survived.'),
('c7c3ce72','r','Madeline Baharlou-Quivey, a 29-year-old female from Denver, tragically lost her life in an accidental fall in Class 5 terrain below the standard route on Kit Carson Peak.

She texted for help on October 11, 2021, and was found on October 13.'),
('c7fbb6a1','r','An unnamed male climber tragically lost his life when lightning struck three climbers near the summit of Capitol Peak, killing him and injuring the other two.'),
('c8b39b97','r','Dr. Sterling Smith, a 66-year-old, tragically lost their life after falling more than 300 feet while descending South Maroon Peak at about 12,800 feet.'),
('c9a3aba8','r','Christopher Thomas, a 39-year-old male, tragically lost his life when an avalanche buried him under 4 feet of snow while backcountry skiing south of Kelso Mountain, on the approach to Torreys Peak.

His two partners located him within 15 to 20 minutes, but it was too late.'),
('c9f1c025','r','John Bramley, a 55-year-old male, tragically lost his life in a severe fall on the north face of Longs Peak, below the False Keyhole, during a solo hike.

Searchers found his body the morning after he failed to return.'),
('ca6e45d7','r','Deanna Miller, a 30-year-old female, tragically lost her life when a boulder she was sheltering under during a lightning storm toppled and crushed her as she descended Mount Princeton.

She and a coworker had reached the summit at 12:30 p.m. and left the trail to take cover when the storm hit.'),
('cb95fafe','r','David Law, a male aged 60 or older from Casper, Wyoming, tragically lost his life after suffering a heart attack on Quandary Peak.'),
('cc40ae1c','r','Rachel Dewey, a female in her 40s from Colorado Springs, tragically lost her life in a fall while skiing down a couloir on Pikes Peak.'),
('ce36361d','r','Gene George, a 64-year-old male hiking solo, tragically lost his life in the Mount Harvard and Mount Columbia area; how he died is unknown.

He was last heard from on September 18, 2013, and is believed to have reached the summit of Mount Columbia the next day. A four-day search found no clues. On March 23, 2014, a hiker came across his wallet and clothing in thick brush about a quarter mile off the trail between the two peaks.'),
('ceeb35d6','r','Don Ward, a 55-year-old male, tragically lost his life on Mount Cameron; a cardiac event is suspected, but no cause has been certified.'),
('d008666e','r','John James Coffee, a 21-year-old male from Arizona, tragically lost his life after falling about 800 feet from the Organ Pipes section of the traverse between El Diente Peak and Mount Wilson.'),
('d119ec5b','r','Kiowa-Rain Johnson, an 18-year-old female, tragically lost her life in a rockslide at Agnes Vaille Falls, below Mount Princeton.

Five people were killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon, below Mount Princeton.'),
('d195dbe2','r','Dr. James Clarke “Jamie” Rupp, a 54-year-old male from Douglas, Wyoming, tragically lost his life in a fall of several hundred feet while climbing Challenger Point.'),
('d418c8db','r','Steve Sprowles, a 68-year-old male, tragically lost his life in a fall on North Maroon Peak.'),
('d66ac696','r','Robley Heninger, a 59-year-old, tragically lost their life at the summit of Pikes Peak; police described the death as non-suspicious, and no cause has been made public.'),
('d7504faa','r','Jesse Kitts, a 36-year-old male banker from Greeley, tragically lost his life when lightning struck near the summit cairn of Longs Peak.'),
('d75c3c7b','r','An unnamed male skier tragically lost his life in an avalanche that killed three skiers traversing from the Pearl Pass area toward Castle Peak.

Kristyne “Teeny” H. Jeung and a second man were also killed.'),
('d7a1fcd2','r','Dr. Herbert Ungnade, a 54-year-old male, tragically lost his life when the rope team he was leading fell in a steep snow couloir on South Maroon Peak.

To save time, three members of the four-man party climbed simultaneously while one belayed. When one climber slipped, he pulled all four into the fall. Bob Day, Frank Pretzel and Herbert Ungnade were killed; the youngest member, William Martin, survived, reportedly thanks to the construction hard hat he was wearing.'),
('d7d3ea69','r','Staff Sergeant Chad A. Tucker, a 28-year-old male soldier, tragically lost his life in an Army MH-60K helicopter crash on Mount Massive.

Four soldiers were killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training.'),
('d803fcd1','r','Kyle Fitzpatrick, a 22-year-old male, tragically lost his life in a wet-slab avalanche while glissading down La Plata Peak after reaching the summit.

His two companions survived, and his body was recovered the next day.'),
('d831c75d','r','John Howard Burns, a male aged 66 or 67 from Nebraska, tragically lost his life in a fall while descending Crestone Needle after completing the traverse from Crestone Peak.'),
('d9c157c6','r','Henry J. Bresciani, a 67-year-old male race official from Colorado Springs, tragically lost his life when a car struck him while he served as the finish-line flagman at the summit during practice for the Pikes Peak Hill Climb.'),
('d9c519e3','r','David Worthington, a 38-year-old male known as “Talus Monkey” on the 14ers forum, tragically lost his life after slipping on ice and snow while glissading without an ice axe and tumbling 200 feet down a cliff on Humboldt Peak.

He initially survived his injuries but later died in the hospital.'),
('da648e4b','r','Arthur Gallager, a 21-year-old male Yale student from Colorado Springs, tragically lost his life after slipping from a ledge and sliding into a rock slide while descending Snowmass Mountain.'),
('da7714b9','r','Erling Hansen, a 69-year-old male, tragically lost his life in a fall while descending El Diente Peak, the summit that completed his list of all 54 Colorado fourteeners.'),
('dc708738','r','Raymond G. "Ray" Northcutt, a male climber, tragically lost his life in a fall while attempting a technical route on the East Face of Longs Peak.'),
('dcbdd805','r','Baigen Walker, a 10-year-old male, tragically lost his life in a rockslide at Agnes Vaille Falls, below Mount Princeton.

Five people were killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon, below Mount Princeton.'),
('dd282d3a','r','Russell Hardy, a 55-year-old male, tragically lost his life after being caught in severe weather while descending Pikes Peak on a climb from the Crags Trailhead.

He died on or around June 11, 2025, and his body was found near the summit.'),
('dd365b79','r','Gary McCall, a 49-year-old male Flight for Life pilot, tragically lost his life when his rescue helicopter crashed on Huron Peak.

Flight nurse Sandy Sigman was also killed. The rescue association''s account attributes the crash to rotor contact with terrain.'),
('dd723a3a','p','Private William R. Rooney tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('df1829ab','r','Joel Levenberg, a 38-year-old male, tragically lost his life after triggering a slab avalanche while skiing down the east face of Torreys Peak and being swept about 1,000 vertical feet through rocky terrain.

He was alive when rescuers reached him at about 12,800 feet, but winds over 50 mph and whiteout conditions prevented an airlift, and he died on the mountain from his injuries that evening.'),
('df2902ae','r','Justin Seagren, a male in his 30s from Sheboygan, Wisconsin, tragically lost his life after falling several hundred feet near the Blanca–Ellingwood saddle while descending Blanca Peak''s standard route.'),
('e00f2d51','r','Reynold E. “Pete” Isto, aged 50 or 51, tragically lost their life in a fall on South Maroon Peak.

Sources disagree on the date: an AAC obituary gives August 23, 1965, and an AAC accident index lists August 27.'),
('e075a6de','r','Robert Michael von Gortler, a 53-year-old male, tragically lost his life alongside his 20-year-old daughter, Makana, in an apparent fall on Missouri Mountain.

Both had head and neck trauma consistent with a fall. After a five-day search, helicopters spotted them off trail, about 500 feet above the main trail at 12,000 feet.'),
('e17189a7','r','Gerald Murphy, a 51-year-old male, tragically lost his life after suffering a heart attack on Longs Peak.'),
('e2a12ee9','r','Jesse Peterson, a 27-year-old male, tragically lost his life when his canoe overturned in high winds on Willow Lake below Challenger Point; he is presumed to have drowned.

His companion, Natalie Brechtel, reached shore with hypothermia.'),
('e2e8e11a','r','Carl E. Niggemyer, a 21-year-old miner, tragically lost their life in a blast at Day Mines Inc.''s Sherman Tunnel on Mount Sherman.'),
('e4756f42','r','Lawrence N. Gang, a 53-year-old male, tragically lost his life on a Mount Bierstadt outing; his body was found in the Evans–Bierstadt area.

The exact route and cause of death have not been established.'),
('e4c2c89e','r','James Flanagin, a 25-year-old, tragically lost their life when the private plane they were aboard struck Wilson Peak just below the summit on a flight to Telluride.

All four people aboard the Beech 35-C33 were killed.'),
('e62e8c4e','r','Frazee Waltman, an 18-year-old male, tragically lost his life when the storm''s first lightning flash struck him near the Golden Staircase, about 100 feet below the summit of Pikes Peak.

* Source: https://extras.denverpost.com/news/news0726a.htm'),
('e69fa050','r','Richard Alan Cole, a 19-year-old male, tragically lost his life in a long fall down a steep hard-snow gully on North Maroon Peak after he slipped and pulled his rope team off their feet.

Ronald Earl Fjeseth was also killed; Joe Fullop survived.'),
('e719c7fd','r','Martina, a 25-year-old female whose surname is unknown, tragically lost her life when lightning struck her on the Willow Creek Trail after she climbed Kit Carson Peak and Challenger Point.

Her husband was also struck but survived.'),
('e8fecb19','r','Prince D. Willmon, a 23-year-old male, tragically lost his life in a fall on the East Face of Longs Peak alongside David L. Jones after their party was caught in a severe spring storm.

Jane R. Bendixen, the third member of the party, survived.'),
('e937721b','r','Raymond Decker, a 75-year-old male, tragically lost his life after slipping on ice and falling from the Narrows on Longs Peak''s Keyhole Route.'),
('eccb728c','r','James Dean Mills, a male climber from Texas, tragically lost his life after stumbling off the standard route while descending Blanca Peak and falling an estimated 500 to 1,000 feet.

His brother, who was climbing with him, believes a gust of wind knocked him off balance. Searchers on foot and by helicopter found no trace of him, and the search ended after five days. Ten years later, two descending climbers found his remains wedged against the rocks, along with a tattered backpack holding his Texas driver''s license.'),
('ed328786','p','Airman First Class William R. Carpenter tragically lost his life when a U.S. Air Force C-47 transport crashed into the north face of Mount Yale, killing all 12 people on board.'),
('ee33dbe5','r','John Boyles, a 52-year-old male, tragically lost his life after taking a wrong turn into an avalanche chute while descending Little Bear Peak ahead of a thunderstorm and falling about 500 feet.

He was descending with his son.'),
('ee945231','r','Andy Haberkorn, a 28-year-old male, tragically lost his life after being struck by lightning near the top of the Casual Route on the Diamond of Longs Peak.'),
('f5b77445','r','Wallace Coleman, a male race driver, tragically lost his life after he was injured during a practice run for the Pikes Peak Hill Climb.'),
('f5e9806b','r','Benjamin Russell Hebb, a 26-year-old male, tragically lost his life after falling about 800 feet down a chimney from Broadway Ledge while rope-soloing the Dunn-Westbay route on the Diamond of Longs Peak.

He had a helmet and all the appropriate gear, but park officials who witnessed the fall said he was unroped at the time, which is common for experienced climbers in that spot.'),
('f5fb3b5a','r','Michelle Vanek, a 35-year-old female, tragically lost her life on Mount of the Holy Cross after becoming separated from her climbing partner and descending a steep couloir while trying to return to the trailhead.

Her remains were found in 2024. She likely died from a fall, exposure, or both.'),
('f69d0d27','r','Staff Sergeant Paul R. Jackson, a 33-year-old male soldier, tragically lost his life in an Army MH-60K helicopter crash on Mount Massive.

Four soldiers were killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training.'),
('f7783a72','r','Chief Warrant Officer 4 Robert M. Johnson, a 41-year-old male soldier, tragically lost his life in an Army MH-60K helicopter crash on Mount Massive.

Four soldiers were killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training.'),
('f8c419b4','r','Damian McManus, a male aged 51 or 52, tragically lost his life alongside his son, Evan, on an attempted hike in the Echo Lake and Vance Creek area of Mount Blue Sky (Mount Evans).

Their remains were found in July 2014. They were last heard from on April 2, 2014, but the date and cause of death have not been established.'),
('fac4b8b2','r','Lewis B. “Lew” Covert, a 28-year-old, tragically lost their life when struck by falling rock on South Maroon Peak while helping Colorado Outward Bound students.'),
('fb4937b9','r','Cameron Tague, a 32-year-old male, tragically lost his life after slipping on loose rock and falling 800 feet over the Lower East Face of Longs Peak onto Mills Glacier.

An outstanding climber with about 30 ascents of routes on the Diamond, including a new route, Tague was climbing unroped on a band of rotten fourth-class rock at the base of the Yellow Wall, looking for a belay on better rock. He was moving fast to finish the route before the afternoon lightning storms arrived.'),
('fb5596ac','r','Brian Perri, a male in his 30s from Fort Collins, tragically lost his life after a fall on Mount Meeker, beside Longs Peak.'),
('fd861653','r','Kaden Sites, a 27-year-old male, tragically lost his life near Tabeguache Creek on the slopes of Mount Shavano.

He went missing while hunting alone on April 15, 2026. Volunteer searchers found him on April 25, about 1.5 miles from where he had left his truck.'),
('fdc4ad5c','r','Spencer James Nelson, a 20-year-old male student athlete at the University of Colorado, tragically lost his life when a dislodged rock struck him and knocked him 600 feet down the Bell Cord Couloir during the Maroon Bells traverse.

He was climbing with a group of eight that included his father, Peter Nelson, and was wearing a helmet. The rock is believed to have been knocked loose by a member of his own party.'),
('fdd97566','r','Bret Brachman-Goldstein, a 32-year-old male from Montrose, tragically lost his life in a suspected fall on Mount Sneffels.'),
('ff1a8d4e','r','Daniel Paul Wallick, a 41-year-old male from Houston, tragically lost his life after reaching the summits of both Challenger Point and Kit Carson Peak; how he died is unclear.

He texted his family from the summits and was last heard from on July 24, 2019. His body was recovered on July 28.');

do $$
declare n int; bad text;
begin
  -- every rewrite must point at exactly one approved record
  select string_agg(id8 || ' (' || cnt || ')', ', ') into bad from (
    select w.id8, (select count(*) from incidents i where i.status = 'approved' and left(i.id::text, 8) = w.id8) cnt
    from _notes_rewrite w) x where cnt <> 1;
  if bad is not null then raise exception 'Rewrites not matching exactly one record: %', bad; end if;

  -- every approved record that has a note must have a rewrite
  select string_agg(left(i.id::text, 8) || ' ' || coalesce(i.climber_name, '(unnamed)'), ', ') into bad
  from incidents i
  where i.status = 'approved' and btrim(coalesce(i.incident_details, '')) <> ''
    and not exists (select 1 from _notes_rewrite w where w.id8 = left(i.id::text, 8));
  if bad is not null then raise exception 'Records with notes but no rewrite: %', bad; end if;

  -- move the confidential witness message off the public page
  update incidents i set reviewer_notes = coalesce(i.reviewer_notes || E'\n\n', '')
      || 'Original public note, moved Oct 2026 because it was a private message marked confidential:' || E'\n\n'
      || split_part(i.incident_details, E'\n\n* Correction:', 1)
  where i.status = 'approved' and left(i.id::text, 8) = '64f6e165';
  get diagnostics n = row_count; if n <> 1 then raise exception 'Sikes reviewer_notes update matched % rows', n; end if;

  -- rewritten notes (keep research / source list at the bottom)
  update incidents i set incident_details = w.txt || coalesce(E'\n\n' || substring(i.incident_details from E'\n\n(\\* (?:Correction|Location|Age|Notes|Confidence|Sources|Review): [\\s\\S]*)$'), '')
  from _notes_rewrite w
  where i.status = 'approved' and left(i.id::text, 8) = w.id8 and w.mode = 'r';
  get diagnostics n = row_count; if n <> 230 then raise exception 'rewrites updated % rows (expected 230)', n; end if;

  -- long narratives: new lead sentence on top, narrative kept
  update incidents i set incident_details = w.txt || E'\n\n'
      || replace(i.incident_details, E'Colorado, La Plata Peak\nPublication Year: 1961.\n', '')
  from _notes_rewrite w
  where i.status = 'approved' and left(i.id::text, 8) = w.id8 and w.mode = 'p';
  get diagnostics n = row_count; if n <> 21 then raise exception 'lead sentences updated % rows (expected 21)', n; end if;

  -- empty notes on unnamed records: sentence from the record's fields
  update incidents i set incident_details = 'An unnamed ' || case i.gender when 'M' then 'male ' when 'F' then 'female ' else '' end || 'climber' || case i.age when '<20' then ' under the age of 20' when '60+' then ' aged 60 or older'
            when '20-29' then ' in '||case i.gender when 'M' then 'his' when 'F' then 'her' else 'their' end||' 20s' when '30-39' then ' in '||case i.gender when 'M' then 'his' when 'F' then 'her' else 'their' end||' 30s'
            when '40-49' then ' in '||case i.gender when 'M' then 'his' when 'F' then 'her' else 'their' end||' 40s' when '50-59' then ' in '||case i.gender when 'M' then 'his' when 'F' then 'her' else 'their' end||' 50s' else '' end || ' tragically lost ' || case i.gender when 'M' then 'his' when 'F' then 'her' else 'their' end || ' life' || case i.cause
            when 'Fall' then ' in a fall on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'.'
            when 'Falling rock/ice' then ' after being struck by falling rock on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'.'
            when 'Avalanche' then ' in an avalanche on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'.'
            when 'Cardiac event' then ' after suffering a cardiac event on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'.'
            when 'Lightning' then ' after being struck by lightning on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'.'
            when 'Weather exposure' then ' to exposure on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'.'
            else ' on '||case i.mountain when 'Maroon Bells' then 'the Maroon Bells' when 'Mount Evans' then 'Mount Blue Sky (Mount Evans)' else i.mountain end||'; the circumstances of '||case i.gender when 'M' then 'his' when 'F' then 'her' else 'their' end||' death were not documented.' end
  where i.status = 'approved' and btrim(coalesce(i.incident_details, '')) = ''
    and not exists (select 1 from _notes_rewrite w where w.id8 = left(i.id::text, 8));
  get diagnostics n = row_count;
  raise notice 'generated % notes for empty records', n;

  -- Brandsma data fix
  update incidents set cause = 'Cardiac event', age = '60+'
  where status = 'approved' and climber_name = 'Maynard Grant Brandsma' and cause = 'Cardiac' and age = '61';
  get diagnostics n = row_count; if n <> 1 then raise exception 'Brandsma fix matched % rows', n; end if;

  -- sex confirmed by sources (explicit pronouns or words like father, sister, woman)
  update incidents i set gender = v.g
  from (values ('ad2c1102','F'),('43fad6a7','F'),('d119ec5b','F'),
               ('25cc83cc','M'),('da648e4b','M'),('e8fecb19','M'),('62c9d99f','M'),('c3c233b5','M'),
               ('d7504faa','M'),('70d06d02','M'),('ceeb35d6','M'),('ba546330','M'),('48862d55','M'),
               ('161f07ef','M'),('dcbdd805','M'),('af5b9b33','M')) v(id8, g)
  where i.status = 'approved' and left(i.id::text, 8) = v.id8;
  get diagnostics n = row_count; if n <> 16 then raise exception 'sex updates matched % rows (expected 16)', n; end if;

  -- probable duplicate of Drew Sikes: hide it, keep the row
  update incidents set status = 'rejected', reviewed_at = now(),
      reviewer_notes = coalesce(reviewer_notes || E'\n\n', '') || 'Rejected Oct 2026: probable duplicate of Andrew Tyler "Drew" Sikes (Castle Peak fall, 9/6/2026).'
  where status = 'approved' and left(id::text, 8) = 'afe6f9ae' and climber_name is null and mountain = 'Castle Peak' and year = 2026;
  get diagnostics n = row_count; if n <> 1 then raise exception 'duplicate rejection matched % rows', n; end if;

  -- nothing left empty or in the old shorthand
  select count(*) into n from incidents where status = 'approved' and btrim(coalesce(incident_details, '')) = '';
  if n <> 0 then raise exception '% approved records still have empty notes', n; end if;
end $$;

drop table _notes_rewrite;

select count(*) filter (where status = 'approved') as approved,
       count(*) filter (where status = 'approved' and (incident_details ~ '\m[0-9]+ yo [MF]\M' or incident_details like 'Additional information:%')) as old_shorthand_left
from incidents;

-- Spot check a few:
-- select climber_name, split_part(incident_details, E'\n\n', 1) from incidents
-- where climber_name in ('Charles W. Thiemeyer', 'David L. Jones', 'Agnes Vaille', 'Kevin Massey');
