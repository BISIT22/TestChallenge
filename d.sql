SELECT DATE(tt.work_time) AS date, s.name AS status_name, COUNT(*) AS count
FROM TroubleTickets tt
JOIN TTStatus s ON tt.tt_status = s.id
WHERE (tt.work_time BETWEEN '2020-12-02 00:00:00' AND '2020-12-04 23:59:59') AND (s.name = 'Открыта' OR s.name = 'Ожидание')
GROUP BY date, status_name;
