SELECT flight_no,
       Avg(Extract(epoch FROM ( actual_arrival - scheduled_arrival ))) AS
       "retraso medio"
FROM   flights
GROUP  BY flight_no
HAVING Avg(Extract(epoch FROM ( actual_arrival - scheduled_arrival ))) >= ALL (
       SELECT
       Avg(Extract(epoch FROM ( actual_arrival - scheduled_arrival )))
       FROM
              flights
       GROUP
              BY flight_no);  
