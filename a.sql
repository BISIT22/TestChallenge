SELECT tt.tt_number, u.name AS user_name, tt.work_time, s.name AS status_name
FROM TroubleTickets tt
JOIN Users u ON tt.user_id = u.id
JOIN TTStatus s ON tt.tt_status = s.id
WHERE tt.work_time > '2020-12-02 12:00:00'
ORDER BY tt.work_time ASC;
