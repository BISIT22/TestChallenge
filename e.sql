SELECT u.name AS user_name, COUNT(*) AS open_tickets_count
FROM TroubleTickets tt
JOIN Users u ON tt.user_id = u.id
JOIN TTStatus s ON tt.tt_status = s.id
WHERE s.name = 'Открыта'
GROUP BY user_name
ORDER BY user_name;
