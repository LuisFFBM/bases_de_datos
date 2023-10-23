SELECT flights.arrival_airport, COUNT(tn.flight_id) AS pasajeros_recibidos
FROM (SELECT t.ticket_no, t.flight_id
	FROM ticket_flights AS t, boarding_passes AS b
	where b.boarding_no != null and b.seat_no != null and t.flight_id = b.flight_id
	) AS tn, flights 
where tn.flight_id = flights.flight_id
Group BY flights.arrival_airport
ORDER BY pasajeros_recibidos ASC
	

--SELECT f.arrival_airport, COUNT(f.ticket_no) as pasajeros
--FROM (flights join ticket_flights on flights.flight_id = ticket_flights.flight_id) as f
--GROUP BY f.arrival_airport
--ORDER BY pasajeros ASC;

--SELECT flights.arrival_airport, COUNT(flights.flight_id) AS pasajeros_recibidos
--FROM flights
--group by flights.arrival_airport
--ORDER by pasajeros_recibidos ASC

