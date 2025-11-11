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
    
    
    
    
    
       
    