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

    