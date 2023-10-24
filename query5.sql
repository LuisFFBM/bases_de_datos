SELECT b.book_ref, tf.flight_id
FROM bookings b
  
JOIN ticket_flights tf ON b.book_ref = tf.ticket_no
LEFT JOIN boarding_passes bp ON tf.ticket_no = bp.ticket_no AND tf.flight_id = bp.flight_id
WHERE bp.ticket_no IS NULL
  
ORDER BY b.book_ref ASC, tf.flight_id ASC;
