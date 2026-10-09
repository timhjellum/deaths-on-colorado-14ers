-- 14er-deaths.com  |  FINAL STEP (Pass 47 review, Oct 6 2026)
-- Paste this whole file into Supabase > SQL Editor and click Run.
-- Everything it needs is already staged in _bulk_edits / _bulk_adds and was
-- verified row-for-row. All-or-nothing: if anything doesn't match, nothing changes.
-- Full backup already exists: incidents_backup_20261006 (258 rows).
-- Expected result at the bottom:  approved 306, pending 2, rejected 4.

do $$
declare n int; bad text;
begin
  select count(*) into n from _bulk_edits;  if n <> 122 then raise exception 'expected 122 staged edits, found %', n; end if;
  select count(*) into n from _bulk_adds;   if n <> 54  then raise exception 'expected 54 staged additions, found %', n; end if;
  select string_agg(label || ' (' || cnt || ')', '; ') into bad
    from (select e.label, (select count(*) from incidents i where ((e.m_name is not null and i.climber_name = e.m_name and i.mountain = e.m_mountain and i.year = e.m_year)
      or (e.m_name is null and i.climber_name is null and i.mountain = e.m_mountain and i.year = e.m_year
          and i.month is not distinct from e.m_month and i.day is not distinct from e.m_day and i.cause = e.m_cause))) cnt from _bulk_edits e) x where cnt <> 1;
  if bad is not null then raise exception 'Edits not matching exactly one row: %', bad; end if;

  update incidents set status = 'rejected', reviewed_at = now(), reviewer_notes = 'Removed from confirmed 14er deaths (Reconciliation review, Pass 47, Oct 2026): Survived; should not be in the death list. AAC and contemporary reporting state Bendixen escaped the mountain, reached Allenspark alive, and provided rescuers with information. Sources: https://publications.americanalpineclub.org/articles/13196102302 https://oregonnews.uoregon.edu/lccn/sn97071090/1960-04-21/ed-1/seq-12/ocr/'
    where climber_name = 'Jane R. Bendixen' and mountain = 'Longs Peak' and year = 1960;
  get diagnostics n = row_count; if n <> 1 then raise exception 'Removal 1 matched % rows', n; end if;
  update incidents set status = 'rejected', reviewed_at = now(), reviewer_notes = 'Removed from confirmed 14er deaths (Reconciliation review, Pass 47, Oct 2026): Still officially missing; not a confirmed fatality. NPS and Colorado cold-case records list Pruitt as missing from the Glacier Gorge area, with no date of death and no body recovered. Sources: https://home.nps.gov/orgs/1563/cold-cases.htm https://apps.colorado.gov/apps/coldcase/casedetail.html?id=375040'
    where climber_name = 'James Pruitt' and mountain = 'Longs Peak' and year = 2019;
  get diagnostics n = row_count; if n <> 1 then raise exception 'Removal 2 matched % rows', n; end if;
  update incidents set status = 'rejected', reviewed_at = now(), reviewer_notes = 'Removed from confirmed 14er deaths (Reconciliation review, Pass 47, Oct 2026): Missing-person case; no confirmed death/body recovery located. Official sheriff reporting describes Cook as missing and later searches as unsuccessful. Sources: https://pitkincounty.com/CivicAlerts.aspx?AID=118'
    where climber_name = 'David Cook' and mountain = 'Maroon Bells' and year = 2016;
  get diagnostics n = row_count; if n <> 1 then raise exception 'Removal 3 matched % rows', n; end if;
  update incidents set status = 'rejected', reviewed_at = now(), reviewer_notes = 'Removed from confirmed 14er deaths (Reconciliation review, Pass 47, Oct 2026): Bryan Ludwig, age 29, died on Pico Aislado (13er), not Crestone Peak. A memorial by a close climbing partner states Ludwig died in a fall on Pico Aislado; obituary confirms June 19, 2021. Sources: https://www.14ers.com/php14ers/tripreport.php?cpgm=tripmine&trip=21118'
    where climber_name = 'Bryan Ludwig' and mountain = 'Crestone Peak' and year = 2021;
  get diagnostics n = row_count; if n <> 1 then raise exception 'Removal 4 matched % rows', n; end if;

  update incidents i set
    climber_name = case when e.changes ? 'climber_name' then (e.changes->>'climber_name') else i.climber_name end,
    mountain = case when e.changes ? 'mountain' then (e.changes->>'mountain') else i.mountain end,
    year = case when e.changes ? 'year' then (e.changes->>'year')::int else i.year end,
    month = case when e.changes ? 'month' then (e.changes->>'month')::int else i.month end,
    day = case when e.changes ? 'day' then (e.changes->>'day')::int else i.day end,
    cause = case when e.changes ? 'cause' then (e.changes->>'cause') else i.cause end,
    gender = case when e.changes ? 'gender' then (e.changes->>'gender') else i.gender end,
    age = case when e.changes ? 'age' then (e.changes->>'age') else i.age end,
    incident_details = coalesce(nullif(btrim(i.incident_details), ''), 'Research notes') || E'\n\n' || e.notes
  from _bulk_edits e
  where ((e.m_name is not null and i.climber_name = e.m_name and i.mountain = e.m_mountain and i.year = e.m_year)
      or (e.m_name is null and i.climber_name is null and i.mountain = e.m_mountain and i.year = e.m_year
          and i.month is not distinct from e.m_month and i.day is not distinct from e.m_day and i.cause = e.m_cause));
  get diagnostics n = row_count;
  if n <> 122 then raise exception 'edits updated % rows (expected 122)', n; end if;

  insert into incidents (mountain, year, month, day, cause, gender, age, climber_name, incident_details, status, submitted_by)
  select mountain, year, month, day, cause, gender, age, climber_name, incident_details, status, submitted_by from _bulk_adds;
  get diagnostics n = row_count;
  if n <> 54 then raise exception 'inserted % additions (expected 54)', n; end if;

end $$;

select status, count(*) from incidents group by status order by 1;

-- OPTIONAL CLEANUP afterwards (run separately once you're happy):
-- drop table _bulk_edits;
-- drop table _bulk_adds;
-- drop table incidents_removed;   -- empty; not needed since removals are status = 'rejected'
-- Keep incidents_backup_20261006 until you've checked the site.
