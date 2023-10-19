\H
\o query1.html
\qecho

--SELECT flight_no, COUNT(flight_no) FROM flights GROUP BY flight_no HAVING COUNT(flight_no) > 50;

--SELECT F1.departure_airport, F1.flight_no, F2.arrival_airport, COUNT(*)
---From flights F1, flights F2
---WHERE F1.departure_airport = F2.arrival_airport
--GROUP BY   F1.flight_no,F1.departure_airport , F2.arrival_airport;

--SELECT flight_no, COUNT(flight_no)
--FROM flights, ticket_flights
--WHERE flights.flight_id = ticket_flights.flight_id
--	and  IN (
				
--Group by flight_no





