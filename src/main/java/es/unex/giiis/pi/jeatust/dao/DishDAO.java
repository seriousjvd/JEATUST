package es.unex.giiis.pi.jeatust.dao;

import java.sql.Connection;
import java.util.List;

import es.unex.giiis.pi.jeatust.model.Dish;


public interface DishDAO {

	/**
	 * set the database connection in this DAO.
	 * 
	 * @param conn
	 *            database connection.
	 */
	public void setConnection(Connection conn);
	
	/**
	 * Gets a dish from the DB using id.
	 * 
	 * @param id
	 *            Dish Identifier.
	 * 
	 * @return Dish object with that id.
	 */
	public Dish get(long id);

	/**
	 * Gets a dish from the DB using name.
	 * 
	 * @param name
	 *            Dish name.
	 * 
	 * @return Dish object with that name.
	 */
	public Dish get(String name);

	
	/**
	 * Gets all the dishes from the database.
	 * 
	 * @return List of all the dishes from the database.
	 */
	public List<Dish> getAll();
	
	/**
	 * Gets all the dishes from the database that contain a text in the name.
	 * 
	 * @param search
	 *            Search string .
	 * 
	 * @return List of all the dishes from the database that contain a text in the name.
	 */
	public List<Dish> getAllBySearchName(String search);

	/**
	 * Gets all the dishes from the database that contain the requested idr.
	 *
	 * @param idr
	 *            Restaurant id .
	 *
	 * @return List of all the dishes from the database that contains the requested idr.
	 */
	public List<Dish> getAllByRestaurantId(long idr);

	/**
	 * Adds a dish to the database.
	 * 
	 * @param dish
	 *            Dish object with the dish details.
	 * 
	 * @return Dish identifier or -1 in case the operation failed.
	 */

	public long add(Dish dish);

	/**
	 * Updates an existing dish in the database.
	 * 
	 * @param dish
	 *            Dish object with the new details of the existing dish.
	 * 
	 * @return True if the operation was made and False if the operation failed.
	 */
	
	
	public boolean update(Dish dish);

	/**
	 * Deletes a dish from the database.
	 * 
	 * @param id
	 *            Dish identifier.
	 * 
	 * @return True if the operation was made and False if the operation failed.
	 */
	
	public boolean delete(long id);
}
