SELECT F.flight_id, COUNT(TF.ticket_no) AS asientos_vacios
FROM flights F

JOIN seats S ON F.aircraft_code = S.aircraft_code
LEFT JOIN ticket_flights TF ON F.flight_id = TF.flight_id AND S.seat_no = TF.seat_no
GROUP BY F.flight_id

HAVING COUNT(TF.ticket_no) = (
    SELECT COUNT(S2.seat_no) AS asientos_totales
    FROM seats S2
    WHERE S2.aircraft_code = F.aircraft_code
)
