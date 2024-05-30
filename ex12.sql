select distinct author_id as id from Views
where viewer_id = 1 or viewer_id = 4
order by author_id
