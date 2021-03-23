WITH museums_count_by_type_per_city AS (SELECT COUNT(museum_type) AS "Count", museum_type AS "Type", city_administrative_location AS "City", state_administrative_location AS "State"
FROM "museums"."museums_extracted"
GROUP BY museum_type, city_administrative_location, state_administrative_location),

museums_total_cities AS (SELECT SUM("Count") AS "Count", 'All' AS "Type", "City", "State" 
FROM museums_count_by_type_per_city
GROUP BY "City", "State"),

museums_total_by_type_per_state AS (SELECT SUM("Count") AS "Count", "Type", 'All' AS "City", "State"
FROM museums_count_by_type_per_city
GROUP BY "Type", "State"),

museums_total_by_state AS (SELECT SUM("Count") AS "Count", 'ALL' AS "Type", 'All' AS "City", "State" 
FROM museums_total_by_type_per_state
GROUP BY "State")

SELECT "Count", "Type", "City", "State" FROM museums_count_by_type_per_city
UNION
SELECT "Count", "Type", "City", "State" FROM museums_total_cities
UNION
SELECT "Count", "Type", "City", "State" FROM museums_total_by_type_per_state
UNION
SELECT "Count", "Type", "City", "State" FROM museums_total_by_state