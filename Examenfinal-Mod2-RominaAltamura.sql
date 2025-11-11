USE sakila;

-- 1. . Selecciona todos los nombres de las películas sin que aparezcan duplicados.

SELECT DISTINCT title AS pelicula
	FROM film;
    
-- 2 . . Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".

SELECT title AS pelicula
	FROM film
	WHERE rating = "PG-13";
    
-- 3. Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.    

SELECT title AS titulo, description AS Descripcion_pelicula
	FROM film 
    WHERE description LIKE "%amazing%";
    
-- 4. Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos.    

SELECT title AS pelicula 
	FROM film 
	WHERE length > 120;
    
-- 5. Recupera los nombres de todos los actores.  

SELECT DISTINCT first_name AS nombre_actor
	FROM actor; 
    
-- 6. Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.

SELECT first_name AS nombre_actor, last_name AS apellido_actor
	FROM actor
	WHERE last_name LIKE "%GIBSON%"; 
    
-- 7. Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.

SELECT first_name AS nombre_actor
	FROM actor
	WHERE actor_id BETWEEN 10 AND 20;     
    
    
-- 8. Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.    

SELECT title AS pelicula
	FROM film
	WHERE rating NOT IN ('R', 'PG-13');
    
    
-- 9. Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.

SELECT COUNT(film_id) AS cantidad_peliculas, rating AS clasificacion
	FROM film
	GROUP BY rating;   

-- 10. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.     
    
 SELECT c.customer_id AS id_cliente , first_name AS nombre_cliente , c.last_name AS apellido_cliente, COUNT(r.rental_id) AS cantidad_peliculas_alquiladas
	FROM customer AS c
	LEFT JOIN rental AS r
		ON c.customer_id = r.customer_id
	GROUP BY c.customer_id;
   
-- 11. . Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoría junto con el recuento de alquileres.   

SELECT c.name AS categoria, COUNT(r.rental_id) as recuento_alquileres
	FROM category AS c
	INNER JOIN film_category as fc
		ON c.category_id = fc.category_id
	INNER JOIN film AS f
		ON fc.film_id = f.film_id
	INNER JOIN inventory AS i
		ON f.film_id = i.film_id
	INNER JOIN rental as r
		ON i.inventory_id = r.inventory_id
	GROUP BY c.category_id;
    
-- 12. Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
 
SELECT rating AS clasificacion,  AVG(length) as promedio_duracion
	FROM film 
	GROUP BY rating; 
    
-- 13. Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".    

SELECT DISTINCT a.first_name AS nombre_actor , a.last_name AS apellido_actor -- PONGO UN DISTINCT POR SI HAY UN ERROR Y SE REPITE EL ACTOR
	FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	INNER JOIN film as f
		ON fa.film_id = f.film_id
	WHERE f.title = "Indian Love";
    
-- 14. Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.    

/*Este ejercicio se puede resolver utilizando LIKE o Regex*/

-- con LIKE 

SELECT title AS titulo
	FROM film 
    WHERE description LIKE "%dog%" OR description LIKE "%cat%"; -- REPETIR LA COLUMNA EN LA CONDICION
    
-- con REGEX

SELECT title AS titulo
	FROM film
	WHERE description REGEXP 'dog|cat';
    
-- 15. Hay algún actor o actriz que no aparezca en ninguna película en la tabla film_actor

SELECT DISTINCT a.actor_id AS id_actor, a.first_name AS nombre_actor, a.last_name AS apellido_actor 
	FROM actor AS a
	LEFT JOIN film_actor as fa  -- USO UN LEFT JOIN PARA QUE ME INCLUYE LOS ACTORES QUE APARECEN PERO TAMBIEN LOS QUE NO, SI USO INNER SOLO TRAE LOS ACTORES QUE ACTUAN, YA QUE SOLO MIRA COINCIDENCIAS.
		ON a.actor_id = fa.actor_id
	WHERE fa.actor_id IS NULL;  -- 
    
/*El output es una tabla vacia por lo que no hay ningun actor o actriz en la bbdd que no haya actuado en alguna de las peliculas de la tabla film*/


-- 16. Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010    

SELECT title AS pelicula -- , release_year (me sirve para revisar que la condicion este funcionando correctamente)
	FROM film 
	WHERE release_year BETWEEN 2005 AND 2010;
    
    
-- 17. Encuentra el título de todas las películas que son de la misma categoría que "Family".

SELECT f.title AS pelicula
	FROM film AS f
	INNER JOIN film_category as fc
	ON f.film_id = fc.film_id
	INNER JOIN category as c
	ON fc.category_id = c.category_id
	WHERE c.name = "Family"; 
       
-- 18. Muestra el nombre y apellido de los actores que aparecen en más de 10 películas.

SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS Actor -- SELECT DISTINCT a.first_name as nombre_actor, a.last_name as apellido_actor si lo muestro asi puedo separar nombre y apellido
	FROM actor AS a
	INNER JOIN film_actor AS fa
		ON a.actor_id = fa.actor_id
	GROUP BY fa.actor_id
    HAVING COUNT(fa.film_id) > 10;       
    
-- 19. Encuentra el título de todas las películas que son "R" y tienen una duración mayor a 2 horas en la tabla film 

SELECT title AS titulo_pelicula   -- , rating , length PARA VERIFICAR QUE SEA CORRECTO EL RESULTADO
	FROM film
	WHERE rating = "R" AND length > 120;
    
-- 20. Encuentra las categorías de películas que tienen un promedio de duración superior a 120 minutos y muestra el nombre de la categoría junto con el promedio de duración.    

SELECT c.name AS categoria_pelicula, AVG(f.length) AS promedio_duracion
	FROM category AS c
    INNER JOIN film_category AS fc
		ON fc.category_id = c.category_id
	INNER JOIN film AS f
		ON f.film_id = fc.film_id
	GROUP BY c.category_id
    HAVING AVG(f.length) > 120;





    