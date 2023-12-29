SELECT tt.tt_number, u.name AS user_name, tt.work_time, s.name AS status_name
FROM TroubleTickets tt
JOIN Users u ON tt.user_id = u.id
JOIN TTStatus s ON tt.tt_status = s.id
WHERE u.name LIKE 'Иванов%' AND s.name = 'Ожидание'
ORDER BY tt.work_time DESC;
