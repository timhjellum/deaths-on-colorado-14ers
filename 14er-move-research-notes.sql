-- =====================================================================
-- 14er-deaths.com  |  Move research notes off the public pages (Oct 7, 2026)
-- Paste this whole file into Supabase > SQL Editor and click Run.
--
-- For the 176 incidents whose public note ends with the reconciliation
-- review list ("* Correction:", "* Why:", "* Status:", "* Sources:",
-- "* Review: ... Pass 47", or "* Location / Age / Notes / Confidence"),
-- that list is moved to reviewer_notes (never shown on the site) and
-- removed from incident_details. The story text above it is untouched.
-- Links you added yourself ("* Source:", "* Podcast:", "* Forum thread:")
-- stay public.
--
-- All-or-nothing: if the count isn't 176, or any note would end up empty,
-- nothing changes. Undo copy: incidents_notes_backup_20261007b.
-- Expected result at the bottom: 0 public notes still holding research lists.
-- =====================================================================

create table incidents_notes_backup_20261007b as
  select id, incident_details, reviewer_notes from incidents;
alter table incidents_notes_backup_20261007b enable row level security;

do $$
declare n int;
begin
  select count(*) into n from incidents
  where status = 'approved'
    and incident_details ~ E'\n\n\\* (Correction|Location|Age|Notes|Confidence|Sources|Review): ';
  if n <> 176 then raise exception 'expected 176 notes with research lists, found %', n; end if;

  select count(*) into n from incidents
  where status = 'approved'
    and incident_details ~ E'\n\n\\* (Correction|Location|Age|Notes|Confidence|Sources|Review): '
    and btrim(regexp_replace(incident_details, E'\n\n\\* (?:Correction|Location|Age|Notes|Confidence|Sources|Review): [\\s\\S]*$', '')) = '';
  if n <> 0 then raise exception '% notes would be left empty', n; end if;

  update incidents set
    reviewer_notes = coalesce(nullif(btrim(reviewer_notes), '') || E'\n\n', '')
      || 'Research notes (moved from the public note, Oct 2026):' || E'\n'
      || substring(incident_details from E'\n\n(\\* (?:Correction|Location|Age|Notes|Confidence|Sources|Review): [\\s\\S]*)$'),
    incident_details = rtrim(regexp_replace(incident_details, E'\n\n\\* (?:Correction|Location|Age|Notes|Confidence|Sources|Review): [\\s\\S]*$', ''), E' \r\n')
  where status = 'approved'
    and incident_details ~ E'\n\n\\* (Correction|Location|Age|Notes|Confidence|Sources|Review): ';
  get diagnostics n = row_count;
  if n <> 176 then raise exception 'updated % rows (expected 176)', n; end if;
end $$;

select count(*) filter (where incident_details ~ E'\\* (Correction|Why|Status|Review): ') as research_lists_left_public,
       count(*) filter (where reviewer_notes like '%Research notes (moved from the public note%') as moved_to_reviewer_notes
from incidents where status = 'approved';
