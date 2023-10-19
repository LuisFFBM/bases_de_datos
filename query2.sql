\H
\o query2.html
\qecho

SELECT bookings.book_ref, bookings.total_amount

FROM bookings

where bookings.book_ref in (select tickets.book_ref, SUM(ticket_flights.amount) as calc_amount
	FROM tickets, ticket_flights
	where tickets.ticket_no = ticket_flights.ticket_no
	group by tickets.book_ref
	);

select tickets.book_ref,SUM(ticket_flights.amount) as calc_amount
	FROM tickets, ticket_flights
	where tickets.ticket_no = ticket_flights.ticket_no
	group by tickets.book_ref;
