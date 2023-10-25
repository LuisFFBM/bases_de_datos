SELECT f.arrival_airport AS "Código del Aeropuerto",
       Count(bp.seat_no) AS "Número de Pasajeros Recibidos"
FROM   flights AS f
       JOIN boarding_passes AS bp
         ON f.flight_id = bp.flight_id
GROUP  BY f.arrival_airport
ORDER  BY Count(bp.seat_no) ASC; 

