SELECT f.flight_id AS "  vuelo  ",
       Count(*)    AS "número de asientos vacíos"
FROM   flights AS f
       JOIN seats AS s
         ON f.aircraft_code = s.aircraft_code
       LEFT JOIN boarding_passes AS bp
              ON f.flight_id = bp.flight_id
                 AND s.seat_no = bp.seat_no
GROUP  BY f.flight_id
HAVING Count(s.seat_no) - Count(bp.seat_no) = (SELECT Max(cs - cbp)
                                               FROM
              (SELECT Count(s.seat_no)  AS cs,
                      Count(bp.seat_no) AS cbp
               FROM   flights AS f
                      JOIN seats AS s
                        ON f.aircraft_code =
                           s.aircraft_code
                      LEFT JOIN boarding_passes
                                AS bp
                             ON f.flight_id =
                                bp.flight_id
                                AND
                      s.seat_no = bp.seat_no
               GROUP  BY f.flight_id) AS sitios_vacios);  
