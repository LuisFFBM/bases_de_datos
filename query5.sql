SELECT ti.book_ref,
       tf.flight_id
FROM   tickets ti
       JOIN ticket_flights tf
         ON ti.ticket_no = tf.ticket_no
       LEFT JOIN boarding_passes bp
              ON ti.ticket_no = bp.ticket_no
WHERE  bp.ticket_no IS NULL
ORDER  BY ti.book_ref,
          tf.flight_id;  
