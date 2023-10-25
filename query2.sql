
SELECT bookings.book_ref,
       bookings.total_amount,
       Sum(amounts.amount) AS calc_amount
FROM   (SELECT tickets.book_ref,
               ticket_flights.amount
        FROM   tickets
               JOIN ticket_flights
                 ON tickets.ticket_no = ticket_flights.ticket_no) AS amounts
       JOIN bookings
         ON bookings.book_ref = amounts.book_ref
GROUP  BY bookings.book_ref
ORDER  BY bookings.book_ref ASC; 