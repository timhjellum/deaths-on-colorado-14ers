-- =====================================================================
-- 14er-deaths.com  |  Bulk additions, edits and removals
-- Source: "14er-deaths — Additions, Edits and Removals" (Reconciliation
--         Master, Pass 47, reviewed Oct 6, 2026)
-- Generated Oct 6, 2026
--
--   54 additions   (new approved incidents)
--   122 edits       (corrections + research notes appended to the story)
--   4 removals    (archived to incidents_removed, then deleted)
--
-- HOW TO RUN (Supabase dashboard > SQL Editor):
--   1. Run STEP 1 by itself. Every row should say matches = 1.
--      Fix any that don't before going on.
--   2. Run STEP 2 (everything below it) in one go. It is all-or-nothing:
--      if any edit/removal doesn't match exactly one row, nothing is saved.
--   3. It refuses to run twice (the backup table already exists), so
--      additions can't be duplicated by accident.
--
-- UNDO: the full table is copied to incidents_backup_20261006 first.
-- Holds and exclusions from the review are NOT included.
-- =====================================================================

-- ---------------------------------------------------------------------
-- STEP 1  (read-only check: run this alone first)
-- ---------------------------------------------------------------------
select label, matches from (values
  ('Removal 1: Jane R. Bendixen', (select count(*) from incidents where climber_name = 'Jane R. Bendixen' and mountain = 'Longs Peak' and year = '1960')),
  ('Removal 2: James Pruitt', (select count(*) from incidents where climber_name = 'James Pruitt' and mountain = 'Longs Peak' and year = '2019')),
  ('Removal 3: David Cook', (select count(*) from incidents where climber_name = 'David Cook' and mountain = 'Maroon Bells' and year = '2016')),
  ('Removal 4: Bryan Ludwig', (select count(*) from incidents where climber_name = 'Bryan Ludwig' and mountain = 'Crestone Peak' and year = '2021')),
  ('Edit 1: Agnes Vaille', (select count(*) from incidents where climber_name = 'Agnes Vaille' and mountain = 'Longs Peak' and year = '1925')),
  ('Edit 2: Herbert Sortland', (select count(*) from incidents where climber_name = 'Herbert Sortland' and mountain = 'Longs Peak' and year = '1925')),
  ('Edit 3: David L. Jones', (select count(*) from incidents where climber_name = 'David L. Jones' and mountain = 'Longs Peak' and year = '1960')),
  ('Edit 4: Cameron Tangue', (select count(*) from incidents where climber_name = 'Cameron Tangue' and mountain = 'Longs Peak' and year = '2000')),
  ('Edit 5: Paul Nahon', (select count(*) from incidents where climber_name = 'Paul Nahon' and mountain = 'Longs Peak' and year = '2013')),
  ('Edit 6: Brian Perri', (select count(*) from incidents where climber_name = 'Brian Perri' and mountain = 'Longs Peak' and year = '2018')),
  ('Edit 7: Jen "Jay" Yambert', (select count(*) from incidents where climber_name = 'Jen "Jay" Yambert' and mountain = 'Longs Peak' and year = '2018')),
  ('Edit 8: Jadyn Weiss', (select count(*) from incidents where climber_name = 'Jadyn Weiss' and mountain = 'Longs Peak' and year = '2023')),
  ('Edit 9: Debra Stith', (select count(*) from incidents where climber_name = 'Debra Stith' and mountain = 'Longs Peak' and year = '2025')),
  ('Edit 10: Jeffrey Carlin', (select count(*) from incidents where climber_name = 'Jeffrey Carlin' and mountain = 'Longs Peak' and year = '2026')),
  ('Edit 11: Wallace Coleman', (select count(*) from incidents where climber_name = 'Wallace Coleman' and mountain = 'Pikes Peak' and year = '1921')),
  ('Edit 12: Bill Gross Jr.', (select count(*) from incidents where climber_name = 'Bill Gross' and mountain = 'Pikes Peak' and year = '1982')),
  ('Edit 13: —', (select count(*) from incidents where climber_name is null and mountain = 'Pikes Peak' and year = '2000' and month = '7' and day = '26' and cause = 'Lightning')),
  ('Edit 14: Ralph Chandler Bruning Jr.', (select count(*) from incidents where climber_name = 'Ralph Chandler Bruning Jr.' and mountain = 'Pikes Peak' and year = '2001')),
  ('Edit 15: Henry J. Bresciani', (select count(*) from incidents where climber_name = 'Henry J. Bresciani' and mountain = 'Pikes Peak' and year = '2005')),
  ('Edit 16: Bobby Goodin', (select count(*) from incidents where climber_name = 'Bobby Goodin' and mountain = 'Pikes Peak' and year = '2014')),
  ('Edit 17: Carl Sorensen', (select count(*) from incidents where climber_name = 'Carl Sorensen' and mountain = 'Pikes Peak' and year = '2015')),
  ('Edit 18: Rebecca Maxfield', (select count(*) from incidents where climber_name = 'Rebecca Maxfield' and mountain = 'Pikes Peak' and year = '2018')),
  ('Edit 19: Carlin Dunne', (select count(*) from incidents where climber_name = 'Carlin Dunne' and mountain = 'Pikes Peak' and year = '2019')),
  ('Edit 20: Kevin Massey', (select count(*) from incidents where climber_name = 'Kevin Massey' and mountain = 'Pikes Peak' and year = '2019')),
  ('Edit 21: Frank Pretzel', (select count(*) from incidents where climber_name = 'Frank Pretzel' and mountain = 'Maroon Bells' and year = '1965')),
  ('Edit 22: Herbert Ungnade', (select count(*) from incidents where climber_name = 'Herbert Ungnade' and mountain = 'Maroon Bells' and year = '1965')),
  ('Edit 23: Bob Day', (select count(*) from incidents where climber_name = 'Bob Day' and mountain = 'Maroon Bells' and year = '1965')),
  ('Edit 24: Richard Alan Cole', (select count(*) from incidents where climber_name = 'Richard Alan Cole' and mountain = 'Maroon Bells' and year = '1967')),
  ('Edit 25: Ann Noyes Fowler', (select count(*) from incidents where climber_name = 'Ann Noyes Fowler' and mountain = 'Maroon Bells' and year = '1971')),
  ('Edit 26: Beatrice Venice Sawyer', (select count(*) from incidents where climber_name = 'Beatrice Venice Sawyer' and mountain = 'Maroon Bells' and year = '1975')),
  ('Edit 27: Spencer James Nelson', (select count(*) from incidents where climber_name = 'Spencer James Nelson' and mountain = 'Maroon Bells' and year = '2010')),
  ('Edit 28: Lenny Joyner', (select count(*) from incidents where climber_name = 'Lenny Joyner' and mountain = 'Maroon Bells' and year = '2012')),
  ('Edit 29: Derek Kelley', (select count(*) from incidents where climber_name = 'Derek Kelley' and mountain = 'Maroon Bells' and year = '2012')),
  ('Edit 30: —', (select count(*) from incidents where climber_name is null and mountain = 'Maroon Bells' and year = '2014' and month = '10' and day is null and cause = 'Fall')),
  ('Edit 31: Jeffrey Bushroe', (select count(*) from incidents where climber_name = 'Jeffrey Bushroe' and mountain = 'Maroon Bells' and year = '2017')),
  ('Edit 32: Rei Hwa Lee', (select count(*) from incidents where climber_name = 'Rei Hwa Lee' and mountain = 'Maroon Bells' and year = '2017')),
  ('Edit 33: James Hasse', (select count(*) from incidents where climber_name = 'James Hasse' and mountain = 'Maroon Bells' and year = '2019')),
  ('Edit 34: Jason Buehler', (select count(*) from incidents where climber_name = 'Jason Buehler' and mountain = 'Maroon Bells' and year = '2020')),
  ('Edit 35: Jimi Flowers', (select count(*) from incidents where climber_name = 'Jimi Flowers' and mountain = 'Capitol Peak' and year = '2009')),
  ('Edit 36: Ryan Joseph Palmer', (select count(*) from incidents where climber_name = 'Ryan Joseph Palmer' and mountain = 'Capitol Peak' and year = '2013')),
  ('Edit 37: Jim Nelson', (select count(*) from incidents where climber_name = 'Jim Nelson' and mountain = 'Capitol Peak' and year = '2014')),
  ('Edit 38: Jake Lord', (select count(*) from incidents where climber_name = 'Jake Lord' and mountain = 'Capitol Peak' and year = '2017')),
  ('Edit 39: Jeremy Shull', (select count(*) from incidents where climber_name = 'Jeremy Shull' and mountain = 'Capitol Peak' and year = '2017')),
  ('Edit 40: Ryan Marcil', (select count(*) from incidents where climber_name = 'Ryan Marcil' and mountain = 'Capitol Peak' and year = '2017')),
  ('Edit 41: Carlin “Carly” Brightwell', (select count(*) from incidents where climber_name = 'Carlin “Carly” Brightwell' and mountain = 'Capitol Peak' and year = '2017')),
  ('Edit 42: Zackaria White', (select count(*) from incidents where climber_name = 'Zackaria White' and mountain = 'Capitol Peak' and year = '2017')),
  ('Edit 43: Kelly McDermott', (select count(*) from incidents where climber_name = 'Kelly McDermott' and mountain = 'Capitol Peak' and year = '2021')),
  ('Edit 44: Sarah Beechler', (select count(*) from incidents where climber_name = 'Sarah Beechler' and mountain = 'Capitol Peak' and year = '2022')),
  ('Edit 45: Linda M. Pryor', (select count(*) from incidents where climber_name = 'Linda M. Pryor' and mountain = 'Crestone Needle' and year = '2008')),
  ('Edit 46: Duane Buhrmester', (select count(*) from incidents where climber_name = 'Duane Buhrmester' and mountain = 'Crestone Needle' and year = '2010')),
  ('Edit 47: Linda Buhrmester', (select count(*) from incidents where climber_name = 'Linda Buhrmester' and mountain = 'Crestone Needle' and year = '2010')),
  ('Edit 48: Chris Gray', (select count(*) from incidents where climber_name = 'Chris Gray' and mountain = 'Crestone Peak' and year = '2012')),
  ('Edit 49: Christopher Kiryluk', (select count(*) from incidents where climber_name = 'Christopher Kiryluk' and mountain = 'Crestone Peak' and year = '2015')),
  ('Edit 50: Dr. Matthew Davis', (select count(*) from incidents where climber_name = 'Dr. Matthew Davis' and mountain = 'Crestone Needle' and year = '2015')),
  ('Edit 51: Jeffry Deardorff', (select count(*) from incidents where climber_name = 'Jeffry Deardorff' and mountain = 'Crestone Needle' and year = '2020')),
  ('Edit 52: Jeremy Fuerst', (select count(*) from incidents where climber_name = 'Jeremy Fuerst' and mountain = 'Crestone Needle' and year = '2021')),
  ('Edit 53: Alexe Mericle', (select count(*) from incidents where climber_name = 'Alexe Mericle' and mountain = 'Crestone Needle' and year = '2022')),
  ('Edit 54: John Howard Burns', (select count(*) from incidents where climber_name = 'John Howard Burns' and mountain = 'Crestone Needle' and year = '2024')),
  ('Edit 55: —', (select count(*) from incidents where climber_name is null and mountain = 'Little Bear Peak' and year = '2006' and month = '7' and day = '2' and cause = 'Fall')),
  ('Edit 56: Lygon Stevens', (select count(*) from incidents where climber_name = 'Lygon Stevens' and mountain = 'Little Bear Peak' and year = '2008')),
  ('Edit 57: Kevin Hayne', (select count(*) from incidents where climber_name = 'Kevin Hayne' and mountain = 'Little Bear Peak' and year = '2010')),
  ('Edit 58: Andrew Graham Perkins', (select count(*) from incidents where climber_name = 'Andrew Graham Perkins' and mountain = 'Little Bear Peak' and year = '2026')),
  ('Edit 59: Don Thurman', (select count(*) from incidents where climber_name = 'Don Thurman' and mountain = 'Kit Carson Peak' and year = '2010')),
  ('Edit 60: Michael Lepold', (select count(*) from incidents where climber_name = 'Michael Lepold' and mountain = 'Kit Carson Peak' and year = '2011')),
  ('Edit 61: Michael Cormier', (select count(*) from incidents where climber_name = 'Michael Cormier' and mountain = 'Kit Carson Peak' and year = '2013')),
  ('Edit 62: Tyler Cline', (select count(*) from incidents where climber_name = 'Tyler Cline' and mountain = 'Kit Carson Peak' and year = '2019')),
  ('Edit 63: Madeline Baharlou', (select count(*) from incidents where climber_name = 'Madeline Baharlou' and mountain = 'Kit Carson Peak' and year = '2021')),
  ('Edit 64: Luis Corkern', (select count(*) from incidents where climber_name = 'Luis Corkern' and mountain = 'Kit Carson Peak' and year = '2022')),
  ('Edit 65: Jesse Peterson', (select count(*) from incidents where climber_name = 'Jesse Peterson' and mountain = 'Challenger Point' and year = '2012')),
  ('Edit 66: Jamie Rupp', (select count(*) from incidents where climber_name = 'Jamie Rupp' and mountain = 'Challenger Point' and year = '2017')),
  ('Edit 67: Dan Wallick', (select count(*) from incidents where climber_name = 'Dan Wallick' and mountain = 'Challenger Point' and year = '2019')),
  ('Edit 68: Herbert "Herb" Martin', (select count(*) from incidents where climber_name = 'Herbert "Herb" Martin' and mountain = 'Mount Wilson' and year = '1950')),
  ('Edit 69: Erling Hansen', (select count(*) from incidents where climber_name = 'Erling Hansen' and mountain = 'El Diente Peak' and year = '1991')),
  ('Edit 70: Peter Topp', (select count(*) from incidents where climber_name = 'Peter Topp' and mountain = 'El Diente Peak' and year = '2010')),
  ('Edit 71: John Merrill', (select count(*) from incidents where climber_name = 'John Merrill' and mountain = 'El Diente Peak' and year = '2010')),
  ('Edit 72: John James Coffee', (select count(*) from incidents where climber_name = 'John James Coffee' and mountain = 'El Diente Peak' and year = '2024')),
  ('Edit 73: Herbert "Hal" Wise Jr', (select count(*) from incidents where climber_name = 'Herbert "Hal" Wise Jr' and mountain = 'Wilson Peak' and year = '2024')),
  ('Edit 74: Heinz Pagels', (select count(*) from incidents where climber_name = 'Heinz Pagels' and mountain = 'Pyramid Peak' and year = '1988')),
  ('Edit 75: David Morano', (select count(*) from incidents where climber_name = 'David Morano' and mountain = 'Pyramid Peak' and year = '2011')),
  ('Edit 76: Steve Gladbach', (select count(*) from incidents where climber_name = 'Steve Gladbach' and mountain = 'Pyramid Peak' and year = '2013')),
  ('Edit 77: Albert Castellano', (select count(*) from incidents where climber_name = 'Albert Castellano' and mountain = 'Snowmass Mountain' and year = '2003')),
  ('Edit 78: Sean A. Wylam', (select count(*) from incidents where climber_name = 'Sean A. Wylam' and mountain = 'Snowmass Mountain' and year = '2011')),
  ('Edit 79: Rob Jansen', (select count(*) from incidents where climber_name = 'Rob Jansen' and mountain = 'Snowmass Mountain' and year = '2012')),
  ('Edit 80: Neil Campbell', (select count(*) from incidents where climber_name = 'Neil Campbell' and mountain = 'Blanca Peak' and year = '1960')),
  ('Edit 81: Michael Levine', (select count(*) from incidents where climber_name = 'Michael Levine' and mountain = 'Blanca Peak' and year = '1986')),
  ('Edit 82: Barney Cruz', (select count(*) from incidents where climber_name = 'Barney Cruz' and mountain = 'Blanca Peak' and year = '2017')),
  ('Edit 83: Vaughn Fetzer', (select count(*) from incidents where climber_name = 'Vaughn Fetzer' and mountain = 'Blanca Peak' and year = '2021')),
  ('Edit 84: Justin Seagren', (select count(*) from incidents where climber_name = 'Justin Seagren' and mountain = 'Blanca Peak' and year = '2022')),
  ('Edit 85: Joy Cipoletti', (select count(*) from incidents where climber_name = 'Joy Cipoletti' and mountain = 'Ellingwood Point' and year = '2020')),
  ('Edit 86: Michelle Vanek', (select count(*) from incidents where climber_name = 'Michelle Vanek' and mountain = 'Mount of the Holy Cross' and year = '2005')),
  ('Edit 87: James Nelson', (select count(*) from incidents where climber_name = 'James Nelson' and mountain = 'Mount of the Holy Cross' and year = '2010')),
  ('Edit 88: Peter Clarke', (select count(*) from incidents where climber_name = 'Peter Clarke' and mountain = 'Mount Sneffels' and year = '2021')),
  ('Edit 89: Bret Brachman-Goldstein', (select count(*) from incidents where climber_name = 'Bret Brachman-Goldstein' and mountain = 'Mount Sneffels' and year = '2026')),
  ('Edit 90: Drew Sikes', (select count(*) from incidents where climber_name = 'Drew Sikes' and mountain = 'Castle Peak' and year = '2026')),
  ('Edit 91: Unnamed', (select count(*) from incidents where climber_name is null and mountain = 'Conundrum Peak' and year = '2023' and month = '7' and day = '29' and cause = 'Avalanche')),
  ('Edit 92: Karl Pfiffner', (select count(*) from incidents where climber_name = 'Karl Pfiffner' and mountain = 'La Plata Peak' and year = '1961')),
  ('Edit 93: Gene George', (select count(*) from incidents where climber_name = 'Gene George' and mountain = 'Mount Harvard' and year = '2013')),
  ('Edit 94: Eric Poehlman', (select count(*) from incidents where climber_name = 'Eric Poehlman' and mountain = 'Mount Harvard' and year = '2016')),
  ('Edit 95: Captain (USN) James Joseph Richardson (copilot) ▸', (select count(*) from incidents where climber_name = 'Captain (USN) James Joseph Richardson (copilot)' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 96: S/Sgt William E. MacKenzie Jr. ▸', (select count(*) from incidents where climber_name = 'S/Sgt William E. MacKenzie Jr.' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 97: Oscar M. Rupert (Civilian) ▸', (select count(*) from incidents where climber_name = 'Oscar M. Rupert (Civilian)' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 98: A1c William R. Carpenter ▸', (select count(*) from incidents where climber_name = 'A1c William R. Carpenter' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 99: Sgt Phillip Lenz ▸', (select count(*) from incidents where climber_name = 'Sgt Phillip Lenz' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 100: Cpt David C. Jacobs ▸', (select count(*) from incidents where climber_name = 'Cpt David C. Jacobs' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 101: 1st Lt David W. Gill ▸', (select count(*) from incidents where climber_name = '1st Lt David W. Gill' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 102: Sp3 William L. Simpson ▸', (select count(*) from incidents where climber_name = 'Sp3 William L. Simpson' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 103: Pvt William R. Rooney ▸', (select count(*) from incidents where climber_name = 'Pvt William R. Rooney' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 104: Colonel Charles Arthur Miller (pilot) ▸', (select count(*) from incidents where climber_name = 'Colonel Charles Arthur Miller (pilot)' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 105: Colonel Frederick W. Ledeboer ▸', (select count(*) from incidents where climber_name = 'Colonel Frederick W. Ledeboer' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 106: Master Sargent Helen M. Schuyler (WAF) ▸', (select count(*) from incidents where climber_name = 'Master Sargent Helen M. Schuyler (WAF)' and mountain = 'Mount Yale' and year = '1956')),
  ('Edit 107: Kathleen Barlett', (select count(*) from incidents where climber_name = 'Kathleen Barlett' and mountain = 'Mount Yale' and year = '2015')),
  ('Edit 108: Jeffrey Pickering', (select count(*) from incidents where climber_name = 'Jeffrey Pickering' and mountain = 'Mount Yale' and year = '2016')),
  ('Edit 109: Catherine M. Pugin', (select count(*) from incidents where climber_name = 'Catherine M. Pugin' and mountain = 'Mount Princeton' and year = '1995')),
  ('Edit 110: Matthew Lackey', (select count(*) from incidents where climber_name = 'Matthew Lackey' and mountain = 'Mount Princeton' and year = '2017')),
  ('Edit 111: Makana von Gortler', (select count(*) from incidents where climber_name = 'Makana von Gortler' and mountain = 'Missouri Mountain' and year = '2011')),
  ('Edit 112: Michael von Gortler', (select count(*) from incidents where climber_name = 'Michael von Gortler' and mountain = 'Missouri Mountain' and year = '2011')),
  ('Edit 113: Joe Anderson', (select count(*) from incidents where climber_name = 'Joe Anderson' and mountain = 'Quandary Peak' and year = '2026')),
  ('Edit 114: Christopher Thomas', (select count(*) from incidents where climber_name = 'Christopher Thomas' and mountain = 'Torreys Peak' and year = '2014')),
  ('Edit 115: Don Chambliss', (select count(*) from incidents where climber_name = 'Don Chambliss' and mountain = 'Torreys Peak' and year = '2019')),
  ('Edit 116: Levi Stobel', (select count(*) from incidents where climber_name = 'Levi Stobel' and mountain = 'Mount Evans' and year = '2026')),
  ('Edit 117: Mary Elizabeth Bowles', (select count(*) from incidents where climber_name = 'Mary Elizabeth Bowles' and mountain = 'Mount Bierstadt' and year = '2011')),
  ('Edit 118: Clinton S. McHugh', (select count(*) from incidents where climber_name = 'Clinton S. McHugh' and mountain = 'Mount Bierstadt' and year = '2012')),
  ('Edit 119: Kaden Sites — source row 249', (select count(*) from incidents where climber_name = 'Kaden Sites' and mountain = 'Mount Shavano' and year = '2026')),
  ('Edit 120: Martin Pigeon — source row 133', (select count(*) from incidents where climber_name = 'Martin Pigeon' and mountain = 'Windom Peak' and year = '2012')),
  ('Edit 121: Ben Brownlee — source row 224', (select count(*) from incidents where climber_name = 'Ben Brownlee' and mountain = 'Redcloud Peak' and year = '2020')),
  ('Edit 122: Walter Johnson', (select count(*) from incidents where climber_name = 'Walter Johnson' and mountain = 'Pikes Peak' and year = '1899'))
) as t(label, matches)
order by (matches = 1), label;

-- ---------------------------------------------------------------------
-- STEP 2  (the actual changes)
-- ---------------------------------------------------------------------
begin;

create table incidents_backup_20261006 as table incidents;

create table if not exists incidents_removed as
  select i.*, null::text as removal_reason, null::timestamptz as removed_at
  from incidents i where false;

do $$
declare n int;
begin
  -- Removal 1: Jane R. Bendixen
  insert into incidents_removed select i.*, 'Survived; should not be in the death list. AAC and contemporary reporting state Bendixen escaped the mountain, reached Allenspark alive, and provided rescuers with information. Sources: https://publications.americanalpineclub.org/articles/13196102302 https://oregonnews.uoregon.edu/lccn/sn97071090/1960-04-21/ed-1/seq-12/ocr/', now() from incidents i where climber_name = 'Jane R. Bendixen' and mountain = 'Longs Peak' and year = '1960';
  delete from incidents where climber_name = 'Jane R. Bendixen' and mountain = 'Longs Peak' and year = '1960';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Removal 1: Jane R. Bendixen matched % rows (expected 1)', n; end if;

  -- Removal 2: James Pruitt
  insert into incidents_removed select i.*, 'Still officially missing; not a confirmed fatality. NPS and Colorado cold-case records list Pruitt as missing from the Glacier Gorge area, with no date of death and no body recovered. Sources: https://home.nps.gov/orgs/1563/cold-cases.htm https://apps.colorado.gov/apps/coldcase/casedetail.html?id=375040', now() from incidents i where climber_name = 'James Pruitt' and mountain = 'Longs Peak' and year = '2019';
  delete from incidents where climber_name = 'James Pruitt' and mountain = 'Longs Peak' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Removal 2: James Pruitt matched % rows (expected 1)', n; end if;

  -- Removal 3: David Cook
  insert into incidents_removed select i.*, 'Missing-person case; no confirmed death/body recovery located. Official sheriff reporting describes Cook as missing and later searches as unsuccessful. Under project rules he should not be counted as a confirmed death. Sources: https://pitkincounty.com/CivicAlerts.aspx?AID=118', now() from incidents i where climber_name = 'David Cook' and mountain = 'Maroon Bells' and year = '2016';
  delete from incidents where climber_name = 'David Cook' and mountain = 'Maroon Bells' and year = '2016';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Removal 3: David Cook matched % rows (expected 1)', n; end if;

  -- Removal 4: Bryan Ludwig
  insert into incidents_removed select i.*, 'Bryan Ludwig, age 29, died on Pico Aislado (13er), not Crestone Peak. A memorial by a close climbing partner explicitly states Ludwig died in a fall on 13er Pico Aislado. His obituary confirms June 19, 2021 and DOB Jan. 19, 1992. Sources: https://www.14ers.com/php14ers/tripreport.php?cpgm=tripmine&trip=21118', now() from incidents i where climber_name = 'Bryan Ludwig' and mountain = 'Crestone Peak' and year = '2021';
  delete from incidents where climber_name = 'Bryan Ludwig' and mountain = 'Crestone Peak' and year = '2021';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Removal 4: Bryan Ludwig matched % rows (expected 1)', n; end if;

  -- Edit 1: Agnes Vaille
  -- now:  Agnes Vaille | Longs Peak | 1/12/1925 | Fall | F | 34
  update incidents set
    cause = 'Weather exposure',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Weather exposure / hypothermia (fall contributed)
* Why: She survived the fall; contemporary/NPS history describes exhaustion, freezing conditions, and death before rescuers returned.
* Status: Supported correction / qualification
* Sources: https://npshistory.com/publications/romo/adhi/chap13.htm https://www.jstor.org/stable/jj.33676901.29
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Weather exposure / hypothermia (fall contributed)
* Why: She survived the fall; contemporary/NPS history describes exhaustion, freezing conditions, and death before rescuers returned.
* Status: Supported correction / qualification
* Sources: https://npshistory.com/publications/romo/adhi/chap13.htm https://www.jstor.org/stable/jj.33676901.29
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Agnes Vaille' and mountain = 'Longs Peak' and year = '1925';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 1: Agnes Vaille matched % rows (expected 1)', n; end if;

  -- Edit 2: Herbert Sortland
  -- now:  Herbert Sortland | Longs Peak | 1/25/1925 | Weather exposure | M | Unknown
  update incidents set
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Qualify unsupported 01/25/1925 date. Likely 01/12–01/13; no exact-day replacement. Body found 02/25.
* Why: He disappeared after turning back from the Vaille rescue. NPS administrative history says his body was found February 25; the current 01/25 date is not supported by the sources reviewed.
* Status: Supported fields / qualified dates and mechanism
* Sources: https://npshistory.com/publications/romo/adhi/chap13.htm https://gateway.okhistory.org/ark:/67531/metadc1985389/m1/1/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Qualify unsupported 01/25/1925 date. Likely 01/12–01/13; no exact-day replacement. Body found 02/25.
* Why: He disappeared after turning back from the Vaille rescue. NPS administrative history says his body was found February 25; the current 01/25 date is not supported by the sources reviewed.
* Status: Supported fields / qualified dates and mechanism
* Sources: https://npshistory.com/publications/romo/adhi/chap13.htm https://gateway.okhistory.org/ark:/67531/metadc1985389/m1/1/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Herbert Sortland' and mountain = 'Longs Peak' and year = '1925';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 2: Herbert Sortland matched % rows (expected 1)', n; end if;

  -- Edit 3: David L. Jones
  -- now:  David L. Jones | Longs Peak | 4/19/1960 | Weather exposure | M | <20
  update incidents set
    day = '20',
    cause = 'Fall',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 04/20/1960 — Fall; severe frostbite/exposure contributed
* Why: AAC account says the party left April 19, spent the night high on the mountain, and Jones and Willmon fell the following morning. Both died from impact after becoming badly frostbitten.
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196102302
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 04/20/1960 — Fall; severe frostbite/exposure contributed
* Why: AAC account says the party left April 19, spent the night high on the mountain, and Jones and Willmon fell the following morning. Both died from impact after becoming badly frostbitten.
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196102302
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'David L. Jones' and mountain = 'Longs Peak' and year = '1960';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 3: David L. Jones matched % rows (expected 1)', n; end if;

  -- Edit 4: Cameron Tangue
  -- now:  Cameron Tangue | Longs Peak | 7/6/2000 | Fall | M | 30-39
  update incidents set
    climber_name = 'Cameron Tague',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Cameron Tague
* Why: AAC accident report identifies Cameron Tague, 32, who fell from Broadway while approaching the Yellow Wall Route.
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200106302/Fall-on-Rock-Climbing-UnropedTrying-to-Save-Time-Colorado-Rocky-Mountain-National-Park-Longs-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Cameron Tague
* Why: AAC accident report identifies Cameron Tague, 32, who fell from Broadway while approaching the Yellow Wall Route.
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200106302/Fall-on-Rock-Climbing-UnropedTrying-to-Save-Time-Colorado-Rocky-Mountain-National-Park-Longs-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Cameron Tangue' and mountain = 'Longs Peak' and year = '2000';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 4: Cameron Tangue matched % rows (expected 1)', n; end if;

  -- Edit 5: Paul Nahon
  -- now:  Paul Nahon | Longs Peak | 8/18/2013 | Fall | M | 20-29
  update incidents set
    day = '15',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/15/2013
* Why: NPS says Nahon fell approximately 150 feet on Thursday, August 15. August 18 was the date his body was recovered.
* Status: Supported correction / qualification
* Sources: https://www.nps.gov/romo/learn/news/pr_body_recovered_from_longs_peak.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/15/2013
* Why: NPS says Nahon fell approximately 150 feet on Thursday, August 15. August 18 was the date his body was recovered.
* Status: Supported correction / qualification
* Sources: https://www.nps.gov/romo/learn/news/pr_body_recovered_from_longs_peak.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Paul Nahon' and mountain = 'Longs Peak' and year = '2013';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 5: Paul Nahon matched % rows (expected 1)', n; end if;

  -- Edit 6: Brian Perri
  -- now:  Brian Perri | Longs Peak | 6/30/2018 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Mount Meeker (13,911 ft); move to associated/boundary list if retained
* Why: NPS located Perri southwest of the summit of Mount Meeker after he had texted a summit photo from Mount Meeker. This was not a Longs Peak fatality.
* Status: Supported correction / qualification
* Sources: https://www.nps.gov/romo/learn/news/recovery-efforts-completed-for-brian-perri.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Mount Meeker (13,911 ft); move to associated/boundary list if retained
* Why: NPS located Perri southwest of the summit of Mount Meeker after he had texted a summit photo from Mount Meeker. This was not a Longs Peak fatality.
* Status: Supported correction / qualification
* Sources: https://www.nps.gov/romo/learn/news/recovery-efforts-completed-for-brian-perri.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Brian Perri' and mountain = 'Longs Peak' and year = '2018';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 6: Brian Perri matched % rows (expected 1)', n; end if;

  -- Edit 7: Jen "Jay" Yambert
  -- now:  Jen "Jay" Yambert | Longs Peak | 8/26/2018 | Fall | F | 60+
  update incidents set
    climber_name = 'Jens “Jay” Yambert',
    gender = 'M',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Jens “Jay” Yambert — Male — age 60; exact death date should be reviewed
* Why: NPS identifies Jens “Jay” Yambert, 60, as a man. He started Aug. 26 and was seen alive Aug. 27; his body was later found below an apparent ~200-foot fall.
* Status: Supported correction / qualification
* Sources: https://www.nps.gov/romo/learn/news/recovery-efforts-completed-for-jens-jay-yambert.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Jens “Jay” Yambert — Male — age 60; exact death date should be reviewed
* Why: NPS identifies Jens “Jay” Yambert, 60, as a man. He started Aug. 26 and was seen alive Aug. 27; his body was later found below an apparent ~200-foot fall.
* Status: Supported correction / qualification
* Sources: https://www.nps.gov/romo/learn/news/recovery-efforts-completed-for-jens-jay-yambert.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jen "Jay" Yambert' and mountain = 'Longs Peak' and year = '2018';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 7: Jen "Jay" Yambert matched % rows (expected 1)', n; end if;

  -- Edit 8: Jadyn Weiss
  -- now:  Jadyn Weiss | Longs Peak | 8/12/2023 | Fall | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Flying Dutchman Couloir — between Longs Peak and Mount Meeker
* Why: NPS explicitly places the fatal fall in the Flying Dutchman couloir between Longs and Meeker. Keep under your broad scope, but flag as an associated/boundary incident.
* Status: Supported correction / qualification
* Sources: https://home.nps.gov/romo/learn/news/recovery-efforts-have-been-completed-in-rocky-mountain-national-park-for-the-body-of-a-21-year-old-female-who-took-a-300-foot-fall-on-the-flying-dutchman-couloir.htm https://bouldercounty.gov/news/hiker-identified-from-rocky-mountain-national-park-incident-on-08-12-2023/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Flying Dutchman Couloir — between Longs Peak and Mount Meeker
* Why: NPS explicitly places the fatal fall in the Flying Dutchman couloir between Longs and Meeker. Keep under your broad scope, but flag as an associated/boundary incident.
* Status: Supported correction / qualification
* Sources: https://home.nps.gov/romo/learn/news/recovery-efforts-have-been-completed-in-rocky-mountain-national-park-for-the-body-of-a-21-year-old-female-who-took-a-300-foot-fall-on-the-flying-dutchman-couloir.htm https://bouldercounty.gov/news/hiker-identified-from-rocky-mountain-national-park-incident-on-08-12-2023/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jadyn Weiss' and mountain = 'Longs Peak' and year = '2023';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 8: Jadyn Weiss matched % rows (expected 1)', n; end if;

  -- Edit 9: Debra Stith
  -- now:  Debra Stith | Longs Peak | 7/2/2025 | Fall | F | 60+
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Near Chasm Lake on scree slopes below Longs Peak
* Why: Sources place Stith near Chasm Lake rather than on the summit route. Under the broad project scope, this can remain associated with Longs with the location made explicit.
* Status: Supported correction / qualification
* Sources: https://coloradosun.com/2025/07/08/hiker-death-fort-collins-debra-stith/ https://www.dignitymemorial.com/en-ca/obituaries/ft-collins-co/debra-stith-12443081
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Near Chasm Lake on scree slopes below Longs Peak
* Why: Sources place Stith near Chasm Lake rather than on the summit route. Under the broad project scope, this can remain associated with Longs with the location made explicit.
* Status: Supported correction / qualification
* Sources: https://coloradosun.com/2025/07/08/hiker-death-fort-collins-debra-stith/ https://www.dignitymemorial.com/en-ca/obituaries/ft-collins-co/debra-stith-12443081
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Debra Stith' and mountain = 'Longs Peak' and year = '2025';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 9: Debra Stith matched % rows (expected 1)', n; end if;

  -- Edit 10: Jeffrey Carlin
  -- now:  Jeffrey Carlin | Longs Peak | 7/6/2026 | Unclear | M | 40-49
  update incidents set
    day = '4',
    cause = 'Fall',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 07/04/2026 — Accidental fall / multiple blunt-force injuries; found 07/05, recovered 07/06
* Why: Coroner identification confirms he was found July 5. Subsequent reporting citing the autopsy says he last contacted someone from the summit July 4 and died from accidental multiple blunt-force injuries.
* Status: Supported correction / qualification
* Sources: https://bouldercounty.gov/news/41-year-old-identified-in-longs-peak-incident/ https://www.aol.com/articles/cause-death-revealed-hiker-died-151309000.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 07/04/2026 — Accidental fall / multiple blunt-force injuries; found 07/05, recovered 07/06
* Why: Coroner identification confirms he was found July 5. Subsequent reporting citing the autopsy says he last contacted someone from the summit July 4 and died from accidental multiple blunt-force injuries.
* Status: Supported correction / qualification
* Sources: https://bouldercounty.gov/news/41-year-old-identified-in-longs-peak-incident/ https://www.aol.com/articles/cause-death-revealed-hiker-died-151309000.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jeffrey Carlin' and mountain = 'Longs Peak' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 10: Jeffrey Carlin matched % rows (expected 1)', n; end if;

  -- Edit 11: Wallace Coleman
  -- now:  Wallace Coleman | Pikes Peak | 7/--/1921 | Accident, other | M | Unknown
  update incidents set
    month = '9',
    day = '2',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 09/02/1921 (historical obituary); note some later histories list 09/01
* Why: Coleman was fatally injured during a pre-race speed/test run. A cited contemporary obituary reports September 2, 1921.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://theaerodrome.com/forum/showthread.php?mode=hybrid&s=788b7a6f29f1d04feacea3ed5b62072a&t=40085
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 09/02/1921 (historical obituary); note some later histories list 09/01
* Why: Coleman was fatally injured during a pre-race speed/test run. A cited contemporary obituary reports September 2, 1921.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://theaerodrome.com/forum/showthread.php?mode=hybrid&s=788b7a6f29f1d04feacea3ed5b62072a&t=40085
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Wallace Coleman' and mountain = 'Pikes Peak' and year = '1921';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 11: Wallace Coleman matched % rows (expected 1)', n; end if;

  -- Edit 12: Bill Gross Jr.
  -- now:  Bill Gross | Pikes Peak | 7/--/1982 | Accident, other | M | Unknown
  update incidents set
    day = '4',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 07/04/1982; motorcycle race crash / struck by another motorcycle
* Why: Contemporary newspaper copy identifies the Fourth of July Hill Climb and Gross as the fatality.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://newspapers.swco.ttu.edu/server/api/core/bitstreams/63672114-5fe2-429f-81a1-cb9f519b21bd/content
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 07/04/1982; motorcycle race crash / struck by another motorcycle
* Why: Contemporary newspaper copy identifies the Fourth of July Hill Climb and Gross as the fatality.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://newspapers.swco.ttu.edu/server/api/core/bitstreams/63672114-5fe2-429f-81a1-cb9f519b21bd/content
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Bill Gross' and mountain = 'Pikes Peak' and year = '1982';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 12: Bill Gross Jr. matched % rows (expected 1)', n; end if;

  -- Edit 13: —
  -- now:  Unnamed | Pikes Peak | 7/26/2000 | Lightning | M | <20
  update incidents set
    climber_name = 'Frazee Waltman',
    day = '25',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Frazee Waltman, 18 — 07/25/2000
* Why: Waltman was struck by the storm''s first lightning flash near the Golden Staircase roughly 100 feet below the summit.
* Activity / location: Hiking
* Status: Supported correction / qualification
* Sources: https://www.backpacker.com/trips/america-s-10-most-dangerous-hikes-barr-trail-pikes-peak-co/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Frazee Waltman, 18 — 07/25/2000
* Why: Waltman was struck by the storm''s first lightning flash near the Golden Staircase roughly 100 feet below the summit.
* Activity / location: Hiking
* Status: Supported correction / qualification
* Sources: https://www.backpacker.com/trips/america-s-10-most-dangerous-hikes-barr-trail-pikes-peak-co/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name is null and mountain = 'Pikes Peak' and year = '2000' and month = '7' and day = '26' and cause = 'Lightning';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 13: — matched % rows (expected 1)', n; end if;

  -- Edit 14: Ralph Chandler Bruning Jr.
  -- now:  Ralph Chandler Bruning Jr. | Pikes Peak | 7/--/2001 | Accident, other | M | 31
  update incidents set
    month = '6',
    day = '28',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 06/28/2001
* Why: AP/ESPN reports the fatal qualifying crash on June 28, 2001.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://www.espn.com/rpm/others/2001/0628/1219847.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 06/28/2001
* Why: AP/ESPN reports the fatal qualifying crash on June 28, 2001.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://www.espn.com/rpm/others/2001/0628/1219847.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Ralph Chandler Bruning Jr.' and mountain = 'Pikes Peak' and year = '2001';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 14: Ralph Chandler Bruning Jr. matched % rows (expected 1)', n; end if;

  -- Edit 15: Henry J. Bresciani
  -- now:  Henry J. Bresciani | Pikes Peak | 7/--/2005 | Accident, other | M | 67
  update incidents set
    month = '6',
    day = '21',
    age = '60+',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 06/21/2005; race official struck by a car at summit finish line
* Why: Autoweek reports Bresciani was struck and killed while serving as finish-line flagman during practice.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://www.autoweek.com/news/a2079191/scoreboard-results-around-motorsports-world-4/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 06/21/2005; race official struck by a car at summit finish line
* Why: Autoweek reports Bresciani was struck and killed while serving as finish-line flagman during practice.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://www.autoweek.com/news/a2079191/scoreboard-results-around-motorsports-world-4/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Henry J. Bresciani' and mountain = 'Pikes Peak' and year = '2005';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 15: Henry J. Bresciani matched % rows (expected 1)', n; end if;

  -- Edit 16: Bobby Goodin
  -- now:  Bobby Goodin | Pikes Peak | 7/--/2014 | Accident, other | M | 54
  update incidents set
    month = '6',
    day = '29',
    age = '50-59',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 06/29/2014
* Why: Goodin crashed moments after crossing the summit finish line and died later that day.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://gazette.com/2014/06/29/texas-racer-dies-after-pikes-peak-hill-climb-crash-966fe0b9-6946-5df3-b91b-ef56db37fa77/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 06/29/2014
* Why: Goodin crashed moments after crossing the summit finish line and died later that day.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://gazette.com/2014/06/29/texas-racer-dies-after-pikes-peak-hill-climb-crash-966fe0b9-6946-5df3-b91b-ef56db37fa77/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Bobby Goodin' and mountain = 'Pikes Peak' and year = '2014';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 16: Bobby Goodin matched % rows (expected 1)', n; end if;

  -- Edit 17: Carl Sorensen
  -- now:  Carl Sorensen | Pikes Peak | 7/--/2015 | Accident, other | M | 39
  update incidents set
    month = '6',
    day = '25',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 06/25/2015
* Why: Sorensen went off a cliff during the final practice session on June 25, 2015.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://gazette.com/2015/06/26/colorado-motorcyclist-who-died-on-pikes-peak-lived-on-the-edge/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 06/25/2015
* Why: Sorensen went off a cliff during the final practice session on June 25, 2015.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://gazette.com/2015/06/26/colorado-motorcyclist-who-died-on-pikes-peak-lived-on-the-edge/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Carl Sorensen' and mountain = 'Pikes Peak' and year = '2015';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 17: Carl Sorensen matched % rows (expected 1)', n; end if;

  -- Edit 18: Rebecca Maxfield
  -- now:  Rebecca Maxfield | Pikes Peak | 10/28/2018 | Unclear | F | 30-39
  update incidents set
    cause = 'Fall',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Fall (apparent/accidental); near 16 Golden Stairs on Barr Trail
* Why: Sheriff''s office described the death as an apparent fall; body was near the final Golden Stairs section.
* Activity / location: Hiking
* Status: Supported correction / qualification
* Sources: https://gazette.com/2018/11/02/woman-found-dead-on-pikes-peak-identified-19531bac-dec6-11e8-9764-37d6e641f93c/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Fall (apparent/accidental); near 16 Golden Stairs on Barr Trail
* Why: Sheriff''s office described the death as an apparent fall; body was near the final Golden Stairs section.
* Activity / location: Hiking
* Status: Supported correction / qualification
* Sources: https://gazette.com/2018/11/02/woman-found-dead-on-pikes-peak-identified-19531bac-dec6-11e8-9764-37d6e641f93c/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Rebecca Maxfield' and mountain = 'Pikes Peak' and year = '2018';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 18: Rebecca Maxfield matched % rows (expected 1)', n; end if;

  -- Edit 19: Carlin Dunne
  -- now:  Carlin Dunne | Pikes Peak | 7/--/2019 | Accident, other | M | 36
  update incidents set
    month = '6',
    day = '30',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 06/30/2019
* Why: Race officials confirmed Dunne''s fatal crash near the finish during the June 30, 2019 Hill Climb.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://www.cyclenews.com/2019/06/article/carlin-dunne-dies-at-pikes-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 06/30/2019
* Why: Race officials confirmed Dunne''s fatal crash near the finish during the June 30, 2019 Hill Climb.
* Activity / location: Pikes Peak Hill Climb
* Status: Supported correction / qualification
* Sources: https://www.cyclenews.com/2019/06/article/carlin-dunne-dies-at-pikes-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Carlin Dunne' and mountain = 'Pikes Peak' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 19: Carlin Dunne matched % rows (expected 1)', n; end if;

  -- Edit 20: Kevin Massey
  -- now:  Kevin Massey | Pikes Peak | 10/9/2019 | Cardiac event | M | 50-59
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain; note he was a Pikes Peak Highway visitor taking a short hike in Devil''s Playground, not a summit climber
* Why: Reporting places the death in the Devil''s Playground area and clarifies he was a highway visitor.
* Activity / location: Highway visitor / short hike
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2019/10/14/man-dies-on-pikes-peak-in-colorado-975780f9-3f87-55a4-8d54-cd3a8c03913c/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain; note he was a Pikes Peak Highway visitor taking a short hike in Devil''s Playground, not a summit climber
* Why: Reporting places the death in the Devil''s Playground area and clarifies he was a highway visitor.
* Activity / location: Highway visitor / short hike
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2019/10/14/man-dies-on-pikes-peak-in-colorado-975780f9-3f87-55a4-8d54-cd3a8c03913c/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Kevin Massey' and mountain = 'Pikes Peak' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 20: Kevin Massey matched % rows (expected 1)', n; end if;

  -- Edit 21: Frank Pretzel
  -- now:  Frank Pretzel | Maroon Bells | 8/--/1965 | Fall | M | Unknown
  update incidents set
    day = '15',
    age = '40-49',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/15/1965 — age 44 — fatal fall/slide during descent
* Why: AAC documents Pretzel, Ungnade, Day and survivor William Martin in the Aug. 15, 1965 South Maroon accident.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196612000
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/15/1965 — age 44 — fatal fall/slide during descent
* Why: AAC documents Pretzel, Ungnade, Day and survivor William Martin in the Aug. 15, 1965 South Maroon accident.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196612000
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Frank Pretzel' and mountain = 'Maroon Bells' and year = '1965';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 21: Frank Pretzel matched % rows (expected 1)', n; end if;

  -- Edit 22: Herbert Ungnade
  -- now:  Herbert Ungnade | Maroon Bells | 8/--/1965 | Fall | M | Unknown
  update incidents set
    day = '15',
    age = '50-59',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/15/1965 — age 54 — fatal fall/slide during descent
* Why: Same 1965 South Maroon accident as Pretzel and Day.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196612000
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/15/1965 — age 54 — fatal fall/slide during descent
* Why: Same 1965 South Maroon accident as Pretzel and Day.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196612000
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Herbert Ungnade' and mountain = 'Maroon Bells' and year = '1965';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 22: Herbert Ungnade matched % rows (expected 1)', n; end if;

  -- Edit 23: Bob Day
  -- now:  Bob Day | Maroon Bells | 8/--/1965 | Fall | M | Unknown
  update incidents set
    day = '15',
    age = '40-49',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/15/1965 — Robert/Bob Day, age 42 — fatal fall/slide during descent
* Why: Same 1965 South Maroon accident as Pretzel and Ungnade.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196612000
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/15/1965 — Robert/Bob Day, age 42 — fatal fall/slide during descent
* Why: Same 1965 South Maroon accident as Pretzel and Ungnade.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196612000
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Bob Day' and mountain = 'Maroon Bells' and year = '1965';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 23: Bob Day matched % rows (expected 1)', n; end if;

  -- Edit 24: Richard Alan Cole
  -- now:  Richard Alan Cole | Maroon Bells | 4/23/1967 | Fall | M | Unknown
  update incidents set
    year = '1966',
    day = '24',
    age = '<20',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Correct year to 1966. Exact day 04/24 remains likely; retain date uncertainty. Age 19.
* Why: AAC publication appeared in 1967, but the accident itself occurred in April 1966. Ronald Earl Fjeseth also died; Joe Fullop survived.
* Activity / location: North Maroon Peak
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13196711500
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Correct year to 1966. Exact day 04/24 remains likely; retain date uncertainty. Age 19.
* Why: AAC publication appeared in 1967, but the accident itself occurred in April 1966. Ronald Earl Fjeseth also died; Joe Fullop survived.
* Activity / location: North Maroon Peak
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13196711500
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Richard Alan Cole' and mountain = 'Maroon Bells' and year = '1967';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 24: Richard Alan Cole matched % rows (expected 1)', n; end if;

  -- Edit 25: Ann Noyes Fowler
  -- now:  Ann Noyes Fowler | Maroon Bells | 8/15/1971 | Fall | F | Unknown
  update incidents set
    year = '1970',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/15/1970 — age 39 — rockfall/fall near top of couloir
* Why: AAC says loose rock struck/dislodged the climbers. Edward H. Hilliard, 47, was also killed; Rodney Aller and Rodney Aller Jr. survived.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13197109600
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/15/1970 — age 39 — rockfall/fall near top of couloir
* Why: AAC says loose rock struck/dislodged the climbers. Edward H. Hilliard, 47, was also killed; Rodney Aller and Rodney Aller Jr. survived.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13197109600
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Ann Noyes Fowler' and mountain = 'Maroon Bells' and year = '1971';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 25: Ann Noyes Fowler matched % rows (expected 1)', n; end if;

  -- Edit 26: Beatrice Venice Sawyer
  -- now:  Beatrice Venice Sawyer | Maroon Bells | 8/23/1975 | Fall | F | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/23/1975 — age 24 — approximately 1,000-foot fall
* Why: Existing date/cause are supported; add precise age and location.
* Activity / location: Ridge/chimney connecting North and South Maroon
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13197611000
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/23/1975 — age 24 — approximately 1,000-foot fall
* Why: Existing date/cause are supported; add precise age and location.
* Activity / location: Ridge/chimney connecting North and South Maroon
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13197611000
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Beatrice Venice Sawyer' and mountain = 'Maroon Bells' and year = '1975';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 26: Beatrice Venice Sawyer matched % rows (expected 1)', n; end if;

  -- Edit 27: Spencer James Nelson
  -- now:  Spencer James Nelson | Maroon Bells | 8/14/2010 | Fall | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/14/2010 — age 20 — struck by dislodged rock, then fell into Bell Cord Couloir
* Why: University of Colorado reporting states Nelson was struck in the head by rock and fell after his party had summited.
* Activity / location: Maroon Bells / Bell Cord Couloir
* Status: Supported correction / qualification
* Sources: https://www.colorado.edu/today/2010/08/16/cu-boulder-student-dies-climbing-accident-maroon-bells
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/14/2010 — age 20 — struck by dislodged rock, then fell into Bell Cord Couloir
* Why: University of Colorado reporting states Nelson was struck in the head by rock and fell after his party had summited.
* Activity / location: Maroon Bells / Bell Cord Couloir
* Status: Supported correction / qualification
* Sources: https://www.colorado.edu/today/2010/08/16/cu-boulder-student-dies-climbing-accident-maroon-bells
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Spencer James Nelson' and mountain = 'Maroon Bells' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 27: Spencer James Nelson matched % rows (expected 1)', n; end if;

  -- Edit 28: Lenny Joyner
  -- now:  Lenny Joyner | Maroon Bells | 7/19/2012 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain; age 31. Summited South Maroon, traversed to North Maroon, then died in a fall during descent.
* Why: Contemporary/retrospective reporting places Joyner on North Maroon after traversing from South Maroon.
* Activity / location: North Maroon Peak descent
* Status: Supported correction / qualification
* Sources: https://www.100summits.com/articles/the-summer-of-2012-on-the-maroon-bells/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain; age 31. Summited South Maroon, traversed to North Maroon, then died in a fall during descent.
* Why: Contemporary/retrospective reporting places Joyner on North Maroon after traversing from South Maroon.
* Activity / location: North Maroon Peak descent
* Status: Supported correction / qualification
* Sources: https://www.100summits.com/articles/the-summer-of-2012-on-the-maroon-bells/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Lenny Joyner' and mountain = 'Maroon Bells' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 28: Lenny Joyner matched % rows (expected 1)', n; end if;

  -- Edit 29: Derek Kelley
  -- now:  Derek Kelley | Maroon Bells | 9/15/2012 | Fall | M | Unknown
  update incidents set
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain 09/15/2012; age 34. Loose boulder/rock near summit led to an approximately 800-foot fall.
* Why: Contemporary reporting supports Sept. 15; a later AAC index uses Sept. 17, so the date discrepancy is documented rather than silently resolved.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://gazette.com/2012/09/17/climber-dies-on-north-maroon-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain 09/15/2012; age 34. Loose boulder/rock near summit led to an approximately 800-foot fall.
* Why: Contemporary reporting supports Sept. 15; a later AAC index uses Sept. 17, so the date discrepancy is documented rather than silently resolved.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://gazette.com/2012/09/17/climber-dies-on-north-maroon-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Derek Kelley' and mountain = 'Maroon Bells' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 29: Derek Kelley matched % rows (expected 1)', n; end if;

  -- Edit 30: —
  -- now:  Unnamed | Maroon Bells | 10/--/2014 | Fall | Unknown | Unknown
  update incidents set
    climber_name = 'Jarod S. Wetherell',
    day = '10',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Jarod S. Wetherell, 37 — 10/10/2014 — fatal fall while descending
* Why: Contemporary reporting identifies Wetherell and describes route-finding difficulty before the fall; companion David Richardson survived.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://www.denverpost.com/2014/10/13/climber-dies-after-fall-on-north-maroon-bell/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Jarod S. Wetherell, 37 — 10/10/2014 — fatal fall while descending
* Why: Contemporary reporting identifies Wetherell and describes route-finding difficulty before the fall; companion David Richardson survived.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://www.denverpost.com/2014/10/13/climber-dies-after-fall-on-north-maroon-bell/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name is null and mountain = 'Maroon Bells' and year = '2014' and month = '10' and day is null and cause = 'Fall';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 30: — matched % rows (expected 1)', n; end if;

  -- Edit 31: Jeffrey Bushroe
  -- now:  Jeffrey Bushroe | Maroon Bells | 5/27/2017 | Fall | M | 20-29
  update incidents set
    cause = 'Weather exposure',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Weather exposure / hypothermia; fall/head injury contributed
* Why: Pitkin County coroner reporting says Bushroe ultimately died of hypothermia after a fall/head injury contributed to confusion.
* Activity / location: Maroon Bells
* Status: Supported correction / qualification
* Sources: https://www.aspenpublicradio.org/2017-06-01/coroner-hypothermia-killed-maroon-bells-hiker
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Weather exposure / hypothermia; fall/head injury contributed
* Why: Pitkin County coroner reporting says Bushroe ultimately died of hypothermia after a fall/head injury contributed to confusion.
* Activity / location: Maroon Bells
* Status: Supported correction / qualification
* Sources: https://www.aspenpublicradio.org/2017-06-01/coroner-hypothermia-killed-maroon-bells-hiker
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jeffrey Bushroe' and mountain = 'Maroon Bells' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 31: Jeffrey Bushroe matched % rows (expected 1)', n; end if;

  -- Edit 32: Rei Hwa Lee
  -- now:  Rei Hwa Lee | Maroon Bells | 8/5/2017 | Fall | M | 50-59
  update incidents set
    gender = 'F',
    age = '50-59',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Female, age 57 — fatal fall on North Face
* Why: Current sheet incorrectly lists Lee as male.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://www.aspenpublicradio.org/2017-08-07/woman-dies-in-fall-on-north-maroon-peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Female, age 57 — fatal fall on North Face
* Why: Current sheet incorrectly lists Lee as male.
* Activity / location: North Maroon Peak
* Status: Supported correction / qualification
* Sources: https://www.aspenpublicradio.org/2017-08-07/woman-dies-in-fall-on-north-maroon-peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Rei Hwa Lee' and mountain = 'Maroon Bells' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 32: Rei Hwa Lee matched % rows (expected 1)', n; end if;

  -- Edit 33: James Hasse
  -- now:  James Hasse | Maroon Bells | 7/10/2019 | Fall | M | 60+
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 61 — approximately 200-foot fall; blunt head trauma
* Why: Existing date/cause are supported; add exact peak and mechanism.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/maroon-bells-hiker-death-james-hasse/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 61 — approximately 200-foot fall; blunt head trauma
* Why: Existing date/cause are supported; add exact peak and mechanism.
* Activity / location: South Maroon Peak
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/maroon-bells-hiker-death-james-hasse/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'James Hasse' and mountain = 'Maroon Bells' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 33: James Hasse matched % rows (expected 1)', n; end if;

  -- Edit 34: Jason Buehler
  -- now:  Jason Buehler | Maroon Bells | 11/6/2020 | Fall | M | 40-49
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 43 — fell approximately 500–1,000 feet during South-to-North Maroon traverse
* Why: Existing date/cause are supported; add traverse/location detail.
* Activity / location: North Maroon / traverse
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/maroon-bells-climber-jason-buehler-fall/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 43 — fell approximately 500–1,000 feet during South-to-North Maroon traverse
* Why: Existing date/cause are supported; add traverse/location detail.
* Activity / location: North Maroon / traverse
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/maroon-bells-climber-jason-buehler-fall/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jason Buehler' and mountain = 'Maroon Bells' and year = '2020';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 34: Jason Buehler matched % rows (expected 1)', n; end if;

  -- Edit 35: Jimi Flowers
  -- now:  Jimi Flowers | Capitol Peak | 7/10/2009 | Fall | M | 40-49
  update incidents set
    climber_name = 'James “Jimi” Flowers',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: James “Jimi” Flowers, 47 — fall/slide on snow and ice during descent
* Why: Flowers summited successfully, lost footing on a snow/ice patch while descending, and fell/slid through snow chutes and rock bands. He initially survived but died before a paramedic reached him.
* Activity / location: Northwest Ridge, between K2 and Daly Saddle
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201005702
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: James “Jimi” Flowers, 47 — fall/slide on snow and ice during descent
* Why: Flowers summited successfully, lost footing on a snow/ice patch while descending, and fell/slid through snow chutes and rock bands. He initially survived but died before a paramedic reached him.
* Activity / location: Northwest Ridge, between K2 and Daly Saddle
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201005702
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jimi Flowers' and mountain = 'Capitol Peak' and year = '2009';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 35: Jimi Flowers matched % rows (expected 1)', n; end if;

  -- Edit 36: Ryan Joseph Palmer
  -- now:  Ryan Joseph Palmer | Capitol Peak | 7/21/2013 | Fall | M | Unknown
  update incidents set
    day = '19',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 07/19/2013 — age 35 — 200–300 ft fall on north face; 07/21 was recovery date
* Why: Pitkin County Sheriff release says Palmer fell Friday July 19 after choosing the north face instead of returning across the Knife Edge; located July 20, recovered July 21.
* Activity / location: North face during descent
* Status: Supported correction / qualification
* Sources: https://archives2.realvail.com/article/1905/Body-of-Vail-man-recovered-after-fatal-fall-on-Capitol-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 07/19/2013 — age 35 — 200–300 ft fall on north face; 07/21 was recovery date
* Why: Pitkin County Sheriff release says Palmer fell Friday July 19 after choosing the north face instead of returning across the Knife Edge; located July 20, recovered July 21.
* Activity / location: North face during descent
* Status: Supported correction / qualification
* Sources: https://archives2.realvail.com/article/1905/Body-of-Vail-man-recovered-after-fatal-fall-on-Capitol-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Ryan Joseph Palmer' and mountain = 'Capitol Peak' and year = '2013';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 36: Ryan Joseph Palmer matched % rows (expected 1)', n; end if;

  -- Edit 37: Jim Nelson
  -- now:  Jim Nelson | Capitol Peak | 8/6/2014 | Unclear | M | 50-59
  update incidents set
    climber_name = 'James Edgar Nelson',
    day = null,
    cause = 'Fall',
    age = '50-59',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: James Edgar Nelson, 53 — Fall / multiple injuries; recovered 08/06, exact fall date likely earlier
* Why: Pitkin County coroner ruled multiple injuries from a fall. Search began late Aug. 5 after he failed to return; body was recovered Aug. 6, so recovery date should not automatically be used as death date.
* Activity / location: Mount Daly Basin above Moon Lake after Capitol summit
* Status: Supported fields / qualified dates and mechanism
* Sources: https://archive.sltrib.com/article.php?id=58271665&itype=CMSID
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: James Edgar Nelson, 53 — Fall / multiple injuries; recovered 08/06, exact fall date likely earlier
* Why: Pitkin County coroner ruled multiple injuries from a fall. Search began late Aug. 5 after he failed to return; body was recovered Aug. 6, so recovery date should not automatically be used as death date.
* Activity / location: Mount Daly Basin above Moon Lake after Capitol summit
* Status: Supported fields / qualified dates and mechanism
* Sources: https://archive.sltrib.com/article.php?id=58271665&itype=CMSID
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jim Nelson' and mountain = 'Capitol Peak' and year = '2014';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 37: Jim Nelson matched % rows (expected 1)', n; end if;

  -- Edit 38: Jake Lord
  -- now:  Jake Lord | Capitol Peak | 7/15/2017 | Fall | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 25 — fall at least 160 ft after large boulder came loose
* Why: Lord and partner were on a nearby ridge often mistakenly taken for the standard route. The boulder he was climbing around loosened and caused the fall.
* Activity / location: Off-standard ridge between Daly Saddle and K2
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 25 — fall at least 160 ft after large boulder came loose
* Why: Lord and partner were on a nearby ridge often mistakenly taken for the standard route. The boulder he was climbing around loosened and caused the fall.
* Activity / location: Off-standard ridge between Daly Saddle and K2
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jake Lord' and mountain = 'Capitol Peak' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 38: Jake Lord matched % rows (expected 1)', n; end if;

  -- Edit 39: Jeremy Shull
  -- now:  Jeremy Shull | Capitol Peak | 8/6/2017 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 35 — approximately 200-ft fall east of ridge between K2 and Knife Edge
* Why: Shull was ahead of his party and out of sight when he fell into a crevasse-like feature. Recovery was delayed by weather.
* Activity / location: Approaching Knife Edge; not actually on the Knife Edge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 35 — approximately 200-ft fall east of ridge between K2 and Knife Edge
* Why: Shull was ahead of his party and out of sight when he fell into a crevasse-like feature. Recovery was delayed by weather.
* Activity / location: Approaching Knife Edge; not actually on the Knife Edge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jeremy Shull' and mountain = 'Capitol Peak' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 39: Jeremy Shull matched % rows (expected 1)', n; end if;

  -- Edit 40: Ryan Marcil
  -- now:  Ryan Marcil | Capitol Peak | 8/22/2017 | Fall | M | 20-29
  update incidents set
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Likely 08/20/2017 — age 26; bodies discovered 08/22
* Why: Marcil and Brightwell were last seen late morning Aug. 20 very near the summit. Their bodies were found Aug. 22; exact fall mechanism is unknown.
* Activity / location: North face / likely alternative descent from near summit
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Likely 08/20/2017 — age 26; bodies discovered 08/22
* Why: Marcil and Brightwell were last seen late morning Aug. 20 very near the summit. Their bodies were found Aug. 22; exact fall mechanism is unknown.
* Activity / location: North face / likely alternative descent from near summit
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Ryan Marcil' and mountain = 'Capitol Peak' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 40: Ryan Marcil matched % rows (expected 1)', n; end if;

  -- Edit 41: Carlin “Carly” Brightwell
  -- now:  Carlin “Carly” Brightwell | Capitol Peak | 8/22/2017 | Fall | F | 20-29
  update incidents set
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Likely 08/20/2017 — age 27; bodies discovered 08/22
* Why: Same incident as Ryan Marcil. Discovery date should be distinguished from the likely accident date.
* Activity / location: North face / likely alternative descent from near summit
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Likely 08/20/2017 — age 27; bodies discovered 08/22
* Why: Same incident as Ryan Marcil. Discovery date should be distinguished from the likely accident date.
* Activity / location: North face / likely alternative descent from near summit
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Carlin “Carly” Brightwell' and mountain = 'Capitol Peak' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 41: Carlin “Carly” Brightwell matched % rows (expected 1)', n; end if;

  -- Edit 42: Zackaria White
  -- now:  Zackaria White | Capitol Peak | 8/26/2017 | Fall | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 21 — approximately 600-ft fall on off-standard north-side descent gully
* Why: White separated from his partner after disagreeing about descent route and attempted a direct gully that cliffs out.
* Activity / location: North gully shortcut during descent
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 21 — approximately 600-ft fall on off-standard north-side descent gully
* Why: White separated from his partner after disagreeing about descent route and attempted a direct gully that cliffs out.
* Activity / location: North gully shortcut during descent
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214906
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Zackaria White' and mountain = 'Capitol Peak' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 42: Zackaria White matched % rows (expected 1)', n; end if;

  -- Edit 43: Kelly McDermott
  -- now:  Kelly McDermott | Capitol Peak | 7/31/2021 | Fall | M | 30-39
  update incidents set
    month = '8',
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Likely 08/01/2021 — age 32; 07/31 was last-seen/trailhead date
* Why: McDermott was last seen at the trailhead evening July 31 and planned to summit Aug. 1. He was reported overdue that night and found Aug. 4 after an apparent fatal fall.
* Activity / location: Near south end of Knife Edge; body ~500 ft below ridge
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.cbsnews.com/colorado/news/pitkin-county-missing-climber-searchers-injured-rock-slide-capitol-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Likely 08/01/2021 — age 32; 07/31 was last-seen/trailhead date
* Why: McDermott was last seen at the trailhead evening July 31 and planned to summit Aug. 1. He was reported overdue that night and found Aug. 4 after an apparent fatal fall.
* Activity / location: Near south end of Knife Edge; body ~500 ft below ridge
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.cbsnews.com/colorado/news/pitkin-county-missing-climber-searchers-injured-rock-slide-capitol-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Kelly McDermott' and mountain = 'Capitol Peak' and year = '2021';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 43: Kelly McDermott matched % rows (expected 1)', n; end if;

  -- Edit 44: Sarah Beechler
  -- now:  Sarah Beechler | Capitol Peak | 9/3/2022 | Fall | F | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date; rock handhold broke loose and she fell about 900 ft
* Why: Beechler was attempting Capitol as her final Colorado 14er. Family/friends'' memorial account identifies the failed handhold and approximate 900-ft fall.
* Activity / location: Near summit, into Pierre Lakes Basin
* Status: Supported correction / qualification
* Sources: https://www.gofundme.com/f/support-sarahs-family-with-her-arrangements
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date; rock handhold broke loose and she fell about 900 ft
* Why: Beechler was attempting Capitol as her final Colorado 14er. Family/friends'' memorial account identifies the failed handhold and approximate 900-ft fall.
* Activity / location: Near summit, into Pierre Lakes Basin
* Status: Supported correction / qualification
* Sources: https://www.gofundme.com/f/support-sarahs-family-with-her-arrangements
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Sarah Beechler' and mountain = 'Capitol Peak' and year = '2022';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 44: Sarah Beechler matched % rows (expected 1)', n; end if;

  -- Edit 45: Linda M. Pryor
  -- now:  Linda M. Pryor | Crestone Needle | 6/28/2008 | Fall | F | 40-49
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date and cause; age 49; approximately 100-foot fall after losing a handhold
* Why: Custer County coroner identified Pryor. Her helmet was knocked off during the fall; companions attempted resuscitation.
* Activity / location: Crestone Needle west slope, ~13,500 ft
* Status: Supported correction / qualification
* Sources: https://gazette.com/2008/06/28/divide-woman-falls-to-her-death-climbing-crestone-needle/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date and cause; age 49; approximately 100-foot fall after losing a handhold
* Why: Custer County coroner identified Pryor. Her helmet was knocked off during the fall; companions attempted resuscitation.
* Activity / location: Crestone Needle west slope, ~13,500 ft
* Status: Supported correction / qualification
* Sources: https://gazette.com/2008/06/28/divide-woman-falls-to-her-death-climbing-crestone-needle/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Linda M. Pryor' and mountain = 'Crestone Needle' and year = '2008';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 45: Linda M. Pryor matched % rows (expected 1)', n; end if;

  -- Edit 46: Duane Buhrmester
  -- now:  Duane Buhrmester | Crestone Needle | 7/27/2010 | Fall | M | 50-59
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 57; fall during severe storm/rock-and-mud slide; retain date
* Why: AAC says Duane and Linda were attempting Ellingwood Arête. Severe weather apparently swept them off; they fell roughly 500 feet and were found buried in mud and rock debris.
* Activity / location: Ellingwood Arête / upper Crestone Needle
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201104800
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 57; fall during severe storm/rock-and-mud slide; retain date
* Why: AAC says Duane and Linda were attempting Ellingwood Arête. Severe weather apparently swept them off; they fell roughly 500 feet and were found buried in mud and rock debris.
* Activity / location: Ellingwood Arête / upper Crestone Needle
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201104800
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Duane Buhrmester' and mountain = 'Crestone Needle' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 46: Duane Buhrmester matched % rows (expected 1)', n; end if;

  -- Edit 47: Linda Buhrmester
  -- now:  Linda Buhrmester | Crestone Needle | 7/27/2010 | Fall | F | 50-59
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 56; fall during severe storm/rock-and-mud slide; retain date
* Why: Same incident as Duane Buhrmester. Preserve the role of weather/debris flow in the narrative even if the database cause remains Fall.
* Activity / location: Ellingwood Arête / upper Crestone Needle
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201104800
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 56; fall during severe storm/rock-and-mud slide; retain date
* Why: Same incident as Duane Buhrmester. Preserve the role of weather/debris flow in the narrative even if the database cause remains Fall.
* Activity / location: Ellingwood Arête / upper Crestone Needle
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201104800
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Linda Buhrmester' and mountain = 'Crestone Needle' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 47: Linda Buhrmester matched % rows (expected 1)', n; end if;

  -- Edit 48: Chris Gray
  -- now:  Chris Gray | Crestone Peak | 8/29/2012 | Fall | M | Unknown
  update incidents set
    day = '28',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 08/28/2012 — fatal fall on North Buttress; 08/29 appears to be recovery/reporting date
* Why: Gray''s family memorial/trip-report material gives Aug. 28 as his death date. Retain Aug. 29 only as discovery/recovery if documented separately.
* Activity / location: Crestone Peak North Buttress
* Status: Supported correction / qualification
* Sources: https://www.100summits.com/articles/the-summer-of-2012-on-the-maroon-bells/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 08/28/2012 — fatal fall on North Buttress; 08/29 appears to be recovery/reporting date
* Why: Gray''s family memorial/trip-report material gives Aug. 28 as his death date. Retain Aug. 29 only as discovery/recovery if documented separately.
* Activity / location: Crestone Peak North Buttress
* Status: Supported correction / qualification
* Sources: https://www.100summits.com/articles/the-summer-of-2012-on-the-maroon-bells/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Chris Gray' and mountain = 'Crestone Peak' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 48: Chris Gray matched % rows (expected 1)', n; end if;

  -- Edit 49: Christopher Kiryluk
  -- now:  Christopher Kiryluk | Crestone Peak | 7/24/2015 | Fall | M | 20-29
  update incidents set
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 34 (30–39), not 20–29; retain date and cause
* Why: AAC reports Kiryluk, 34, slipped/fell while descending the Red Gully in lingering snow/ice.
* Activity / location: Red Gully, Crestone Peak descent
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214127/Falls-on-Snow-and-Rock
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 34 (30–39), not 20–29; retain date and cause
* Why: AAC reports Kiryluk, 34, slipped/fell while descending the Red Gully in lingering snow/ice.
* Activity / location: Red Gully, Crestone Peak descent
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201214127/Falls-on-Snow-and-Rock
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Christopher Kiryluk' and mountain = 'Crestone Peak' and year = '2015';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 49: Christopher Kiryluk matched % rows (expected 1)', n; end if;

  -- Edit 50: Dr. Matthew Davis
  -- now:  Dr. Matthew Davis | Crestone Needle | 9/2/2015 | Fall | M | Unknown
  update incidents set
    day = '3',
    age = '40-49',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 09/03/2015 — age 41 — >100-foot fall while unroped
* Why: AAC dates the accident Sept. 3. Davis slipped on third-class terrain above the initial roped climbing and died on impact.
* Activity / location: Ellingwood Arête approach / third-class ledges
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201213984/Fall-on-Rock-Climber-Unroped
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 09/03/2015 — age 41 — >100-foot fall while unroped
* Why: AAC dates the accident Sept. 3. Davis slipped on third-class terrain above the initial roped climbing and died on impact.
* Activity / location: Ellingwood Arête approach / third-class ledges
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201213984/Fall-on-Rock-Climber-Unroped
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Dr. Matthew Davis' and mountain = 'Crestone Needle' and year = '2015';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 50: Dr. Matthew Davis matched % rows (expected 1)', n; end if;

  -- Edit 51: Jeffry Deardorff
  -- now:  Jeffry Deardorff | Crestone Needle | 9/25/2020 | Fall | M | 60+
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain as Crestone Needle; approximately 1,000-foot fall during descent; body found 09/27
* Why: Public reporting inconsistently says Crestone Peak/Needle, but family/friend information places his summit on Crestone Needle. Preserve attribution note.
* Activity / location: Crestone Needle / Cottonwood Lake side
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/jeff-deardorff-dies-climbing-crestone-peak-sangre-de-cristo-wilderness/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain as Crestone Needle; approximately 1,000-foot fall during descent; body found 09/27
* Why: Public reporting inconsistently says Crestone Peak/Needle, but family/friend information places his summit on Crestone Needle. Preserve attribution note.
* Activity / location: Crestone Needle / Cottonwood Lake side
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/jeff-deardorff-dies-climbing-crestone-peak-sangre-de-cristo-wilderness/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jeffry Deardorff' and mountain = 'Crestone Needle' and year = '2020';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 51: Jeffry Deardorff matched % rows (expected 1)', n; end if;

  -- Edit 52: Jeremy Fuerst
  -- now:  Jeremy Fuerst | Crestone Needle | 9/11/2021 | Fall | M | 40-49
  update incidents set
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Crestones Traverse between Peak and Needle; public sources conflict on exact death date and age (43/44)
* Why: Body was located roughly 300 feet below the traverse. Sept. 11 is the overdue/search date; obituary and climbing-log evidence create a Sep. 9–11 date conflict.
* Activity / location: Crestones Traverse
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.denver7.com/news/local-news/experienced-climber-dead-after-fall-on-sangre-de-cristo-mountains-in-custer-county
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Crestones Traverse between Peak and Needle; public sources conflict on exact death date and age (43/44)
* Why: Body was located roughly 300 feet below the traverse. Sept. 11 is the overdue/search date; obituary and climbing-log evidence create a Sep. 9–11 date conflict.
* Activity / location: Crestones Traverse
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.denver7.com/news/local-news/experienced-climber-dead-after-fall-on-sangre-de-cristo-mountains-in-custer-county
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jeremy Fuerst' and mountain = 'Crestone Needle' and year = '2021';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 52: Jeremy Fuerst matched % rows (expected 1)', n; end if;

  -- Edit 53: Alexe Mericle
  -- now:  Alexe Mericle | Crestone Needle | 8/3/2022 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause, but location is Crestones Traverse rather than Needle proper
* Why: Two climbers got off-route on the traverse connecting Crestone Peak and Needle; Mericle fell to his death and his partner was rescued.
* Activity / location: Crestones Traverse, ~13,800 ft
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2022/08/04/one-dead-one-rescued-after-party-gets-off-route-on-extreme-colorado-fourteener-climb-7c64e11f-ce80-59a5-ae87-16affcb01375/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause, but location is Crestones Traverse rather than Needle proper
* Why: Two climbers got off-route on the traverse connecting Crestone Peak and Needle; Mericle fell to his death and his partner was rescued.
* Activity / location: Crestones Traverse, ~13,800 ft
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2022/08/04/one-dead-one-rescued-after-party-gets-off-route-on-extreme-colorado-fourteener-climb-7c64e11f-ce80-59a5-ae87-16affcb01375/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Alexe Mericle' and mountain = 'Crestone Needle' and year = '2022';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 53: Alexe Mericle matched % rows (expected 1)', n; end if;

  -- Edit 54: John Howard Burns
  -- now:  John Howard Burns | Crestone Needle | 8/22/2024 | Fall | M | 60+
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age reported as 66–67; fatal fall after completing Peak-to-Needle traverse and summiting Needle
* Why: Public reports differ slightly on age. Route sequence clearly places the apparent fatal fall after the Crestone Needle summit.
* Activity / location: Crestone Needle descent
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2024/08/26/man-dead-after-fall-on-treacherous-14196-foot-peak-in-colorado/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age reported as 66–67; fatal fall after completing Peak-to-Needle traverse and summiting Needle
* Why: Public reports differ slightly on age. Route sequence clearly places the apparent fatal fall after the Crestone Needle summit.
* Activity / location: Crestone Needle descent
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2024/08/26/man-dead-after-fall-on-treacherous-14196-foot-peak-in-colorado/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'John Howard Burns' and mountain = 'Crestone Needle' and year = '2024';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 54: John Howard Burns matched % rows (expected 1)', n; end if;

  -- Edit 55: —
  -- now:  Unnamed | Little Bear Peak | 7/2/2006 | Fall | M | Unknown
  update incidents set
    climber_name = 'Mathew Zimmer',
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Mathew Zimmer, 38, Wichita, Kansas — retain date; fall triggered when a large rock/hold came loose
* Why: AAC details an experienced unroped climber whose large rock/hold came loose; initial ~20-foot fall became a 300–400-foot tumble. Contemporary Gazette reporting identifies the victim as Mathew Zimmer, 38.
* Activity / location: Northwest Face upper headwall, just below Blanca–Little Bear ridge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200704000
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Mathew Zimmer, 38, Wichita, Kansas — retain date; fall triggered when a large rock/hold came loose
* Why: AAC details an experienced unroped climber whose large rock/hold came loose; initial ~20-foot fall became a 300–400-foot tumble. Contemporary Gazette reporting identifies the victim as Mathew Zimmer, 38.
* Activity / location: Northwest Face upper headwall, just below Blanca–Little Bear ridge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200704000
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name is null and mountain = 'Little Bear Peak' and year = '2006' and month = '7' and day = '2' and cause = 'Fall';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 55: — matched % rows (expected 1)', n; end if;

  -- Edit 56: Lygon Stevens
  -- now:  Lygon Stevens | Little Bear Peak | 1/10/2008 | Avalanche | F | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age 20. Remains recovered 06/24/2008, not the death date.
* Why: Lygon and her brother triggered a large slab avalanche roughly 500 feet wide that ran about 1,000 vertical feet and over a cliff. Her brother survived; Lygon''s remains were recovered months later.
* Activity / location: West Ridge / Hourglass route, south side of ridge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200904100/Avalanche-Colorado-Little-Bear-Peak-Standard-Hourglass-Route
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age 20. Remains recovered 06/24/2008, not the death date.
* Why: Lygon and her brother triggered a large slab avalanche roughly 500 feet wide that ran about 1,000 vertical feet and over a cliff. Her brother survived; Lygon''s remains were recovered months later.
* Activity / location: West Ridge / Hourglass route, south side of ridge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200904100/Avalanche-Colorado-Little-Bear-Peak-Standard-Hourglass-Route
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Lygon Stevens' and mountain = 'Little Bear Peak' and year = '2008';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 56: Lygon Stevens matched % rows (expected 1)', n; end if;

  -- Edit 57: Kevin Hayne
  -- now:  Kevin Hayne | Little Bear Peak | 6/15/2010 | Fall | M | <20
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age 18. Fall occurred beside/above the icy Hourglass after a handhold/foothold or ledge broke loose.
* Why: Alamosa County Sheriff''s Office identified Hayne. Partner Travis Winder reported the Hourglass was iced over and Hayne fell several hundred feet after a hold/ledge broke loose.
* Activity / location: Hourglass route / upper Hourglass area
* Status: Supported correction / qualification
* Sources: https://gazette.com/2010/06/16/fall-from-little-bear-peak-kills-highlands-ranch-teen-f182db58-e9e9-554c-8bc7-3feda243ef9e/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age 18. Fall occurred beside/above the icy Hourglass after a handhold/foothold or ledge broke loose.
* Why: Alamosa County Sheriff''s Office identified Hayne. Partner Travis Winder reported the Hourglass was iced over and Hayne fell several hundred feet after a hold/ledge broke loose.
* Activity / location: Hourglass route / upper Hourglass area
* Status: Supported correction / qualification
* Sources: https://gazette.com/2010/06/16/fall-from-little-bear-peak-kills-highlands-ranch-teen-f182db58-e9e9-554c-8bc7-3feda243ef9e/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Kevin Hayne' and mountain = 'Little Bear Peak' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 57: Kevin Hayne matched % rows (expected 1)', n; end if;

  -- Edit 58: Andrew Graham Perkins
  -- now:  Andrew Graham Perkins | Little Bear Peak | 6/27/2026 | Fall | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Andrew Graham Perkins, 27 — retain date; fall initiated when a large chunk of rock broke loose; later died from severe injuries
* Why: AVSAR reported a significant fall after rock failure at the crux of West Ridge Indirect. Family obituary confirms Andrew Graham Perkins, 27, died in a mountain hiking accident on June 27, 2026.
* Activity / location: West Ridge Indirect approach
* Status: Supported correction / qualification
* Sources: https://coloradosun.com/2026/07/01/hiker-dies-little-bear-peak-alamosa-county/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Andrew Graham Perkins, 27 — retain date; fall initiated when a large chunk of rock broke loose; later died from severe injuries
* Why: AVSAR reported a significant fall after rock failure at the crux of West Ridge Indirect. Family obituary confirms Andrew Graham Perkins, 27, died in a mountain hiking accident on June 27, 2026.
* Activity / location: West Ridge Indirect approach
* Status: Supported correction / qualification
* Sources: https://coloradosun.com/2026/07/01/hiker-dies-little-bear-peak-alamosa-county/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Andrew Graham Perkins' and mountain = 'Little Bear Peak' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 58: Andrew Graham Perkins matched % rows (expected 1)', n; end if;

  -- Edit 59: Don Thurman
  -- now:  Don Thurman | Kit Carson Peak | 9/18/2010 | Fall | M | 60+
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age 63. Fatal fall after descent-route error near Kit Carson Avenue.
* Why: Experienced climber became separated from his partner after they missed the correct exit into Kit Carson Avenue; evidence suggests he entered steeper, looser terrain and fell.
* Activity / location: Kit Carson Avenue / steep terrain below missed exit
* Status: Supported correction / qualification
* Sources: https://100summits.com/articles/colorado-mountaineering-deaths/2010
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age 63. Fatal fall after descent-route error near Kit Carson Avenue.
* Why: Experienced climber became separated from his partner after they missed the correct exit into Kit Carson Avenue; evidence suggests he entered steeper, looser terrain and fell.
* Activity / location: Kit Carson Avenue / steep terrain below missed exit
* Status: Supported correction / qualification
* Sources: https://100summits.com/articles/colorado-mountaineering-deaths/2010
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Don Thurman' and mountain = 'Kit Carson Peak' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 59: Don Thurman matched % rows (expected 1)', n; end if;

  -- Edit 60: Michael Lepold
  -- now:  Michael Lepold | Kit Carson Peak | 8/17/2011 | Fall | M | 50-59
  update incidents set
    mountain = 'Challenger Point',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Move to Challenger Point; fatal fall during descent after summit.
* Why: A family member directly identified Mike Lepold as the Challenger Point fatality, stating he called his wife from the summit and fell during descent.
* Activity / location: Challenger Point descent
* Status: Supported correction / qualification
* Sources: https://14ers.com/forum/viewtopic.php?p=375624&style=10
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Move to Challenger Point; fatal fall during descent after summit.
* Why: A family member directly identified Mike Lepold as the Challenger Point fatality, stating he called his wife from the summit and fell during descent.
* Activity / location: Challenger Point descent
* Status: Supported correction / qualification
* Sources: https://14ers.com/forum/viewtopic.php?p=375624&style=10
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Michael Lepold' and mountain = 'Kit Carson Peak' and year = '2011';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 60: Michael Lepold matched % rows (expected 1)', n; end if;

  -- Edit 61: Michael Cormier
  -- now:  Michael Cormier | Kit Carson Peak | 7/19/2013 | Fall | M | 56
  update incidents set
    age = '50-59',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age 56. Evidence is consistent with a fatal fall while descending the alternate Class 4 North Ridge.
* Why: Climbers who spoke with Cormier said he was considering the North Ridge for descent; recovery location was consistent with that route. Exact fall sequence was not witnessed.
* Activity / location: Kit Carson North Ridge descent
* Status: Supported correction / qualification
* Sources: https://100summits.com/articles/colorado-mountaineering-deaths/2013
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age 56. Evidence is consistent with a fatal fall while descending the alternate Class 4 North Ridge.
* Why: Climbers who spoke with Cormier said he was considering the North Ridge for descent; recovery location was consistent with that route. Exact fall sequence was not witnessed.
* Activity / location: Kit Carson North Ridge descent
* Status: Supported correction / qualification
* Sources: https://100summits.com/articles/colorado-mountaineering-deaths/2013
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Michael Cormier' and mountain = 'Kit Carson Peak' and year = '2013';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 61: Michael Cormier matched % rows (expected 1)', n; end if;

  -- Edit 62: Tyler Cline
  -- now:  Tyler Cline | Kit Carson Peak | 6/27/2019 | Fall | M | 20-29
  update incidents set
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Record as Kit Carson–Challenger complex; body found 06/27 after he had been missing since 06/23. Fall is reported by family/secondary sources; official public reports did not release exact cause or route.
* Why: Search officials described the area as Kit Carson/Challenger and did not publish the exact route. Later reporting attributes the death to Challenger Point, so a single-peak Kit Carson label is too specific.
* Activity / location: Area between Kit Carson Peak and Challenger Point
* Status: Supported correction / qualification
* Sources: https://www.koaa.com/news/covering-colorado/2019/06/28/missing-hiker-found-dead-in-saguache-county/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Record as Kit Carson–Challenger complex; body found 06/27 after he had been missing since 06/23. Fall is reported by family/secondary sources; official public reports did not release exact cause or route.
* Why: Search officials described the area as Kit Carson/Challenger and did not publish the exact route. Later reporting attributes the death to Challenger Point, so a single-peak Kit Carson label is too specific.
* Activity / location: Area between Kit Carson Peak and Challenger Point
* Status: Supported correction / qualification
* Sources: https://www.koaa.com/news/covering-colorado/2019/06/28/missing-hiker-found-dead-in-saguache-county/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Tyler Cline' and mountain = 'Kit Carson Peak' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 62: Tyler Cline matched % rows (expected 1)', n; end if;

  -- Edit 63: Madeline Baharlou
  -- now:  Madeline Baharlou | Kit Carson Peak | 10/12/2021 | Unclear | F | 20-29
  update incidents set
    climber_name = 'Madeline Baharlou-Quivey',
    day = null,
    cause = 'Fall',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Madeline Baharlou-Quivey, 29 — accidental fall in Class 5 terrain. Alive when she texted for help 10/11; found deceased 10/13. Exact death date is not publicly established.
* Why: Current 10/12 date is plausible as an inferred date, but public reports establish only the 10/11–10/13 interval. Cause should be Fall, not Unclear.
* Activity / location: Off-route below standard route / below Kit Carson Avenue
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/madeline-baharlou-quivey-climber-death-kit-carson-peak-saguache-county-colorado/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Madeline Baharlou-Quivey, 29 — accidental fall in Class 5 terrain. Alive when she texted for help 10/11; found deceased 10/13. Exact death date is not publicly established.
* Why: Current 10/12 date is plausible as an inferred date, but public reports establish only the 10/11–10/13 interval. Cause should be Fall, not Unclear.
* Activity / location: Off-route below standard route / below Kit Carson Avenue
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/madeline-baharlou-quivey-climber-death-kit-carson-peak-saguache-county-colorado/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Madeline Baharlou' and mountain = 'Kit Carson Peak' and year = '2021';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 63: Madeline Baharlou matched % rows (expected 1)', n; end if;

  -- Edit 64: Luis Corkern
  -- now:  Luis Corkern | Kit Carson Peak | 7/9/2022 | Fall | M | 40-49
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 41. Climbed Kit Carson via North Ridge on 07/09; apparently fell from the connecting ridge into Kirk Couloir. Body found/recovered 07/12.
* Why: This is best recorded as a Kit Carson–Challenger connecting-terrain incident rather than Kit Carson alone. Preserve 07/09 as likely accident date and 07/12 as discovery/recovery/legal-date context.
* Activity / location: Kirk Couloir between Kit Carson Peak and Challenger Point
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2022/07/12/body-of-missing-hiker-found-near-kit-carson-peak-in-sangre-de-cristo-range-8a58b347-530e-5038-a01d-bd0a7aa69e89/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 41. Climbed Kit Carson via North Ridge on 07/09; apparently fell from the connecting ridge into Kirk Couloir. Body found/recovered 07/12.
* Why: This is best recorded as a Kit Carson–Challenger connecting-terrain incident rather than Kit Carson alone. Preserve 07/09 as likely accident date and 07/12 as discovery/recovery/legal-date context.
* Activity / location: Kirk Couloir between Kit Carson Peak and Challenger Point
* Status: Supported correction / qualification
* Sources: https://www.denvergazette.com/2022/07/12/body-of-missing-hiker-found-near-kit-carson-peak-in-sangre-de-cristo-range-8a58b347-530e-5038-a01d-bd0a7aa69e89/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Luis Corkern' and mountain = 'Kit Carson Peak' and year = '2022';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 64: Luis Corkern matched % rows (expected 1)', n; end if;

  -- Edit 65: Jesse Peterson
  -- now:  Jesse Peterson | Challenger Point | 5/25/2012 | Accident, other | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Willow Lake canoe accident; presumed drowned after canoe overturned in high winds. Not a Challenger Point climbing fatality.
* Why: Natalie Brechtel reached shore with hypothermia. Search for Peterson was called off after authorities spoke with family; sheriff''s officials said he was presumed dead.
* Activity / location: Willow Lake
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/man-missing-after-canoe-accident-in-southern-colorado/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Willow Lake canoe accident; presumed drowned after canoe overturned in high winds. Not a Challenger Point climbing fatality.
* Why: Natalie Brechtel reached shore with hypothermia. Search for Peterson was called off after authorities spoke with family; sheriff''s officials said he was presumed dead.
* Activity / location: Willow Lake
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/man-missing-after-canoe-accident-in-southern-colorado/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jesse Peterson' and mountain = 'Challenger Point' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 65: Jesse Peterson matched % rows (expected 1)', n; end if;

  -- Edit 66: Jamie Rupp
  -- now:  Jamie Rupp | Challenger Point | 9/3/2017 | Fall | F | 50-59
  update incidents set
    climber_name = 'James Clarke “Jamie” Rupp',
    gender = 'M',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Dr. James Clarke “Jamie” Rupp, male, age 54 — retain date/cause; fatal fall of several hundred feet.
* Why: Current sheet incorrectly lists Rupp as female. Obituary confirms he died Sept. 3, 2017 while hiking Challenger Point.
* Activity / location: Challenger Point
* Status: Supported correction / qualification
* Sources: https://www.westword.com/news/dr-jamie-rupp-tenth-to-die-on-a-colorado-fourteener-in-2017-9451969/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Dr. James Clarke “Jamie” Rupp, male, age 54 — retain date/cause; fatal fall of several hundred feet.
* Why: Current sheet incorrectly lists Rupp as female. Obituary confirms he died Sept. 3, 2017 while hiking Challenger Point.
* Activity / location: Challenger Point
* Status: Supported correction / qualification
* Sources: https://www.westword.com/news/dr-jamie-rupp-tenth-to-die-on-a-colorado-fourteener-in-2017-9451969/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jamie Rupp' and mountain = 'Challenger Point' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 66: Jamie Rupp matched % rows (expected 1)', n; end if;

  -- Edit 67: Dan Wallick
  -- now:  Dan Wallick | Challenger Point | 7/28/2019 | Unclear | M | 40-49
  update incidents set
    climber_name = 'Daniel Paul Wallick',
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Lt. Col. Daniel Paul Wallick, 41 — confirmed death after summiting both Challenger and Kit Carson. Last contact 07/24; body recovered 07/28; exact accident date and cause remain unclear.
* Why: He texted family after summiting both peaks. Public search reporting did not establish the exact route taken from the saddle or the cause of death.
* Activity / location: Kit Carson–Challenger complex / descent from saddle
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/dan-wallick-air-force-colorado-springs/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Lt. Col. Daniel Paul Wallick, 41 — confirmed death after summiting both Challenger and Kit Carson. Last contact 07/24; body recovered 07/28; exact accident date and cause remain unclear.
* Why: He texted family after summiting both peaks. Public search reporting did not establish the exact route taken from the saddle or the cause of death.
* Activity / location: Kit Carson–Challenger complex / descent from saddle
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/dan-wallick-air-force-colorado-springs/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Dan Wallick' and mountain = 'Challenger Point' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 67: Dan Wallick matched % rows (expected 1)', n; end if;

  -- Edit 68: Herbert "Herb" Martin
  -- now:  Herbert "Herb" Martin | Mount Wilson | --/--/1950 | Falling rock/ice | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: 1950s — exact year/date unresolved. Historical club account says Martin was killed by a falling boulder while climbing the steep east side of Mount Wilson.
* Why: The Los Alamos Mountaineers history confirms the fatality but only dates it to the 1950s. The source says a club member believed a boulder knocked loose by another climber struck Martin. The current exact 1950 year is not yet supported.
* Activity / location: Mount Wilson east side
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.lamountaineers.org/drupal7/history9
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: 1950s — exact year/date unresolved. Historical club account says Martin was killed by a falling boulder while climbing the steep east side of Mount Wilson.
* Why: The Los Alamos Mountaineers history confirms the fatality but only dates it to the 1950s. The source says a club member believed a boulder knocked loose by another climber struck Martin. The current exact 1950 year is not yet supported.
* Activity / location: Mount Wilson east side
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.lamountaineers.org/drupal7/history9
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Herbert "Herb" Martin' and mountain = 'Mount Wilson' and year = '1950';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 68: Herbert "Herb" Martin matched % rows (expected 1)', n; end if;

  -- Edit 69: Erling Hansen
  -- now:  Erling Hansen | El Diente Peak | 9/15/1991 | Fall | M | Unknown
  update incidents set
    age = '60+',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age 69. Fatal fall during descent after evidence indicated he had reached El Diente''s summit, completing his Colorado Fourteeners.
* Why: Historical reconstruction cites Colorado Mountain Club Trail and Timberline material and summit evidence. Hansen was listed among those completing all 54 recognized Fourteeners of that era.
* Activity / location: El Diente descent
* Status: Supported correction / qualification
* Sources: https://14ers.com/forum/viewtopic.php?p=701288&style=8
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age 69. Fatal fall during descent after evidence indicated he had reached El Diente''s summit, completing his Colorado Fourteeners.
* Why: Historical reconstruction cites Colorado Mountain Club Trail and Timberline material and summit evidence. Hansen was listed among those completing all 54 recognized Fourteeners of that era.
* Activity / location: El Diente descent
* Status: Supported correction / qualification
* Sources: https://14ers.com/forum/viewtopic.php?p=701288&style=8
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Erling Hansen' and mountain = 'El Diente Peak' and year = '1991';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 69: Erling Hansen matched % rows (expected 1)', n; end if;

  -- Edit 70: Peter Topp
  -- now:  Peter Topp | El Diente Peak | 7/26/2010 | Falling rock/ice | M | 50-59
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Mount Wilson–El Diente Traverse; age 59. Rockslide caused fatal blunt-force trauma.
* Why: AAC explicitly classifies the accident as the Mount Wilson–El Diente Traverse. AAC says Topp''s party was moving from Mount Wilson toward El Diente; some secondary retellings reverse the direction, so the traverse classification is more defensible than assigning the fatality solely to El Diente.
* Activity / location: Mount Wilson–El Diente connecting ridge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201105000/Fall-on-Rock-Rockslide-Colorado-Mount-Wilson-El-Diente-Traverse
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Mount Wilson–El Diente Traverse; age 59. Rockslide caused fatal blunt-force trauma.
* Why: AAC explicitly classifies the accident as the Mount Wilson–El Diente Traverse. AAC says Topp''s party was moving from Mount Wilson toward El Diente; some secondary retellings reverse the direction, so the traverse classification is more defensible than assigning the fatality solely to El Diente.
* Activity / location: Mount Wilson–El Diente connecting ridge
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201105000/Fall-on-Rock-Rockslide-Colorado-Mount-Wilson-El-Diente-Traverse
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Peter Topp' and mountain = 'El Diente Peak' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 70: Peter Topp matched % rows (expected 1)', n; end if;

  -- Edit 71: John Merrill
  -- now:  John Merrill | El Diente Peak | 9/26/2010 | Falling rock/ice | M | 30-39
  update incidents set
    climber_name = 'John Arthur Merrill',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: John Arthur Merrill, 30 — crushed by rockfall on El Diente while climbing solo with his dog, Oof.
* Why: Contemporary reporting preserved in later sources identifies Merrill as a Cortez climber killed by rockfall; his dog survived and stayed near him until rescuers arrived.
* Activity / location: El Diente, south-side terrain
* Status: Supported correction / qualification
* Sources: https://100summits.com/articles/colorado-mountaineering-deaths/2010
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: John Arthur Merrill, 30 — crushed by rockfall on El Diente while climbing solo with his dog, Oof.
* Why: Contemporary reporting preserved in later sources identifies Merrill as a Cortez climber killed by rockfall; his dog survived and stayed near him until rescuers arrived.
* Activity / location: El Diente, south-side terrain
* Status: Supported correction / qualification
* Sources: https://100summits.com/articles/colorado-mountaineering-deaths/2010
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'John Merrill' and mountain = 'El Diente Peak' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 71: John Merrill matched % rows (expected 1)', n; end if;

  -- Edit 72: John James Coffee
  -- now:  John James Coffee | El Diente Peak | 7/22/2024 | Fall | M | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 21 — approximately 800-foot fatal fall from the El Diente–Mount Wilson traverse.
* Why: San Miguel County reporting places Coffee on the technical ridge between El Diente and Mount Wilson, not on El Diente alone. He fell southward roughly 800 feet.
* Activity / location: El Diente–Mount Wilson traverse / Organ Pipes area
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/young-men-died-colorado-peaks-identified-el-diente-wilson-lone-eagle-kubiniec-coffee/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 21 — approximately 800-foot fatal fall from the El Diente–Mount Wilson traverse.
* Why: San Miguel County reporting places Coffee on the technical ridge between El Diente and Mount Wilson, not on El Diente alone. He fell southward roughly 800 feet.
* Activity / location: El Diente–Mount Wilson traverse / Organ Pipes area
* Status: Supported correction / qualification
* Sources: https://www.cbsnews.com/colorado/news/young-men-died-colorado-peaks-identified-el-diente-wilson-lone-eagle-kubiniec-coffee/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'John James Coffee' and mountain = 'El Diente Peak' and year = '2024';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 72: John James Coffee matched % rows (expected 1)', n; end if;

  -- Edit 73: Herbert "Hal" Wise Jr
  -- now:  Herbert "Hal" Wise Jr | Wilson Peak | 9/25/2024 | Fall | M | 50-59
  update incidents set
    climber_name = 'Herbert M. “Hal” Wise',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Herbert M. "Hal" Wise, 53 — 300–400-foot fall while ascending toward Wilson Peak; fatal head injury. Jr. suffix not supported by sources reviewed.
* Why: San Miguel County reporting confirms the 300–400-foot fall and fatal head injury. Adirondack 46ers memorial and obituary identify him as Herbert M. "Hal" Wise, age 53.
* Activity / location: Wilson Peak / Rock of Ages route, Bilk Creek side
* Status: Supported correction / qualification
* Sources: https://adk46er.org/in-memoriam/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Herbert M. "Hal" Wise, 53 — 300–400-foot fall while ascending toward Wilson Peak; fatal head injury. Jr. suffix not supported by sources reviewed.
* Why: San Miguel County reporting confirms the 300–400-foot fall and fatal head injury. Adirondack 46ers memorial and obituary identify him as Herbert M. "Hal" Wise, age 53.
* Activity / location: Wilson Peak / Rock of Ages route, Bilk Creek side
* Status: Supported correction / qualification
* Sources: https://adk46er.org/in-memoriam/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Herbert "Hal" Wise Jr' and mountain = 'Wilson Peak' and year = '2024';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 73: Herbert "Hal" Wise Jr matched % rows (expected 1)', n; end if;

  -- Edit 74: Heinz Pagels
  -- now:  Heinz Pagels | Pyramid Peak | 7/23/1988 | Fall | M | 40-49
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; age 49. Fatal fall during descent after climbing Pyramid Peak.
* Why: Aspen Center for Physics memorial history confirms Pagels fell to his death on Pyramid Peak on July 23, 1988. Accounts describe unstable rock and a fall/slide into steep terrain.
* Activity / location: Pyramid Peak descent
* Status: Supported correction / qualification
* Sources: https://aspenphys.org/people/heinz-pagels/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; age 49. Fatal fall during descent after climbing Pyramid Peak.
* Why: Aspen Center for Physics memorial history confirms Pagels fell to his death on Pyramid Peak on July 23, 1988. Accounts describe unstable rock and a fall/slide into steep terrain.
* Activity / location: Pyramid Peak descent
* Status: Supported correction / qualification
* Sources: https://aspenphys.org/people/heinz-pagels/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Heinz Pagels' and mountain = 'Pyramid Peak' and year = '1988';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 74: Heinz Pagels matched % rows (expected 1)', n; end if;

  -- Edit 75: David Morano
  -- now:  David Morano | Pyramid Peak | 9/10/2011 | Fall | M | 40-49
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Thunder Pyramid — age 41; 200–300-foot fall from a ridge near Thunder Pyramid. Body recovered 09/14.
* Why: Pitkin County reporting places Morano near Thunder Pyramid, not Pyramid Peak proper. This should not count as a Pyramid Peak fatality.
* Activity / location: Thunder Pyramid ridge, about one mile south of Pyramid Peak
* Status: Supported correction / qualification
* Sources: https://archives2.realvail.com/article/974/Dillon-climbers-body-recovered-from-Thunder-Pyramid-Peak-near-Aspen
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Thunder Pyramid — age 41; 200–300-foot fall from a ridge near Thunder Pyramid. Body recovered 09/14.
* Why: Pitkin County reporting places Morano near Thunder Pyramid, not Pyramid Peak proper. This should not count as a Pyramid Peak fatality.
* Activity / location: Thunder Pyramid ridge, about one mile south of Pyramid Peak
* Status: Supported correction / qualification
* Sources: https://archives2.realvail.com/article/974/Dillon-climbers-body-recovered-from-Thunder-Pyramid-Peak-near-Aspen
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'David Morano' and mountain = 'Pyramid Peak' and year = '2011';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 75: David Morano matched % rows (expected 1)', n; end if;

  -- Edit 76: Steve Gladbach
  -- now:  Steve Gladbach | Pyramid Peak | 6/23/2013 | Fall | M | 50-59
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Thunder Pyramid / Lightning Pyramid terrain — age 52; fatal fall after a successful Thunder Pyramid ascent.
* Why: AAC classifies the incident as Thunder Pyramid. A local correction says Gladbach had traversed toward Lightning Pyramid when he fell. Either way, the source-sheet Pyramid Peak attribution is incorrect.
* Activity / location: Thunder Pyramid massif; corrected local account places fall on Lightning Pyramid terrain
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201213027/Fall-on-Rock-Climbing-Alone-and-Unroped
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Thunder Pyramid / Lightning Pyramid terrain — age 52; fatal fall after a successful Thunder Pyramid ascent.
* Why: AAC classifies the incident as Thunder Pyramid. A local correction says Gladbach had traversed toward Lightning Pyramid when he fell. Either way, the source-sheet Pyramid Peak attribution is incorrect.
* Activity / location: Thunder Pyramid massif; corrected local account places fall on Lightning Pyramid terrain
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13201213027/Fall-on-Rock-Climbing-Alone-and-Unroped
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Steve Gladbach' and mountain = 'Pyramid Peak' and year = '2013';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 76: Steve Gladbach matched % rows (expected 1)', n; end if;

  -- Edit 77: Albert Castellano
  -- now:  Albert Castellano | Snowmass Mountain | 8/16/2003 | Fall | M | 50-59
  update incidents set
    climber_name = 'Steve Castellano',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Steve Castellano, 51 — retain date; approximately 150-foot fall after a loose rock/handhold gave way.
* Why: AAC and contemporaneous reporting identify the victim as Steve Castellano of Littleton, not Albert. Recent rain had softened soil beneath the loose rock.
* Activity / location: Snowmass Mountain descent
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200406301
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Steve Castellano, 51 — retain date; approximately 150-foot fall after a loose rock/handhold gave way.
* Why: AAC and contemporaneous reporting identify the victim as Steve Castellano of Littleton, not Albert. Recent rain had softened soil beneath the loose rock.
* Activity / location: Snowmass Mountain descent
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13200406301
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Albert Castellano' and mountain = 'Snowmass Mountain' and year = '2003';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 77: Albert Castellano matched % rows (expected 1)', n; end if;

  -- Edit 78: Sean A. Wylam
  -- now:  Sean A. Wylam | Snowmass Mountain | 7/24/2011 | Fall | M | 20-29
  update incidents set
    cause = 'Falling rock/ice',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 25 — Rockslide / falling rock; fatal injuries shortly after summiting Snowmass Mountain.
* Why: Sheriff reporting describes a rockfall on descent; obituary calls it a massive rock slide. Database taxonomy is better represented by Falling rock/ice than a generic Fall.
* Activity / location: Southwest aspect / descent from summit
* Status: Supported correction / qualification
* Sources: https://archives2.realvail.com/article/810/Climber-dies-in-rockfall-descending-Snowmasss-Mountain
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 25 — Rockslide / falling rock; fatal injuries shortly after summiting Snowmass Mountain.
* Why: Sheriff reporting describes a rockfall on descent; obituary calls it a massive rock slide. Database taxonomy is better represented by Falling rock/ice than a generic Fall.
* Activity / location: Southwest aspect / descent from summit
* Status: Supported correction / qualification
* Sources: https://archives2.realvail.com/article/810/Climber-dies-in-rockfall-descending-Snowmasss-Mountain
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Sean A. Wylam' and mountain = 'Snowmass Mountain' and year = '2011';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 78: Sean A. Wylam matched % rows (expected 1)', n; end if;

  -- Edit 79: Rob Jansen
  -- now:  Rob Jansen | Snowmass Mountain | 8/25/2012 | Fall | M | Unknown
  update incidents set
    climber_name = 'Robert “Rob” Jansen',
    age = '20-29',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Robert “Rob” Jansen, 24 — rockslide/fall while traversing from Snowmass Mountain toward Hagerman Peak.
* Why: Pitkin County reporting places the fatal rock slide near Hagerman Peak. Climbing-community accounts say the party had summited Snowmass and was traversing toward Hagerman. Better treated as associated connecting terrain than Snowmass alone.
* Activity / location: Snowmass–Hagerman connecting ridge / Hagerman side
* Status: Supported correction / qualification
* Sources: https://www.stamfordadvocate.com/local/article/new-canaan-man-killed-in-rock-slide-3819348.php
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Robert “Rob” Jansen, 24 — rockslide/fall while traversing from Snowmass Mountain toward Hagerman Peak.
* Why: Pitkin County reporting places the fatal rock slide near Hagerman Peak. Climbing-community accounts say the party had summited Snowmass and was traversing toward Hagerman. Better treated as associated connecting terrain than Snowmass alone.
* Activity / location: Snowmass–Hagerman connecting ridge / Hagerman side
* Status: Supported correction / qualification
* Sources: https://www.stamfordadvocate.com/local/article/new-canaan-man-killed-in-rock-slide-3819348.php
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Rob Jansen' and mountain = 'Snowmass Mountain' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 79: Rob Jansen matched % rows (expected 1)', n; end if;

  -- Edit 80: Neil Campbell
  -- now:  Neil Campbell | Blanca Peak | 6/--/1960 | Unclear | M | Unknown
  update incidents set
    month = null,
    cause = 'Fall',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Circa 1960 — fatal fall near Blanca Peak/glacier; exact month not yet supported. Historical club source says two members died, not one.
* Why: Los Alamos Mountaineers history says Neil Campbell and a partner were killed near Blanca around 1960; a regional historical account describes two New Mexico climbers killed in a fall near the glacier. The current June date and single-victim representation need stronger sourcing.
* Activity / location: Near Blanca Peak / glacier area
* Status: Supported correction / qualification
* Sources: https://lamountaineers.org/drupal7/history9
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Circa 1960 — fatal fall near Blanca Peak/glacier; exact month not yet supported. Historical club source says two members died, not one.
* Why: Los Alamos Mountaineers history says Neil Campbell and a partner were killed near Blanca around 1960; a regional historical account describes two New Mexico climbers killed in a fall near the glacier. The current June date and single-victim representation need stronger sourcing.
* Activity / location: Near Blanca Peak / glacier area
* Status: Supported correction / qualification
* Sources: https://lamountaineers.org/drupal7/history9
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Neil Campbell' and mountain = 'Blanca Peak' and year = '1960';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 80: Neil Campbell matched % rows (expected 1)', n; end if;

  -- Edit 81: Michael Levine
  -- now:  Michael Levine | Blanca Peak | 7/28/1986 | Fall | M | 40-49
  update incidents set
    age = '40-49',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 42 — fatal fall from rocky ridge south of Ellingwood summit while apparently continuing toward Blanca.
* Why: AAC says the party climbed Ellingwood''s east side; Levine continued alone and apparently fell while dropping south from Ellingwood toward Blanca. Body was found ~245 m below the Ellingwood summit. Do not count solely against Blanca.
* Activity / location: Ellingwood–Blanca connecting ridge / below Ellingwood
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13198705503/Fall-on-Rock-Party-Separated-Climbing-Alone-Colorado-Sangre-de-Cristo-Range
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 42 — fatal fall from rocky ridge south of Ellingwood summit while apparently continuing toward Blanca.
* Why: AAC says the party climbed Ellingwood''s east side; Levine continued alone and apparently fell while dropping south from Ellingwood toward Blanca. Body was found ~245 m below the Ellingwood summit. Do not count solely against Blanca.
* Activity / location: Ellingwood–Blanca connecting ridge / below Ellingwood
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13198705503/Fall-on-Rock-Party-Separated-Climbing-Alone-Colorado-Sangre-de-Cristo-Range
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Michael Levine' and mountain = 'Blanca Peak' and year = '1986';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 81: Michael Levine matched % rows (expected 1)', n; end if;

  -- Edit 82: Barney Cruz
  -- now:  Barney Cruz | Blanca Peak | 7/28/2017 | Fall | M | 20-29
  update incidents set
    climber_name = 'Barney Cruz IV',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Barney Cruz IV, age 27 — retain date/cause; fatal hiking fall on Blanca Peak.
* Why: Obituary confirms age 27, death date July 28, 2017, hiking accident in Colorado, and thanks the teams involved in recovering him from Mt. Blanca.
* Activity / location: Blanca Peak
* Status: Supported correction / qualification
* Sources: https://www.treshewell.com/obituaries/barney-iv
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Barney Cruz IV, age 27 — retain date/cause; fatal hiking fall on Blanca Peak.
* Why: Obituary confirms age 27, death date July 28, 2017, hiking accident in Colorado, and thanks the teams involved in recovering him from Mt. Blanca.
* Activity / location: Blanca Peak
* Status: Supported correction / qualification
* Sources: https://www.treshewell.com/obituaries/barney-iv
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Barney Cruz' and mountain = 'Blanca Peak' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 82: Barney Cruz matched % rows (expected 1)', n; end if;

  -- Edit 83: Vaughn Fetzer
  -- now:  Vaughn Fetzer | Blanca Peak | 9/18/2021 | Unclear | M | 50-59
  update incidents set
    cause = 'Fall',
    age = '50-59',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 57 — Fall during descent from Blanca after reaching the summit; retain 09/18 as last-contact/likely accident date.
* Why: Undersheriff told McClatchy Fetzer reached the summit and fell to his death during descent. Friends located his body Sept. 26; recovery was Sept. 27. Cause should be Fall, not Unclear.
* Activity / location: East side of Blanca / steep gullies below Gash Ridge
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.sacbee.com/news/nation-world/national/article254587917.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 57 — Fall during descent from Blanca after reaching the summit; retain 09/18 as last-contact/likely accident date.
* Why: Undersheriff told McClatchy Fetzer reached the summit and fell to his death during descent. Friends located his body Sept. 26; recovery was Sept. 27. Cause should be Fall, not Unclear.
* Activity / location: East side of Blanca / steep gullies below Gash Ridge
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.sacbee.com/news/nation-world/national/article254587917.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Vaughn Fetzer' and mountain = 'Blanca Peak' and year = '2021';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 83: Vaughn Fetzer matched % rows (expected 1)', n; end if;

  -- Edit 84: Justin Seagren
  -- now:  Justin Seagren | Blanca Peak | 9/7/2022 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain date/cause; fell several hundred feet while descending Blanca''s standard route.
* Why: AVSAR was activated on Sept. 7; Flight for Life located him, and technical teams recovered his body after hauling him back to the ridgeline near the Blanca–Ellingwood saddle.
* Activity / location: Blanca descent / near Blanca–Ellingwood saddle
* Status: Supported correction / qualification
* Sources: https://www.denver7.com/news/local-news/mans-body-recovered-after-fall-off-blanca-peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain date/cause; fell several hundred feet while descending Blanca''s standard route.
* Why: AVSAR was activated on Sept. 7; Flight for Life located him, and technical teams recovered his body after hauling him back to the ridgeline near the Blanca–Ellingwood saddle.
* Activity / location: Blanca descent / near Blanca–Ellingwood saddle
* Status: Supported correction / qualification
* Sources: https://www.denver7.com/news/local-news/mans-body-recovered-after-fall-off-blanca-peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Justin Seagren' and mountain = 'Blanca Peak' and year = '2022';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 84: Justin Seagren matched % rows (expected 1)', n; end if;

  -- Edit 85: Joy Cipoletti
  -- now:  Joy Cipoletti | Ellingwood Point | 10/11/2020 | Fall | F | 60+
  update incidents set
    day = null,
    age = '60+',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Likely 10/10/2020 — age 60; 500–800-foot fatal fall while descending the exposed Class III north ridge. Found 10/15.
* Why: AAC says Cipoletti reached the summit and texted her daughter around 3 p.m. Oct. 10, then turned around to descend. She was reported overdue afterward and found Oct. 15. The source-sheet Oct. 11 date appears to reflect the overdue/search timeline, not the likely accident date.
* Activity / location: Ellingwood Point north ridge / couloir below route
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13201215906
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Likely 10/10/2020 — age 60; 500–800-foot fatal fall while descending the exposed Class III north ridge. Found 10/15.
* Why: AAC says Cipoletti reached the summit and texted her daughter around 3 p.m. Oct. 10, then turned around to descend. She was reported overdue afterward and found Oct. 15. The source-sheet Oct. 11 date appears to reflect the overdue/search timeline, not the likely accident date.
* Activity / location: Ellingwood Point north ridge / couloir below route
* Status: Supported fields / qualified dates and mechanism
* Sources: https://publications.americanalpineclub.org/articles/13201215906
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Joy Cipoletti' and mountain = 'Ellingwood Point' and year = '2020';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 85: Joy Cipoletti matched % rows (expected 1)', n; end if;

  -- Edit 86: Michelle Vanek
  -- now:  Michelle Vanek | Mount of the Holy Cross | 9/24/2005 | Fall | F | 30-39
  update incidents set
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 35; disappearance/likely accident 09/24/2005. Remains recovered in 2024. Describe cause as probable fall; exact mechanism remains unresolved.
* Why: Source row 75. Firsthand VMRG recovery account records personal effects found 09/13/2024 and an October 10–11 recovery mission. Its detailed diary places skeletal recovery on October 11. Colorado Sun reports SAR evidence supports a likely fall below the summit: https://coloradosun.com/2025/10/13/missing-hiker-14er-vail/ . No public coroner determination was located. Do not assert a cornice failure or another specific trigger.
* Activity / location: Halo Ridge attempt; terrain below north ridge / Angelica Couloir area
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.vailmag.com/best-of-vail/2025/09/final-search-michelle-vanek-mount-holy-cross https://coloradosun.com/2025/10/13/missing-hiker-14er-vail/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 35; disappearance/likely accident 09/24/2005. Remains recovered in 2024. Describe cause as probable fall; exact mechanism remains unresolved.
* Why: Source row 75. Firsthand VMRG recovery account records personal effects found 09/13/2024 and an October 10–11 recovery mission. Its detailed diary places skeletal recovery on October 11. Colorado Sun reports SAR evidence supports a likely fall below the summit: https://coloradosun.com/2025/10/13/missing-hiker-14er-vail/ . No public coroner determination was located. Do not assert a cornice failure or another specific trigger.
* Activity / location: Halo Ridge attempt; terrain below north ridge / Angelica Couloir area
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.vailmag.com/best-of-vail/2025/09/final-search-michelle-vanek-mount-holy-cross https://coloradosun.com/2025/10/13/missing-hiker-14er-vail/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Michelle Vanek' and mountain = 'Mount of the Holy Cross' and year = '2005';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 86: Michelle Vanek matched % rows (expected 1)', n; end if;

  -- Edit 87: James Nelson
  -- now:  James Nelson | Mount of the Holy Cross | 10/3/2010 | Unclear | M | 30-39
  update incidents set
    climber_name = 'James Brian “JB” Nelson',
    day = null,
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: James Brian (JB) Nelson, 31. Recommend October 2010, exact day unknown; retain cause Unclear. Classify as Holy Cross Wilderness campsite death rather than confirmed summit-route death.
* Why: Source row 104. Family obituary narrative specifies October 2010, while its generated header displays October 1. October 3 is associated with departure/last-seen reporting, not a verified death date. A reproduced sheriff release reports campsite discovery May 25, 2012 and remains recovery May 26; journal suggested possible altitude illness, not an established cause: https://archives2.realvail.com/article/1450/Sheriff-locates-campsite-with-human-remains-believed-to-be-missing-Chicago-hiker-James-Nelson . Planned summit does not establish where he died.
* Activity / location: Backpacking; campsite near Holy Cross City
* Status: Supported correction / qualification
* Sources: https://www.caldwellparrish.com/obituaries/james-brian-nelson https://archives2.realvail.com/article/1450/Sheriff-locates-campsite-with-human-remains-believed-to-be-missing-Chicago-hiker-James-Nelson
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: James Brian (JB) Nelson, 31. Recommend October 2010, exact day unknown; retain cause Unclear. Classify as Holy Cross Wilderness campsite death rather than confirmed summit-route death.
* Why: Source row 104. Family obituary narrative specifies October 2010, while its generated header displays October 1. October 3 is associated with departure/last-seen reporting, not a verified death date. A reproduced sheriff release reports campsite discovery May 25, 2012 and remains recovery May 26; journal suggested possible altitude illness, not an established cause: https://archives2.realvail.com/article/1450/Sheriff-locates-campsite-with-human-remains-believed-to-be-missing-Chicago-hiker-James-Nelson . Planned summit does not establish where he died.
* Activity / location: Backpacking; campsite near Holy Cross City
* Status: Supported correction / qualification
* Sources: https://www.caldwellparrish.com/obituaries/james-brian-nelson https://archives2.realvail.com/article/1450/Sheriff-locates-campsite-with-human-remains-believed-to-be-missing-Chicago-hiker-James-Nelson
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'James Nelson' and mountain = 'Mount of the Holy Cross' and year = '2010';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 87: James Nelson matched % rows (expected 1)', n; end if;

  -- Edit 88: Peter Clarke
  -- now:  Peter Clarke | Mount Sneffels | 7/--/2021 | Fall | M | 50-59
  update incidents set
    climber_name = 'Peter Andrew Clarke',
    day = '2',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Peter Andrew Clarke, age 54; accident 2021-07-02; body recovery 2021-07-03. Retain Fall and male / 50–59 age band.
* Why: Source row 228. July 3 initial local report describes Friday''s summit/descent and Saturday recovery: Friday was July 2. July 7 follow-up supplies full name and age. Some syndicated summaries call the accident Saturday; local reporting separates accident and recovery. This is a recommendation only.
* Activity / location: Solo descent of Southwest Ridge after summit; reported fall approximately 1,000 feet.
* Status: Supported correction / qualification
* Sources: https://www.ouraynews.com/2021/07/07/man-killed-in-climbing-accident-on-sneffels/ https://www.ouraynews.com/2021/07/03/mountain-climber-killed-in-fall-on-sneffels/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Peter Andrew Clarke, age 54; accident 2021-07-02; body recovery 2021-07-03. Retain Fall and male / 50–59 age band.
* Why: Source row 228. July 3 initial local report describes Friday''s summit/descent and Saturday recovery: Friday was July 2. July 7 follow-up supplies full name and age. Some syndicated summaries call the accident Saturday; local reporting separates accident and recovery. This is a recommendation only.
* Activity / location: Solo descent of Southwest Ridge after summit; reported fall approximately 1,000 feet.
* Status: Supported correction / qualification
* Sources: https://www.ouraynews.com/2021/07/07/man-killed-in-climbing-accident-on-sneffels/ https://www.ouraynews.com/2021/07/03/mountain-climber-killed-in-fall-on-sneffels/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Peter Clarke' and mountain = 'Mount Sneffels' and year = '2021';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 88: Peter Clarke matched % rows (expected 1)', n; end if;

  -- Edit 89: Bret Brachman-Goldstein
  -- now:  Bret Brachman-Goldstein | Mount Sneffels | 6/10/2026 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain 2026-06-10, Bret Brachman-Goldstein, age 32; optional full name Bret Gunar Brachman-Goldstein. Describe Fall as reported by family / suspected by investigators, not a final coroner determination.
* Why: Source row 250. Funeral-home obituary supports June 10 and a fall on Sneffels. Local coroner reporting records June 11 discovery and a suspected fall on scree. June reports said cause/manner pending autopsy/toxicology; no later public final determination located in this pass. Keep accident date distinct from discovery. Avoid misspellings Brett/Brockman/Bachman found in derivative reporting.
* Activity / location: Mount Sneffels; running/climbing reported. Exact accident point and trigger not independently established in this pass.
* Status: Supported correction / qualification
* Sources: https://www.crippinfuneralhome.com/obituaries/bret-brachman-goldstein https://www.ouraynews.com/2026/06/15/montrose-man-identified-mt-sneffels-fatality/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain 2026-06-10, Bret Brachman-Goldstein, age 32; optional full name Bret Gunar Brachman-Goldstein. Describe Fall as reported by family / suspected by investigators, not a final coroner determination.
* Why: Source row 250. Funeral-home obituary supports June 10 and a fall on Sneffels. Local coroner reporting records June 11 discovery and a suspected fall on scree. June reports said cause/manner pending autopsy/toxicology; no later public final determination located in this pass. Keep accident date distinct from discovery. Avoid misspellings Brett/Brockman/Bachman found in derivative reporting.
* Activity / location: Mount Sneffels; running/climbing reported. Exact accident point and trigger not independently established in this pass.
* Status: Supported correction / qualification
* Sources: https://www.crippinfuneralhome.com/obituaries/bret-brachman-goldstein https://www.ouraynews.com/2026/06/15/montrose-man-identified-mt-sneffels-fatality/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Bret Brachman-Goldstein' and mountain = 'Mount Sneffels' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 89: Bret Brachman-Goldstein matched % rows (expected 1)', n; end if;

  -- Edit 90: Drew Sikes
  -- now:  Drew Sikes | Castle Peak | 9/6/2026 | Fall | M | 30-39
  update incidents set
    climber_name = 'Andrew Tyler “Drew” Sikes',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Andrew Tyler “Drew” Sikes, 37; retain date, male and 30–39 age band. Retain reported Fall; see unnamed row 257.
* Why: Source row 256. Funeral-home obituary places death on an Aspen-area 14er that day but does not name Castle. Contemporary rescue reporting describes one Castle fatality; together these support the link, without an official named mission/coroner release.
* Activity / location: Castle Peak, north face
* Status: Supported correction / qualification
* Sources: https://www.legacy.com/us/obituaries/name/andrew-sikes-obituary?id=62372177 https://krdo.com/news/2026/09/07/hiker-dies-castle-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Andrew Tyler “Drew” Sikes, 37; retain date, male and 30–39 age band. Retain reported Fall; see unnamed row 257.
* Why: Source row 256. Funeral-home obituary places death on an Aspen-area 14er that day but does not name Castle. Contemporary rescue reporting describes one Castle fatality; together these support the link, without an official named mission/coroner release.
* Activity / location: Castle Peak, north face
* Status: Supported correction / qualification
* Sources: https://www.legacy.com/us/obituaries/name/andrew-sikes-obituary?id=62372177 https://krdo.com/news/2026/09/07/hiker-dies-castle-peak/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Drew Sikes' and mountain = 'Castle Peak' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 90: Drew Sikes matched % rows (expected 1)', n; end if;

  -- Edit 91: Unnamed
  -- now:  Unnamed | Conundrum Peak | 7/29/2023 | Avalanche | M | 30-39
  update incidents set
    cause = 'Unclear',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Male Aspen resident, 37. July 29 is intended hike date, not independently established death date; located July 31 and recovered August 2, 2023. Cause unresolved; Avalanche not supported by retrieved reports.
* Why: Source row 241. A body partly covered by snow does not establish an avalanche. Contemporary coverage says official cause and identity had not been released. Keep July 29 as presumed/last-planned-outing date; do not substitute recovery date for death date.
* Activity / location: Conundrum Couloir, in Castle/Conundrum search area
* Status: Supported fields / qualified dates and mechanism
* Sources: https://snowbrains.com/body-of-hiker-without-mountaineering-boots-crampons-or-helmet-recovered-from-snowy-couloir-on-aspen-co-14er/ https://www.denvergazette.com/outtherecolorado/2023/08/03/man-found-dead-after-shoes-and-legs-spotted-protruding-from-snow-in-colorado-couloir/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Male Aspen resident, 37. July 29 is intended hike date, not independently established death date; located July 31 and recovered August 2, 2023. Cause unresolved; Avalanche not supported by retrieved reports.
* Why: Source row 241. A body partly covered by snow does not establish an avalanche. Contemporary coverage says official cause and identity had not been released. Keep July 29 as presumed/last-planned-outing date; do not substitute recovery date for death date.
* Activity / location: Conundrum Couloir, in Castle/Conundrum search area
* Status: Supported fields / qualified dates and mechanism
* Sources: https://snowbrains.com/body-of-hiker-without-mountaineering-boots-crampons-or-helmet-recovered-from-snowy-couloir-on-aspen-co-14er/ https://www.denvergazette.com/outtherecolorado/2023/08/03/man-found-dead-after-shoes-and-legs-spotted-protruding-from-snow-in-colorado-couloir/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name is null and mountain = 'Conundrum Peak' and year = '2023' and month = '7' and day = '29' and cause = 'Avalanche';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 91: Unnamed matched % rows (expected 1)', n; end if;

  -- Edit 92: Karl Pfiffner
  -- now:  Karl Pfiffner | La Plata Peak | 3/19/1961 | Avalanche | M | 25
  update incidents set
    age = '20-29',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain name, date, male and Avalanche. Exact age 25; use 20–29 in Age band rather than 25.
* Why: Source row 35. AAC reports three climbers caught, with Pfiffner the sole fatality; recovery followed the next morning. Year is supplied by the report context. Classify as descent from an Ellingwood Ridge attempt, rather than a fall on the ridge.
* Activity / location: Ellingwood Ridge attempt; avalanche during descent west toward La Plata Basin, just below timberline.
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196102301/Colorado-La-Plata-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain name, date, male and Avalanche. Exact age 25; use 20–29 in Age band rather than 25.
* Why: Source row 35. AAC reports three climbers caught, with Pfiffner the sole fatality; recovery followed the next morning. Year is supplied by the report context. Classify as descent from an Ellingwood Ridge attempt, rather than a fall on the ridge.
* Activity / location: Ellingwood Ridge attempt; avalanche during descent west toward La Plata Basin, just below timberline.
* Status: Supported correction / qualification
* Sources: https://publications.americanalpineclub.org/articles/13196102301/Colorado-La-Plata-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Karl Pfiffner' and mountain = 'La Plata Peak' and year = '1961';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 92: Karl Pfiffner matched % rows (expected 1)', n; end if;

  -- Edit 93: Gene George
  -- now:  Gene George | Mount Harvard | 9/20/2013 | Unclear | M | 60+
  update incidents set
    day = null,
    age = '60+',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 64 (60+); retain Unclear cause. Exact death date unresolved; source date must remain qualified. Preserve the existing record for review.
* Why: Source row 150. Last phone contact September 18, 2013; remains recovered March 24, 2014. Contemporary report treated identification as pending. Later StrangeOutdoors says DNA confirmed identity, but the underlying confirmation was not located. Do not use the recovery date as death date or infer a medical cause. https://www.strangeoutdoors.com/mysterious-stories-blog/2017/11/25/gene-george
* Activity / location: North Cottonwood Creek approach shared by Harvard/Columbia; off-trail recovery, not a demonstrated summit-route death.
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.cleveland19.com/story/25064869/remains-found-suspected-of-being-missing-hiker/ https://alpinerescueteam.org/2013-91-team-paged-assist-chaffee-county-sar-north-search-missing-64-yom-mt-harvard-area/ https://www.strangeoutdoors.com/mysterious-stories-blog/2017/11/25/gene-george
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 64 (60+); retain Unclear cause. Exact death date unresolved; source date must remain qualified. Preserve the existing record for review.
* Why: Source row 150. Last phone contact September 18, 2013; remains recovered March 24, 2014. Contemporary report treated identification as pending. Later StrangeOutdoors says DNA confirmed identity, but the underlying confirmation was not located. Do not use the recovery date as death date or infer a medical cause. https://www.strangeoutdoors.com/mysterious-stories-blog/2017/11/25/gene-george
* Activity / location: North Cottonwood Creek approach shared by Harvard/Columbia; off-trail recovery, not a demonstrated summit-route death.
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.cleveland19.com/story/25064869/remains-found-suspected-of-being-missing-hiker/ https://alpinerescueteam.org/2013-91-team-paged-assist-chaffee-county-sar-north-search-missing-64-yom-mt-harvard-area/ https://www.strangeoutdoors.com/mysterious-stories-blog/2017/11/25/gene-george
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Gene George' and mountain = 'Mount Harvard' and year = '2013';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 93: Gene George matched % rows (expected 1)', n; end if;

  -- Edit 94: Eric Poehlman
  -- now:  Eric Poehlman | Mount Harvard | 8/24/2016 | Cardiac event | M | 40-49
  update incidents set
    climber_name = 'Eric A. Poehlmann',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Eric A. Poehlmann, 46 (40–49), male; August 24, 2016; Cardiac event. Obituary specifically reports heart attack.
* Why: Source row 179 omits the surname''s second n. Early sheriff-attributed reporting left cause pending autopsy; September 2 obituary supplies the later heart-attack result. Recovery was August 25, separate from death date. https://www.denver7.com/news/mountains/out-of-state-hiker-dies-climbing-colorado-14er-mount-harvard
* Activity / location: Hiking Mount Harvard; body recovered near summit, about 14,200 feet.
* Status: Supported correction / qualification
* Sources: https://www.legacy.com/us/obituaries/dailycamera/name/eric-poehlmann-obituary?id=14852313 https://vermontbiz.com/news/2016/august/26/drm-attorneys-and-staff-mourn-loss-director-eric-poehlmann https://www.denver7.com/news/mountains/out-of-state-hiker-dies-climbing-colorado-14er-mount-harvard
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Eric A. Poehlmann, 46 (40–49), male; August 24, 2016; Cardiac event. Obituary specifically reports heart attack.
* Why: Source row 179 omits the surname''s second n. Early sheriff-attributed reporting left cause pending autopsy; September 2 obituary supplies the later heart-attack result. Recovery was August 25, separate from death date. https://www.denver7.com/news/mountains/out-of-state-hiker-dies-climbing-colorado-14er-mount-harvard
* Activity / location: Hiking Mount Harvard; body recovered near summit, about 14,200 feet.
* Status: Supported correction / qualification
* Sources: https://www.legacy.com/us/obituaries/dailycamera/name/eric-poehlmann-obituary?id=14852313 https://vermontbiz.com/news/2016/august/26/drm-attorneys-and-staff-mourn-loss-director-eric-poehlmann https://www.denver7.com/news/mountains/out-of-state-hiker-dies-climbing-colorado-14er-mount-harvard
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Eric Poehlman' and mountain = 'Mount Harvard' and year = '2016';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 94: Eric Poehlman matched % rows (expected 1)', n; end if;

  -- Edit 95: Captain (USN) James Joseph Richardson (copilot) ▸
  -- now:  Captain (USN) James Joseph Richardson (copilot) | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 20. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 20. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Captain (USN) James Joseph Richardson (copilot)' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 95: Captain (USN) James Joseph Richardson (copilot) ▸ matched % rows (expected 1)', n; end if;

  -- Edit 96: S/Sgt William E. MacKenzie Jr. ▸
  -- now:  S/Sgt William E. MacKenzie Jr. | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 21. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 21. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'S/Sgt William E. MacKenzie Jr.' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 96: S/Sgt William E. MacKenzie Jr. ▸ matched % rows (expected 1)', n; end if;

  -- Edit 97: Oscar M. Rupert (Civilian) ▸
  -- now:  Oscar M. Rupert (Civilian) | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 22. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 22. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Oscar M. Rupert (Civilian)' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 97: Oscar M. Rupert (Civilian) ▸ matched % rows (expected 1)', n; end if;

  -- Edit 98: A1c William R. Carpenter ▸
  -- now:  A1c William R. Carpenter | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 23. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 23. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'A1c William R. Carpenter' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 98: A1c William R. Carpenter ▸ matched % rows (expected 1)', n; end if;

  -- Edit 99: Sgt Phillip Lenz ▸
  -- now:  Sgt Phillip Lenz | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 24. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 24. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Sgt Phillip Lenz' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 99: Sgt Phillip Lenz ▸ matched % rows (expected 1)', n; end if;

  -- Edit 100: Cpt David C. Jacobs ▸
  -- now:  Cpt David C. Jacobs | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 25. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 25. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Cpt David C. Jacobs' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 100: Cpt David C. Jacobs ▸ matched % rows (expected 1)', n; end if;

  -- Edit 101: 1st Lt David W. Gill ▸
  -- now:  1st Lt David W. Gill | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 26. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 26. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = '1st Lt David W. Gill' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 101: 1st Lt David W. Gill ▸ matched % rows (expected 1)', n; end if;

  -- Edit 102: Sp3 William L. Simpson ▸
  -- now:  Sp3 William L. Simpson | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 27. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 27. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Sp3 William L. Simpson' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 102: Sp3 William L. Simpson ▸ matched % rows (expected 1)', n; end if;

  -- Edit 103: Pvt William R. Rooney ▸
  -- now:  Pvt William R. Rooney | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 28. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 28. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Pvt William R. Rooney' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 103: Pvt William R. Rooney ▸ matched % rows (expected 1)', n; end if;

  -- Edit 104: Colonel Charles Arthur Miller (pilot) ▸
  -- now:  Colonel Charles Arthur Miller (pilot) | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 29. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 29. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Colonel Charles Arthur Miller (pilot)' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 104: Colonel Charles Arthur Miller (pilot) ▸ matched % rows (expected 1)', n; end if;

  -- Edit 105: Colonel Frederick W. Ledeboer ▸
  -- now:  Colonel Frederick W. Ledeboer | Mount Yale | 9/24/1956 | Accident, other | M | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 30. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 30. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Colonel Frederick W. Ledeboer' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 105: Colonel Frederick W. Ledeboer ▸ matched % rows (expected 1)', n; end if;

  -- Edit 106: Master Sargent Helen M. Schuyler (WAF) ▸
  -- now:  Master Sargent Helen M. Schuyler (WAF) | Mount Yale | 9/24/1956 | Accident, other | F | Unknown
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 31. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain person/date; 12 victims, one aviation event. Individual roster qualifications in Yale Leads.
* Why: Source row 31. Separate from hiking-only counts; no additional victim recommended.
* Activity / location: Aircraft passengers/crew; Yale slope
* Status: Supported correction / qualification
* Sources: https://www.usdeadlyevents.com/1956-sep-24-usaf-douglas-c-47-plane-crash-mount-yale-near-buena-vista-co-all-12/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Master Sargent Helen M. Schuyler (WAF)' and mountain = 'Mount Yale' and year = '1956';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 106: Master Sargent Helen M. Schuyler (WAF) ▸ matched % rows (expected 1)', n; end if;

  -- Edit 107: Kathleen Barlett
  -- now:  Kathleen Barlett | Mount Yale | 7/18/2015 | Lightning | F | 30-39
  update incidents set
    climber_name = 'Kathleen Bartlett',
    day = '17',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Kathleen Bartlett; 2015-07-17; age 31 (30–39), female; retain Lightning.
* Why: Source row 168. NWS names Bartlett and records July 17; July 18 is reporting date.
* Activity / location: Hiking Mount Yale
* Status: Supported correction / qualification
* Sources: https://www.weather.gov/safety/lightning-fatalities15
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Kathleen Bartlett; 2015-07-17; age 31 (30–39), female; retain Lightning.
* Why: Source row 168. NWS names Bartlett and records July 17; July 18 is reporting date.
* Activity / location: Hiking Mount Yale
* Status: Supported correction / qualification
* Sources: https://www.weather.gov/safety/lightning-fatalities15
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Kathleen Barlett' and mountain = 'Mount Yale' and year = '2015';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 107: Kathleen Barlett matched % rows (expected 1)', n; end if;

  -- Edit 108: Jeffrey Pickering
  -- now:  Jeffrey Pickering | Mount Yale | 9/10/2016 | Unclear | M | Unknown
  update incidents set
    day = null,
    age = '40-49',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age 44 (40–49); retain Unclear. September 10 is discovery date, exact death day unresolved.
* Why: Source row 181. Preserve existing person; boundary review recommended, no new record.
* Activity / location: Heavy brush near Avalanche Trailhead; not established summit death
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.fox4news.com/news/missing-grapevine-mans-body-found-in-colorado https://sentinelcolorado.com/uncategorized/missing-hiker-texas-found-dead-chaffee-county/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age 44 (40–49); retain Unclear. September 10 is discovery date, exact death day unresolved.
* Why: Source row 181. Preserve existing person; boundary review recommended, no new record.
* Activity / location: Heavy brush near Avalanche Trailhead; not established summit death
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.fox4news.com/news/missing-grapevine-mans-body-found-in-colorado https://sentinelcolorado.com/uncategorized/missing-hiker-texas-found-dead-chaffee-county/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Jeffrey Pickering' and mountain = 'Mount Yale' and year = '2016';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 108: Jeffrey Pickering matched % rows (expected 1)', n; end if;

  -- Edit 109: Catherine M. Pugin
  -- now:  Catherine M. Pugin | Mount Princeton | 9/9/1995 | Lightning | F | 29
  update incidents set
    age = '20-29',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Age-band 29 → 20–29; retain date/cause provisionally. Memorial transcribed as Catherine Martha Pugin.
* Why: Source row 62. Original agency/newspaper corroboration still needed; blog transcription is not an official death record.
* Activity / location: Near summit memorial
* Status: Supported fields / qualified dates and mechanism
* Sources: https://cannundrum.blogspot.com/2014/09/mount-princeton.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Age-band 29 → 20–29; retain date/cause provisionally. Memorial transcribed as Catherine Martha Pugin.
* Why: Source row 62. Original agency/newspaper corroboration still needed; blog transcription is not an official death record.
* Activity / location: Near summit memorial
* Status: Supported fields / qualified dates and mechanism
* Sources: https://cannundrum.blogspot.com/2014/09/mount-princeton.html
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Catherine M. Pugin' and mountain = 'Mount Princeton' and year = '1995';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 109: Catherine M. Pugin matched % rows (expected 1)', n; end if;

  -- Edit 110: Matthew Lackey
  -- now:  Matthew Lackey | Mount Princeton | 4/10/2017 | Fall | M | 30-39
  update incidents set
    climber_name = 'Matthew Wayne Lackey',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Matthew Wayne Lackey, 31 (30–39); retain date and Fall.
* Why: Source row 197. No separate rockfall victim inferred.
* Activity / location: Rock face; dislodged boulder triggered fall
* Status: Supported correction / qualification
* Sources: https://www.durangoherald.com/articles/man-climbing-mount-princeton-dies-after-140-foot-fall/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Matthew Wayne Lackey, 31 (30–39); retain date and Fall.
* Why: Source row 197. No separate rockfall victim inferred.
* Activity / location: Rock face; dislodged boulder triggered fall
* Status: Supported correction / qualification
* Sources: https://www.durangoherald.com/articles/man-climbing-mount-princeton-dies-after-140-foot-fall/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Matthew Lackey' and mountain = 'Mount Princeton' and year = '2017';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 110: Matthew Lackey matched % rows (expected 1)', n; end if;

  -- Edit 111: Makana von Gortler
  -- now:  Makana von Gortler | Missouri Mountain | 6/22/2011 | Fall | F | 20-29
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Makana von Gortler, 20; retain date provisionally; reported fall, detailed mechanism unresolved.
* Why: Source row 116. Official recovery July 2; do not substitute recovery date for death. Later coroner report needs original retrieval.
* Activity / location: Off-trail recovery at about 12,000 ft
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.nationalguard.mil/News/Article-View/Article/610651/colorado-army-national-guard-discovers-recovers-missing-hikers/ https://strangeoutdoors.squarespace.com/mysterious-stories-blog/vongortler
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Makana von Gortler, 20; retain date provisionally; reported fall, detailed mechanism unresolved.
* Why: Source row 116. Official recovery July 2; do not substitute recovery date for death. Later coroner report needs original retrieval.
* Activity / location: Off-trail recovery at about 12,000 ft
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.nationalguard.mil/News/Article-View/Article/610651/colorado-army-national-guard-discovers-recovers-missing-hikers/ https://strangeoutdoors.squarespace.com/mysterious-stories-blog/vongortler
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Makana von Gortler' and mountain = 'Missouri Mountain' and year = '2011';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 111: Makana von Gortler matched % rows (expected 1)', n; end if;

  -- Edit 112: Michael von Gortler
  -- now:  Michael von Gortler | Missouri Mountain | 6/22/2011 | Fall | M | 50-59
  update incidents set
    climber_name = 'Robert Michael von Gortler',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Robert Michael von Gortler, 53; retain date provisionally; reported fall, detailed mechanism unresolved.
* Why: Source row 117. National Guard identifies full name. Family death-date and trauma account requires original coroner report; no wind/lightning mechanism inferred.
* Activity / location: Off-trail recovery
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.nationalguard.mil/News/Article-View/Article/610651/colorado-army-national-guard-discovers-recovers-missing-hikers/ https://strangeoutdoors.squarespace.com/mysterious-stories-blog/vongortler
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Robert Michael von Gortler, 53; retain date provisionally; reported fall, detailed mechanism unresolved.
* Why: Source row 117. National Guard identifies full name. Family death-date and trauma account requires original coroner report; no wind/lightning mechanism inferred.
* Activity / location: Off-trail recovery
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.nationalguard.mil/News/Article-View/Article/610651/colorado-army-national-guard-discovers-recovers-missing-hikers/ https://strangeoutdoors.squarespace.com/mysterious-stories-blog/vongortler
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Michael von Gortler' and mountain = 'Missouri Mountain' and year = '2011';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 112: Michael von Gortler matched % rows (expected 1)', n; end if;

  -- Edit 113: Joe Anderson
  -- now:  Joe Anderson | Quandary Peak | 8/28/2026 | Cardiac event | M | 40-49
  update incidents set
    cause = 'Unclear',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Recommend Unclear pending coroner; collapse does not establish cardiac cause
* Why: Source row 254; official city notice confirms date; retrieved sheriff reporting does not establish cause.
* Activity / location: Lower Quandary trail; age 45
* Status: Supported correction / qualification
* Sources: https://www.englewoodco.gov/Home/Components/News/News/7384/21?backlist=%2F-curm-9 https://www.denvergazette.com/2026/08/31/following-politicians-death-on-colorado-14er-heres-a-look-at-early-signs-of-medical-distress-when-hiking/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Recommend Unclear pending coroner; collapse does not establish cardiac cause
* Why: Source row 254; official city notice confirms date; retrieved sheriff reporting does not establish cause.
* Activity / location: Lower Quandary trail; age 45
* Status: Supported correction / qualification
* Sources: https://www.englewoodco.gov/Home/Components/News/News/7384/21?backlist=%2F-curm-9 https://www.denvergazette.com/2026/08/31/following-politicians-death-on-colorado-14er-heres-a-look-at-early-signs-of-medical-distress-when-hiking/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Joe Anderson' and mountain = 'Quandary Peak' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 113: Joe Anderson matched % rows (expected 1)', n; end if;

  -- Edit 114: Christopher Thomas
  -- now:  Christopher Thomas | Torreys Peak | 12/31/2014 | Avalanche | M | 40-49
  update incidents set
    age = '30-39',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: G162: 40–49 → 30–39; reported age 39
* Why: Source row 162; retain one event, not a separate Kelso fatality.
* Activity / location: East flank Kelso Mountain on approach to Torreys Kelso Ridge; associated approach
* Status: Supported correction / qualification
* Sources: https://www.ksl.com/article/news/us/avalanche-kills-snowshoer-as-3-try-to-avoid-slide/32955567 https://www.westword.com/news/skier-killed-near-aspen-mountain-seasons-third-avalanche-fatality-6578566/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: G162: 40–49 → 30–39; reported age 39
* Why: Source row 162; retain one event, not a separate Kelso fatality.
* Activity / location: East flank Kelso Mountain on approach to Torreys Kelso Ridge; associated approach
* Status: Supported correction / qualification
* Sources: https://www.ksl.com/article/news/us/avalanche-kills-snowshoer-as-3-try-to-avoid-slide/32955567 https://www.westword.com/news/skier-killed-near-aspen-mountain-seasons-third-avalanche-fatality-6578566/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Christopher Thomas' and mountain = 'Torreys Peak' and year = '2014';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 114: Christopher Thomas matched % rows (expected 1)', n; end if;

  -- Edit 115: Don Chambliss
  -- now:  Don Chambliss | Torreys Peak | 7/16/2019 | Unclear | M | 60+
  update incidents set
    day = null,
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Reported age 71 and apparent fall; retain Unclear pending coroner. July 16 is departure date, exact death day unresolved.
* Why: Source row 219; found July 18; recovery July 19.
* Activity / location: Kelso Ridge
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.denver7.com/news/local-news/after-his-fathers-tragic-death-this-denver-videographer-found-a-unique-way-to-thank-search-and-rescue
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Reported age 71 and apparent fall; retain Unclear pending coroner. July 16 is departure date, exact death day unresolved.
* Why: Source row 219; found July 18; recovery July 19.
* Activity / location: Kelso Ridge
* Status: Supported fields / qualified dates and mechanism
* Sources: https://www.denver7.com/news/local-news/after-his-fathers-tragic-death-this-denver-videographer-found-a-unique-way-to-thank-search-and-rescue
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Don Chambliss' and mountain = 'Torreys Peak' and year = '2019';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 115: Don Chambliss matched % rows (expected 1)', n; end if;

  -- Edit 116: Levi Stobel
  -- now:  Levi Stobel | Mount Evans | 7/26/2026 | Lightning | M | <20
  update incidents set
    climber_name = 'Levi Strobel',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: B253: Levi Strobel; C253: Mount Blue Sky, retaining Mount Evans alias in audit
* Why: Source row 253; date, cause and <20 retained.
* Activity / location: Summit; age 15
* Status: Supported correction / qualification
* Sources: https://www.cpr.org/2026/07/27/lightning-strike-death-mount-blue-sky/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: B253: Levi Strobel; C253: Mount Blue Sky, retaining Mount Evans alias in audit
* Why: Source row 253; date, cause and <20 retained.
* Activity / location: Summit; age 15
* Status: Supported correction / qualification
* Sources: https://www.cpr.org/2026/07/27/lightning-strike-death-mount-blue-sky/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Levi Stobel' and mountain = 'Mount Evans' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 116: Levi Stobel matched % rows (expected 1)', n; end if;

  -- Edit 117: Mary Elizabeth Bowles
  -- now:  Mary Elizabeth Bowles | Mount Bierstadt | 6/25/2011 | Fall | F | 50-59
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain source fields; age 50 matches 50–59; no second Blue Sky entry
* Why: Source row 118. Existing Blue Sky Audit duplicate control retained; precise site follows prior cited research.
* Activity / location: Sawtooth; shared Bierstadt/Blue Sky (historical Mount Evans) terrain
* Status: Supported correction / qualification
* Sources: https://www.dignitymemorial.com/obituaries/golden-co/mary-bowles-4722947 https://www.cbsnews.com/colorado/news/rescue-crews-working-to-reach-fallen-hiker-on-mount-evans/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain source fields; age 50 matches 50–59; no second Blue Sky entry
* Why: Source row 118. Existing Blue Sky Audit duplicate control retained; precise site follows prior cited research.
* Activity / location: Sawtooth; shared Bierstadt/Blue Sky (historical Mount Evans) terrain
* Status: Supported correction / qualification
* Sources: https://www.dignitymemorial.com/obituaries/golden-co/mary-bowles-4722947 https://www.cbsnews.com/colorado/news/rescue-crews-working-to-reach-fallen-hiker-on-mount-evans/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Mary Elizabeth Bowles' and mountain = 'Mount Bierstadt' and year = '2011';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 117: Mary Elizabeth Bowles matched % rows (expected 1)', n; end if;

  -- Edit 118: Clinton S. McHugh
  -- now:  Clinton S. McHugh | Mount Bierstadt | 7/17/2012 | Fall | M | 30-39
  update incidents set
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain name/date/cause; reported age 32 matches 30–39
* Why: Source row 135; no duplicate Blue Sky fatality record.
* Activity / location: West side Sawtooth Ridge between Bierstadt and historical Mount Evans
* Status: Supported correction / qualification
* Sources: https://gazette.com/2012/07/19/hiker-who-died-in-ridgeline-fall-recently-moved-from-chicago/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain name/date/cause; reported age 32 matches 30–39
* Why: Source row 135; no duplicate Blue Sky fatality record.
* Activity / location: West side Sawtooth Ridge between Bierstadt and historical Mount Evans
* Status: Supported correction / qualification
* Sources: https://gazette.com/2012/07/19/hiker-who-died-in-ridgeline-fall-recently-moved-from-chicago/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Clinton S. McHugh' and mountain = 'Mount Bierstadt' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 118: Clinton S. McHugh matched % rows (expected 1)', n; end if;

  -- Edit 119: Kaden Sites — source row 249
  -- now:  Kaden Sites | Mount Shavano | 4/15/2026 | Intentional | M | 20-29
  update incidents set
    cause = 'Unclear',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Proposed E249: Intentional → Unclear unless stronger original evidence supports current label. A249: hold exact death-date correction.
* Why: Missing April 15; found deceased April 25. Retrieved report gives no released cause. Keep one victim; creek name does not establish Tabeguache Peak assignment. Male age 27 supports current age band.
* Activity / location: Solo hunting; body located near Tabaguache Creek, not a demonstrated summit-climbing incident.
* Status: Supported correction / qualification
* Sources: https://www.kkco11news.com/2026/04/26/missing-mount-shavano-hunter-found-dead/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Proposed E249: Intentional → Unclear unless stronger original evidence supports current label. A249: hold exact death-date correction.
* Why: Missing April 15; found deceased April 25. Retrieved report gives no released cause. Keep one victim; creek name does not establish Tabeguache Peak assignment. Male age 27 supports current age band.
* Activity / location: Solo hunting; body located near Tabaguache Creek, not a demonstrated summit-climbing incident.
* Status: Supported correction / qualification
* Sources: https://www.kkco11news.com/2026/04/26/missing-mount-shavano-hunter-found-dead/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Kaden Sites' and mountain = 'Mount Shavano' and year = '2026';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 119: Kaden Sites — source row 249 matched % rows (expected 1)', n; end if;

  -- Edit 120: Martin Pigeon — source row 133
  -- now:  Martin Pigeon | Windom Peak | 7/10/2012 | Fall | M | Unknown
  update incidents set
    day = '8',
    age = '40-49',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: A133: 07/10/2012 → 07/08/2012. G133: — → 40-49.
* Why: Obituary gives July 8 and age 45. July 10 was recovery day. Retain Windom/Fall/Male and one victim. Yves Marcoux survived; earlier reversed companion name is not a second casualty.
* Activity / location: Descending Windom; storm context
* Status: Supported correction / qualification
* Sources: https://www.domainefuneraire.com/avis-de-deces/Martin-PIGEON-78320 https://www.journaldemontreal.com/2012/07/11/un-alpiniste-quebecois-est-decede-en-grimpant
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: A133: 07/10/2012 → 07/08/2012. G133: — → 40-49.
* Why: Obituary gives July 8 and age 45. July 10 was recovery day. Retain Windom/Fall/Male and one victim. Yves Marcoux survived; earlier reversed companion name is not a second casualty.
* Activity / location: Descending Windom; storm context
* Status: Supported correction / qualification
* Sources: https://www.domainefuneraire.com/avis-de-deces/Martin-PIGEON-78320 https://www.journaldemontreal.com/2012/07/11/un-alpiniste-quebecois-est-decede-en-grimpant
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Martin Pigeon' and mountain = 'Windom Peak' and year = '2012';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 120: Martin Pigeon — source row 133 matched % rows (expected 1)', n; end if;

  -- Edit 121: Ben Brownlee — source row 224
  -- now:  Ben Brownlee | Redcloud Peak | 10/7/2020 | Fall | M | 20-29
  update incidents set
    day = '3',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Date: 10/03/2020. Add Cooper Creek ridge / Redcloud-area boundary note; mountain replacement held.
* Why: Family memorial states October 3. October 7 was recovery. Preserve one associated record, Fall/Male/20-29 (age 26); do not treat shared trailhead or stated Redcloud plans as proof of death on Redcloud. No deletion or duplicate Sunshine row.
* Activity / location: Fatal ridge fall southeast of Cooper Creek Peak; shared trailhead
* Status: Supported correction / qualification
* Sources: https://www.benbrownleememorialfund.com/ https://www.durangoherald.com/articles/news/missing-hiker-found-dead-in-san-juan-mountains-west-of-lake-city/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Date: 10/03/2020. Add Cooper Creek ridge / Redcloud-area boundary note; mountain replacement held.
* Why: Family memorial states October 3. October 7 was recovery. Preserve one associated record, Fall/Male/20-29 (age 26); do not treat shared trailhead or stated Redcloud plans as proof of death on Redcloud. No deletion or duplicate Sunshine row.
* Activity / location: Fatal ridge fall southeast of Cooper Creek Peak; shared trailhead
* Status: Supported correction / qualification
* Sources: https://www.benbrownleememorialfund.com/ https://www.durangoherald.com/articles/news/missing-hiker-found-dead-in-san-juan-mountains-west-of-lake-city/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Ben Brownlee' and mountain = 'Redcloud Peak' and year = '2020';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 121: Ben Brownlee — source row 224 matched % rows (expected 1)', n; end if;

  -- Edit 122: Walter Johnson
  -- now:  Walter Johnson | Pikes Peak | 10/26/1899 | Falling rock/ice | M | 20-29
  update incidents set
    cause = 'Accident, other',
    incident_details = case when incident_details is null or btrim(incident_details) = '' then 'Research notes

* Correction: Retain Walter Johnson. Cause: Accident, other (blast/explosion). Mining location: Cincinnati Mine / Oil Creek Tunnel.
* Why: Source row 4. Earlier mining-only removal recommendation superseded by user instruction. Cause correction from Falling rock/ice to blast/Accident other remains recommended; not applied.
* Activity / location: Cincinnati Mine / Oil Creek Tunnel
* Status: Supported correction / qualification
* Sources: https://manitouspringsheritagecenter.org/pikes-peak-tales/
* Review: Reconciliation review, Pass 47 (Oct 2026)' else incident_details || '

* Correction: Retain Walter Johnson. Cause: Accident, other (blast/explosion). Mining location: Cincinnati Mine / Oil Creek Tunnel.
* Why: Source row 4. Earlier mining-only removal recommendation superseded by user instruction. Cause correction from Falling rock/ice to blast/Accident other remains recommended; not applied.
* Activity / location: Cincinnati Mine / Oil Creek Tunnel
* Status: Supported correction / qualification
* Sources: https://manitouspringsheritagecenter.org/pikes-peak-tales/
* Review: Reconciliation review, Pass 47 (Oct 2026)' end
  where climber_name = 'Walter Johnson' and mountain = 'Pikes Peak' and year = '1899';
  get diagnostics n = row_count;
  if n <> 1 then raise exception 'Edit 122: Walter Johnson matched % rows (expected 1)', n; end if;
end $$;

insert into incidents (mountain, year, month, day, cause, gender, age, climber_name, incident_details, status, submitted_by)
values
('Pikes Peak','1948','7',null,'Fall','M','20-29','James Slack','Fell below the Pikes Peak summit during a solo climb

Left for a solo climb July 24; found dead July 28 below the summit with a fractured skull. Investigators believed he slipped and fell 15–20 feet.

* Location: Hiking
* Age: 20
* Notes: Exact death date within the July 24–28 interval is not established by the AAC account.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13194929501/Rocky-Mountains-of-Colorado-1-Pikes-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Pikes Peak','1957','8',null,'Weather exposure','F','60+','G. Inestine B. Roberts','Disappeared descending Pikes Peak in deteriorating weather after her 14th ascent

After completing her 14th ascent, Roberts began descending in deteriorating weather and disappeared. Her body was found August 14; later historical accounts attribute death to exposure.

* Location: Hiking
* Age: 87
* Notes: Memorial gives age 88, but detailed historical research indicates she was 87. Death date is approximate; last seen August 5 in contemporary reporting.
* Confidence: Strong
* Sources: https://friendsofthepeak.org/the-story-of-inestine-b-roberts/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Pikes Peak','1992','8','22','Unclear','M','50-59','Robert E. “Bob” Love','Died while racing the 1992 Pikes Peak Ascent

Official historical race results state that Bob Love of Earlham, Iowa, died while participating in the 1992 Pikes Peak Ascent; it was his third race on Pikes Peak.

* Location: Pikes Peak Ascent
* Age: 57 or 58
* Notes: Later race reporting gives age 57; Social Security-derived biographical sources imply age 58. Cause was not verified in the sources reviewed.
* Confidence: High
* Sources: https://results.pikespeakmarathon.org/archive/1992ppa_m.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Pikes Peak','2005','8','21','Unclear',null,'50-59','Gary P. Williams','Collapsed during the ascent leg of the Pikes Peak Marathon

Williams collapsed on the ascent portion of the Pikes Peak Marathon roughly 2–2.5 miles below the summit and could not be resuscitated.

* Location: Pikes Peak Marathon
* Age: 59
* Notes: Contemporary race reporting describes a suspected heart attack; obituary confirms date and age.
* Confidence: High
* Sources: https://www.skyrunner.com/story/2005a7.htm
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Pikes Peak','2020','7','31','Unclear',null,'50-59','Robley Heninger','Found deceased at the Pikes Peak summit

Responders found Heninger deceased at the Pikes Peak summit. Police described the death as non-suspicious; the published report said coroner results were pending.

* Location: Summit visitor
* Age: 59
* Notes: No later public cause-of-death source was located in this pass.
* Confidence: Strong
* Sources: https://krdo.com/lifestyle/colorado-outdoors/2020/08/03/one-death-part-of-busy-weekend-for-rescues-around-pikes-peak-summit/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','1965','7','27','Falling rock/ice',null,'20-29','Lewis B. “Lew” Covert','Struck by falling rock on South Maroon Peak while helping Outward Bound students

Covert was helping Outward Bound students when struck by a falling rock and killed instantly.

* Location: South Maroon Peak / Colorado Outward Bound
* Age: 28
* Notes: Part of the historically reported 1965 Maroon Bells death cluster.
* Confidence: High
* Sources: https://www.outwardbound.org/wp-content/uploads/2023/09/History-of-Colorado-Outward-Bound-School.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','1965','8',null,'Fall',null,'50-59','Reynold E. “Pete” Isto','Fell on South Maroon Peak

AAC obituary states Isto died in a fall on South Maroon in 1965.

* Location: South Maroon Peak
* Age: 50 or 51
* Notes: AAC obituary gives Aug. 23; an AAC accident index snippet lists Aug. 27. Preserve the conflict until a contemporary source resolves it.
* Confidence: Strong
* Sources: https://publications.americanalpineclub.org/articles/12196634000/Reynold-E-Pete-Isto-1914-1965
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','1966','4','24','Fall',null,'<20','Ronald Earl Fjeseth','Long fall and slide in a steep hard-snow gully on North Maroon Peak

Fjeseth and Richard Alan Cole died after a long fall/slide in a steep hard-snow gully; Joe Fullop survived.

* Location: North Maroon Peak
* Age: 18 or 19
* Notes: National cemetery data imply age 18 from DOB; AAC says 19. Preserve age discrepancy.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13196711500
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','1970','8','15','Fall',null,'40-49','Edward H. Hilliard Jr.','Killed with Ann Noyes Fowler when loose rock was dislodged near the top of a North Maroon couloir

Hilliard and Ann Noyes Fowler were killed near the top of a couloir after loose rock was dislodged.

* Location: North Maroon Peak
* Age: 47
* Notes: Current database has Fowler but not Hilliard, and Fowler is misdated by one year.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13197109600
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','1995','8','11','Fall',null,'50-59','Robert Lyon Spurr','Lost footing early in the descent of North Maroon Peak

Apparently lost footing shortly after beginning descent and fell approximately 250–500 feet.

* Location: North Maroon Peak
* Age: 57 or 58
* Notes: AAC accident report/obituary supports identity and date.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13199607300
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','2006','8','19','Fall',null,'60+','Dr. Sterling Smith','Fell more than 300 feet descending South Maroon Peak

Fell more than 300 feet while descending near approximately 12,800 feet.

* Location: South Maroon Peak
* Age: 66
* Notes: Contemporary local reporting supports Aug. 19. A Congressional Record memorial uses Aug. 21; retain Aug. 19 as the better contemporaneous date.
* Confidence: Strong
* Sources: https://www.crosstimbersgazette.com/2006/08/21/local-doctor-dies-in-colorado-climbing-accident/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Maroon Bells','2014','9','7','Fall',null,'40-49','Theodore James Leach','Accidental fall on North Maroon Peak

Found at approximately 11,200 feet; coroner ruled the death an accidental fall.

* Location: North Maroon Peak
* Age: 42
* Notes: The two anonymous 2014 rows in the source do not cleanly match Leach''s age, so treat this as a distinct missing addition.
* Confidence: High
* Sources: https://www.cbsnews.com/colorado/news/body-of-missing-mountain-goat-hunter-found-near-maroon-bells/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Capitol Peak','1957','7','25','Fall','M',null,'John W. Heckert','Lost control glissading hard snow on the Capitol Peak descent

After summiting with Eileen Ginter and Richard Slusser, Heckert attempted a sitting glissade on hard snow, lost control, struck a boulder roughly 100 feet below and was killed by the impact.

* Location: Capitol Peak descent
* Notes: AAC provides detailed first-hand accident chronology. Some later secondary sources incorrectly call him James Heckert; use John W. Heckert from AAC.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13195800800
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Capitol Peak','1994','4','23','Lightning','M',null,null,'Unidentified climber killed by lightning near the Capitol Peak summit

Lightning struck three male climbers near the summit, killing one and injuring two.

* Location: Near Capitol Peak summit
* Notes: Pitkin County hazard-mitigation event table records the fatal lightning event. Name has not yet been identified; direct PDF rendering was unavailable in this research pass, so identity research remains open.
* Confidence: Strong
* Sources: https://d3n9y02raazwpg.cloudfront.net/cityofaspen/2e6e7406-cd91-11ed-95dd-0050569183fa-d668032e-018e-40d4-8c31-74b5cb43dc4c-1680819321.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Crestone Needle','1982','9','11','Fall',null,'20-29','Duane Best','Fell more than 80 meters ascending Crestone Needle

Western State College student Duane Best fell more than 80 meters to his death while ascending Crestone Needle with Geoffrey Bogar. They carried climbing equipment but were not using it; Best was wearing tennis shoes.

* Location: Crestone Needle ascent
* Age: 22
* Notes: AAC report is specific on identity, age, date and mechanism.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13198304403/Fall-on-Snow-Climbing-Unroped-No-Hard-Hat-Inadequate-Footwear-Colorado-Crestone-Needle
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Little Bear Peak','1956','9','1','Fall','M',null,'Banks Caywood','Fell about 500 feet descending Little Bear after the Blanca–Little Bear traverse

After summiting Blanca and traversing to Little Bear with four companions, Caywood fell about 500 feet below the Little Bear summit during descent. His body was recovered the following day.

* Location: Little Bear descent after Blanca–Little Bear traverse
* Notes: AAC account cites Trail and Timberline and a participant/source. This is a direct historical Little Bear fatality missing from the current sheet.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13195700901
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Little Bear Peak','1967','8','5','Fall','M','40-49','Dr. Harold Affsprung','Fell at least 200 feet climbing unroped on Little Bear’s Northwest Face

Affsprung climbed unroped above his party on steep rock. After calling “Rock,” he fell at least 200 feet. The AAC analysis considered failure of a loose hold the most likely initiating cause.

* Location: Northwest Face, ~13,500 ft
* Age: 45
* Notes: AAC first-person account by Dr. Bruce Stewart. Accident occurred Aug. 5, 1967; publication year was 1968.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13196800703/Colorado-Sangre-de-Cristo-Little-Bear
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Little Bear Peak','2003','8','2','Fall','M','50-59','John Boyles','Took a wrong descent couloir in an approaching storm and fell about 500 feet

Boyles was descending with his son during an approaching thunderstorm, took a wrong turn into an avalanche chute and fell roughly 500 feet on loose rock.

* Location: Wrong descent couloir / avalanche chute on Little Bear
* Age: 52
* Notes: This surviving web record reproduces the contemporaneous DenverChannel report. Exact death date is independently consistent with death-record data, but a first-party archive should still be sought.
* Confidence: Strong
* Sources: https://www.mountwhitneyforum.com/ubbthreads.php?Number=5894&page=2&ubb=showflat
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Challenger Point','2003','7','27','Lightning','F','20-29','Martina (surname unknown)','Struck by lightning on the Willow Creek Trail after climbing Kit Carson and Challenger

A female climber was struck and killed by lightning on Willow Creek Trail after climbing both peaks. Her husband was also struck but survived. An eyewitness/friend identifies her first name as Martina.

* Location: Willow Creek Trail after climbing Kit Carson and Challenger
* Age: 25
* Notes: NCEI records age 25 and a direct lightning death under trees. Eyewitness account also gives first name Martina and age 25; surname remains unresolved, so do not invent it.
* Confidence: High incident / incomplete identity
* Sources: https://www.ncei.noaa.gov/stormevents/eventdetails.jsp?id=5376481
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Wilson Peak','2006','9','15','Accident, other',null,'20-29','James Flanagin','Passenger killed when a private plane struck Wilson Peak near the summit

Passenger killed when a Beech 35-C33 struck Wilson Peak near the summit during a flight to Telluride.

* Location: Wilson Peak — private flight
* Age: 25
* Notes: NTSB places the initial impact roughly 30 feet short of Wilson Peak''s summit and records four fatalities. Houston Chronicle identifies all four occupants.
* Confidence: High
* Sources: https://data.ntsb.gov/carol-repgen/api/Aviation/ReportMain/GenerateNewestReport/64527/pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Wilson Peak','2006','9','15','Accident, other',null,'20-29','Brendan Culbert','Passenger killed when a private plane struck Wilson Peak near the summit

Passenger killed in the same Wilson Peak aircraft accident.

* Location: Wilson Peak — private flight
* Age: 25
* Notes: NTSB accident DEN06FA132 confirms four fatal occupants and summit-impact location.
* Confidence: High
* Sources: https://www.chron.com/news/houston-texas/article/2-houstonians-among-4-texans-killed-in-colorado-1884013.php
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Wilson Peak','2006','9','15','Accident, other',null,'20-29','Kristin Kirkley','Passenger killed when a private plane struck Wilson Peak near the summit

Passenger killed in the same Wilson Peak aircraft accident.

* Location: Wilson Peak — private flight
* Age: 26
* Notes: NTSB accident DEN06FA132 confirms four fatal occupants and summit-impact location.
* Confidence: High
* Sources: https://www.chron.com/news/houston-texas/article/2-houstonians-among-4-texans-killed-in-colorado-1884013.php
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Wilson Peak','2006','9','15','Accident, other','M','20-29','Mark Cochran','Pilot killed when his plane struck Wilson Peak near the summit

Commercial pilot killed when the aircraft encountered mountain-wave conditions, lost control and impacted Wilson Peak near the summit.

* Location: Wilson Peak — pilot / private flight
* Age: 27
* Notes: NTSB found mountain-wave turbulence and high winds contributed to loss of control. Cochran''s body was not recovered, but his death is established by the investigation and coroner/family evidence.
* Confidence: High
* Sources: https://data.ntsb.gov/carol-repgen/api/Aviation/ReportMain/GenerateNewestReport/64527/pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Pyramid Peak','1996','1','28','Avalanche',null,null,null,'Unidentified climber carried over a cliff by a slab avalanche on a winter Pyramid Peak approach

A four-person party triggered a roughly 300-foot-wide slab avalanche with a three-foot crown. One climber was carried about 1,400 vertical feet and over a cliff; the body was located three weeks later.

* Location: Pyramid Peak winter approach toward north-face amphitheater
* Notes: AAC/Mountain Rescue Aspen directly documents the fatality. Victim was part of a southern-European party; identity has not yet been recovered from available sources.
* Confidence: High event / unresolved identity
* Sources: https://publications.americanalpineclub.org/articles/13199703200/Avalanche-Failure-to-Follow-Advice-Inadequate-Equipment-Poor-Position-Inexperience-Colorado-Pyramid-Peak
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Snowmass Mountain','1949','8','26','Fall',null,'20-29','Arthur Gallager','Slipped from a ledge descending Snowmass Mountain

Yale student from Colorado Springs slipped from a ledge while descending from the summit area and slid to his death in a rock slide.

* Location: Snowmass Mountain descent
* Age: 21
* Notes: AAC used the historical name “Snowmass Peak (14,077 ft.),” which by elevation/context refers to the Fourteener now called Snowmass Mountain, not the modern 13er Snowmass Peak.
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13195000502
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Snowmass Mountain','2004','6','26','Fall','M','30-39','Mark A. Golden','Fell about 2,000 feet on an apparent descent shortcut on Snowmass Mountain

Golden apparently attempted a shortcut during descent and fell roughly 2,000 feet.

* Location: Snowmass Mountain descent / probable shortcut
* Age: 31
* Notes: AAC editor''s note reports Mark Golden, 32, on “Snowmass Peak—14,092 ft.” A friend memorial gives death date 06/26/2004, while biographical records give DOB 07/27/1972, making him 31. Historical peak name/elevation clearly indicate Snowmass Mountain.
* Confidence: Strong
* Sources: https://publications.americanalpineclub.org/articles/13200506700
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Blanca Peak','2022','9','9','Accident, other',null,null,null,'Driver killed in a vehicle rollover at Jaws 2 on the Lake Como Road

Vehicle rolled several times at Jaws 2, ejecting both occupants. The passenger survived with non-life-threatening injuries; the driver sustained fatal injuries.

* Location: Lake Como Road — Jaws 2
* Notes: Not a summit-climbing fatality. Include only under broad approach-road/massif scope and keep distinct from Justin Seagren''s Sept. 7 climbing death.
* Confidence: High event / unresolved identity
* Sources: https://www.avsar.us/uhv-rollover-leads-to-recovery-on-lake-como-sept-9-2022/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Castle Peak','1988','1','10','Avalanche','M',null,null,'Unidentified skier killed in an avalanche on a Pearl Pass–Castle Peak traverse

One of three skiers (two men and one woman) killed in the same avalanche while traversing from the Pearl Pass area toward Castle Peak, on the north slopes of the divide. Associated terrain, not a summit-route death.

* Location: Pearl Pass vicinity; traverse toward Castle Peak, north slopes of divide
* Confidence: High event/date/count; full identity unresolved. Male 1 is a record placeholder, not a verified ordering.
* Sources: https://arc.lib.montana.edu/snow-science/objects/issw-1990-218-226.pdf https://spl.cde.state.co.us/artemis/nrserials/nr711internet/nr711199899internet.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Castle Peak','1988','1','10','Avalanche','M',null,null,'Unidentified skier killed in an avalanche on a Pearl Pass–Castle Peak traverse

Second male casualty of the same three-person avalanche on the Pearl Pass–Castle Peak traverse. Associated terrain, not a summit-route death.

* Location: Same Pearl Pass–Castle traverse event
* Confidence: High event/date/count; full identity unresolved. Male 2 is a record placeholder, not a verified ordering.
* Sources: https://arc.lib.montana.edu/snow-science/objects/issw-1990-218-226.pdf https://spl.cde.state.co.us/artemis/nrserials/nr711internet/nr711199899internet.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Castle Peak','1988','1','10','Avalanche','F','30-39','Kristyne “Teeny” H. Jeung','Killed in an avalanche on a Pearl Pass–Castle Peak ski traverse

The woman killed in the three-person avalanche on the Pearl Pass–Castle Peak traverse, identified by contemporary AP reporting at age 37. Later sources confirm her body was eventually recovered but disagree on when. Associated terrain, not a summit-route death.

* Location: Same Pearl Pass–Castle traverse event
* Confidence: High event/date/count; name/age from contemporary AP. Recovery timing unresolved.
* Sources: https://arc.lib.montana.edu/snow-science/objects/issw-1990-218-226.pdf https://spl.cde.state.co.us/artemis/nrserials/nr711internet/nr711199899internet.pdf https://www.latimes.com/archives/la-xpm-1988-01-12-mn-35124-story.html
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('La Plata Peak','2004','3','20','Avalanche','M','20-29','Kyle Fitzpatrick','Caught in a wet-slab avalanche while glissading down La Plata Peak

Fitzpatrick, 22, was killed during the descent after summiting; his two companions survived. His body was recovered on March 21, 2004.

* Location: La Plata Peak, west face/slope; glissading descent after summit. SARDOC describes ascent via north-northwest ridge.
* Confidence: High event/date/age/cause; name strongly supported by Backpacker''s survivor interview. Official named release not located.
* Sources: https://www.americanavalancheassociation.org/s/TAR23_1_LoResFINAL.pdf https://sardoc.org/cms/wp-content/uploads/2011/01/0604ScentArticles.pdf https://www.backpacker.com/survival/a-dozen-ways-to-die/?scope=anon
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Massive','2009','8','19','Accident, other','M','40-49','Terrance W. Geer','Killed in an Army MH-60K helicopter training crash on Mount Massive

Chief Warrant Officer 4 Geer, 40, was one of four soldiers killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training. Associated aviation fatality.

* Location: Mount Massive slopes near summit; military helicopter training.
* Confidence: High identity/date/location; age corroborated by contemporary AP reporting. Crash mechanism not assigned here.
* Sources: https://nightstalkerfoundation.org/memorials/terrance-terry-w-geer https://www.wkms.org/news-archive/2009-08-24/army-ids-4-soldiers-killed-in-helicopter-crash https://mra.org/wp-content/uploads/2016/05/2009IKARAirRescueReport.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Massive','2009','8','19','Accident, other','M','40-49','Robert M. Johnson','Killed in an Army MH-60K helicopter training crash on Mount Massive

Chief Warrant Officer 4 Johnson, 41, was one of four soldiers killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training. Associated aviation fatality.

* Location: Mount Massive slopes near summit; military helicopter training.
* Confidence: High identity/date/location; age corroborated by contemporary AP reporting. Crash mechanism not assigned here.
* Sources: https://nightstalkerfoundation.org/memorials/robert-rob-m-johnson https://www.wkms.org/news-archive/2009-08-24/army-ids-4-soldiers-killed-in-helicopter-crash https://mra.org/wp-content/uploads/2016/05/2009IKARAirRescueReport.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Massive','2009','8','19','Accident, other','M','30-39','Paul R. Jackson','Killed in an Army MH-60K helicopter training crash on Mount Massive

Staff Sergeant Jackson, 33, was one of four soldiers killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training. Associated aviation fatality.

* Location: Mount Massive slopes near summit; military helicopter training.
* Confidence: High identity/date/location; age corroborated by contemporary AP reporting. Crash mechanism not assigned here.
* Sources: https://nightstalkerfoundation.org/memorials/paul-pj-r-jackson https://www.wkms.org/news-archive/2009-08-24/army-ids-4-soldiers-killed-in-helicopter-crash https://mra.org/wp-content/uploads/2016/05/2009IKARAirRescueReport.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Massive','2009','8','19','Accident, other','M','20-29','Chad A. Tucker','Killed in an Army MH-60K helicopter training crash on Mount Massive

Staff Sergeant Tucker, 28, was one of four soldiers killed when the helicopter crashed on the slopes of Mount Massive near the summit during high-altitude training. Associated aviation fatality.

* Location: Mount Massive slopes near summit; military helicopter training.
* Confidence: High identity/date/location; age corroborated by contemporary AP reporting. Crash mechanism not assigned here.
* Sources: https://nightstalkerfoundation.org/memorials/chad-a-tucker https://www.wkms.org/news-archive/2009-08-24/army-ids-4-soldiers-killed-in-helicopter-crash https://mra.org/wp-content/uploads/2016/05/2009IKARAirRescueReport.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Princeton','2013','9','30','Falling rock/ice',null,'40-49','Dwayne Johnson','Killed in the Agnes Vaille Falls rockslide below Mount Princeton

Johnson, 46, was one of five people killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon. Associated terrain, not a summit-route death.

* Location: Agnes Vaille Falls, Chalk Creek Canyon; not summit route
* Confidence: High event; sheriff-attributed identities
* Sources: https://sardoc.org/cms/wp-content/uploads/2011/01/SARDOC-MISSION-REPORTS-FOR-2013-Public-Verson-1.pdf https://infotel.ca/newsitem/us-rock-slide-hikers/cp25282729
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Princeton','2013','9','30','Falling rock/ice',null,'40-49','Dawna Johnson','Killed in the Agnes Vaille Falls rockslide below Mount Princeton

Johnson, 45, was one of five people killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon. Associated terrain, not a summit-route death.

* Location: Agnes Vaille Falls, Chalk Creek Canyon; not summit route
* Confidence: High event; sheriff-attributed identities
* Sources: https://sardoc.org/cms/wp-content/uploads/2011/01/SARDOC-MISSION-REPORTS-FOR-2013-Public-Verson-1.pdf https://infotel.ca/newsitem/us-rock-slide-hikers/cp25282729
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Princeton','2013','9','30','Falling rock/ice',null,'<20','Kiowa-Rain Johnson','Killed in the Agnes Vaille Falls rockslide below Mount Princeton

Kiowa-Rain Johnson, 18, was one of five people killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon. Associated terrain, not a summit-route death.

* Location: Agnes Vaille Falls, Chalk Creek Canyon; not summit route
* Confidence: High event; sheriff-attributed identities
* Sources: https://sardoc.org/cms/wp-content/uploads/2011/01/SARDOC-MISSION-REPORTS-FOR-2013-Public-Verson-1.pdf https://infotel.ca/newsitem/us-rock-slide-hikers/cp25282729
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Princeton','2013','9','30','Falling rock/ice',null,'<20','Baigen Walker','Killed in the Agnes Vaille Falls rockslide below Mount Princeton

Baigen Walker, 10, was one of five people killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon. Associated terrain, not a summit-route death.

* Location: Agnes Vaille Falls, Chalk Creek Canyon; not summit route
* Confidence: High event; sheriff-attributed identities
* Sources: https://sardoc.org/cms/wp-content/uploads/2011/01/SARDOC-MISSION-REPORTS-FOR-2013-Public-Verson-1.pdf https://infotel.ca/newsitem/us-rock-slide-hikers/cp25282729
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Princeton','2013','9','30','Falling rock/ice',null,'20-29','Paris Walkup','Killed in the Agnes Vaille Falls rockslide below Mount Princeton

Paris Walkup, 22, was one of five people killed when a rockslide struck visitors at Agnes Vaille Falls in Chalk Creek Canyon. Associated terrain, not a summit-route death.

* Location: Agnes Vaille Falls, Chalk Creek Canyon; not summit route
* Confidence: High event; sheriff-attributed identities
* Sources: https://sardoc.org/cms/wp-content/uploads/2011/01/SARDOC-MISSION-REPORTS-FOR-2013-Public-Verson-1.pdf https://infotel.ca/newsitem/us-rock-slide-hikers/cp25282729
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Torreys Peak','2005','12','22','Avalanche','M','<20','Patrick David Niedringhaus','Killed in an avalanche retreating from a winter Torreys Peak attempt near Kelso Ridge

Niedringhaus, 18, died in approach terrain near Kelso Ridge after turning back from a winter attempt on Torreys Peak. One fatality in this event.

* Location: Retreat from winter Torreys attempt near Kelso Ridge; approach terrain
* Notes: Absent from 256 source rows; one fatality, not two; source unchanged.
* Confidence: High
* Sources: https://obits.gazette.com/us/obituaries/gazette/name/patrick-niedringhaus-obituary?id=26334828 https://spl.cde.state.co.us/artemis/nrserials/nr711internet/nr711200506internet.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Evans','2014',null,null,'Unclear','M','50-59','Damian McManus','Father and son died on an attempted hike in the Echo Lake–Vance Creek area of Mount Blue Sky

Damian McManus (reported as 51 or 52) and his son Evan died on the same attempted hike; their remains were found in the Echo Lake–Vance Creek terrain. Last contact was April 2, 2014, but that is not a proven death date, and the cause has not been established.

* Location: Echo Lake/Vance Creek terrain; attempted hike
* Notes: Absent source; same event, two victims. Last contact April 2 is not proven death date; body discovery is not death date; do not infer exposure cause.
* Confidence: High identity/death; open date/cause
* Sources: https://coloradocommunitymedia.com/2014/07/17/remains-of-missing-hikers-found-on-mount-evans/ https://www.ksl.com/article/30769093 https://www.alpinerescueteam.org/wp-content/uploads/2016/05/CCSO-PSAR-brochure-2015.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Evans','2014',null,null,'Unclear','M','<20','Evan McManus','Father and son died on an attempted hike in the Echo Lake–Vance Creek area of Mount Blue Sky

Evan McManus, reported as 18, and his father Damian died on the same attempted hike; their remains were found in the Echo Lake–Vance Creek terrain. Last contact was April 2, 2014, but that is not a proven death date, and the cause has not been established.

* Location: Echo Lake/Vance Creek terrain; attempted hike
* Notes: Absent source; same event, two victims. Last contact April 2 is not proven death date; body discovery is not death date; do not infer exposure cause.
* Confidence: High identity/death; open date/cause
* Sources: https://coloradocommunitymedia.com/2014/07/17/remains-of-missing-hikers-found-on-mount-evans/ https://www.ksl.com/article/30769093 https://www.alpinerescueteam.org/wp-content/uploads/2016/05/CCSO-PSAR-brochure-2015.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Bierstadt','2007','7','6','Unclear','M','50-59','Lawrence N. Gang','Died on a Mount Bierstadt outing; found in the Evans–Bierstadt area

Gang, 53, died on July 6, 2007 according to his obituary; his body was found the following Sunday. The exact route and cause remain unresolved.

* Location: Bierstadt outing; found in Evans/Bierstadt area; exact route open
* Notes: Absent source name roster. Obituary establishes July 6; Sunday discovery is not death date. Sawtooth attribution in contemporary blog is forum speculation; do not record as established. Original coroner/SAR report needed.
* Confidence: High identity/death/date; moderate precise peak location
* Sources: https://obits.masslive.com/us/obituaries/masslive/name/lawrence-gang-obituary?id=13413130 https://gazetteoutthere.blogspot.com/2007/07/hiker-dies-on-14er-body-of-53-year-old.html
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Huron Peak','1994','7','9','Accident, other','M','40-49','Gary McCall','Flight for Life pilot killed when a rescue helicopter crashed on Huron Peak

McCall, 49, was piloting a Flight for Life rescue helicopter that crashed on the mountain; flight nurse Sandy Sigman was also killed. The rescue association account attributes the crash to rotor contact with terrain.

* Location: Flight for Life pilot; rescue helicopter crash on mountain
* Notes: Absent source. Same event as Sigman. Primary rescue association account attributes rotor/terrain contact; NTSB original report retrieval remains follow-up.
* Confidence: High
* Sources: https://mra.org/wp-content/uploads/2016/05/AccidentsMRO.pdf https://southparkambulance.com/about/in-memoriam/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Huron Peak','1994','7','9','Accident, other','F','40-49','Sandy Sigman','Flight for Life nurse killed when a rescue helicopter crashed on Huron Peak

Sigman was a Flight for Life flight nurse killed in the same rescue helicopter crash as pilot Gary McCall. Her age is given as 42 in a contemporary reprint and 43 by memorial and MRA sources.

* Location: Flight for Life nurse; rescue helicopter crash on mountain
* Notes: Absent source. Same event as McCall. Age 42 in contemporary reprint conflicts with memorial DOB and MRA age 43; band unaffected; preserve discrepancy.
* Confidence: High
* Sources: https://mra.org/wp-content/uploads/2016/05/AccidentsMRO.pdf https://southparkambulance.com/about/in-memoriam/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Belford','2003','2','22','Avalanche','M','50-59','Curt Dale','Killed in an avalanche on a backcountry ski tour south of Elkhead Pass

Dale died in an avalanche on a backcountry ski tour on the south side of Elkhead Pass. The mountain field denotes associated terrain.

* Location: Backcountry ski tour; Elkhead Pass south side
* Confidence: High; mountain field denotes associated terrain
* Sources: https://www.gsa.gov/system/files/Alfred_A_Arraj_United_States_Courthouse__Denver__CO.pdf https://www.colorado.edu/earthscience/media/912 https://www.americanavalancheassociation.org/s/TAR221r1.pdf https://www.usmodernist.org/ANN/news_2003_02_25.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Eolus','1984','7','6','Fall','M','30-39','Joseph Stolla','Fell when a rock block broke off while climbing Mount Eolus

Stolla fell while climbing Mount Eolus after a rock block broke off, according to an AAC/SAR account.

* Location: Climbing; rock block broke off
* Confidence: High AAC/SAR account
* Sources: https://publications.americanalpineclub.org/articles/13198505202
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Eolus','1984',null,null,'Fall','M','20-29','Paul Rockwood','Fell on the South Ridge of Mount Eolus

Rockwood died in a fall on the South Ridge of Mount Eolus about a month after Joseph Stolla''s July 6, 1984 death. The exact date is unknown.

* Location: South Ridge
* Confidence: High identity/death; day unknown
* Sources: https://publications.americanalpineclub.org/articles/13198505202
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Cameron','2020','8','24','Unclear',null,'50-59','Don Ward','Died on Mount Cameron

Ward, 55, died on Mount Cameron. A cardiac event is suspected, but no certified cause has been obtained.

* Location: Mount Cameron
* Notes: Age 55. Suspected cardiac event; preserve uncertainty until certified cause is obtained.
* Confidence: High event; suspected cause unresolved
* Sources: https://www.kktv.com/2020/08/28/don-wards-best-friend-shares-dons-final-moments/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Mount Sherman','1977','6','20','Accident, other',null,'20-29','Carl E. Niggemyer','Killed in a blast at the Sherman Tunnel, Day Mines Inc.

Niggemyer, 21, was killed in a blast at Day Mines Inc.''s Sherman Tunnel. Mining fatality; the original report has not been retrieved.

* Location: Day Mines Inc. / Sherman Tunnel
* Notes: All four mining fields indexed. Retain mine location and original-report limitation.
* Confidence: Indexed; original report not retrieved
* Sources: https://storage.snappages.site/o23zokrvom/assets/files/Mining_Fatalities_1844_1981.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Longs Peak','1922','8','1','Lightning',null,'30-39','Jesse Kitts','Killed by lightning near the Longs Peak summit cairn

Contemporary Estes Park Trail report states J.E. Kitts of Greeley was instantly killed by lightning near the summit cairn.

* Location: Longs Peak
* Age: 36
* Notes: Use only supported fields; no inferred demographics
* Confidence: High
* Sources: https://www.eparkhives.com/pdf/1922-EPTrail-P2.pdf
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Longs Peak','1960','4','20','Fall',null,'20-29','Prince D. Willmon','Fell on the east face of Longs Peak with David Jones

AAC identifies Willmon and David Jones as the two fatalities in the April 1960 east-face incident.

* Location: Longs Peak
* Age: 23
* Notes: Use only supported fields; no inferred demographics
* Confidence: High
* Sources: https://publications.americanalpineclub.org/articles/13196102302
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d'),
('Longs Peak','1946','9','1','Fall',null,'<20','Charles Grant','Fell nearly 800 feet climbing Longs Peak

Contemporary newspaper reporting says the 19-year-old Chicago youth fell nearly 800 feet while climbing Longs Peak.

* Location: Longs Peak
* Age: 19
* Notes: Use only supported fields; no inferred demographics
* Confidence: Strong
* Sources: https://oregonnews.uoregon.edu/lccn/sn97071090/1946-09-03/ed-1/seq-1/
* Review: Reconciliation review, Pass 47 (Oct 2026)','approved','8c2b6a49-5f09-473b-a596-986e7cc4712d');

commit;
