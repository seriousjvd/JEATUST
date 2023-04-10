package es.unex.giiis.pi.jeatust.dao;

import java.sql.Connection;
import java.util.List;

import es.unex.giiis.pi.jeatust.model.Order;


public interface OrderDAO {

	/**
	 * set the database connection in this DAO.
	 * 
	 * @param conn
	 *            database connection.
	 */
	public void setConnection(Connection conn);
	
	/**
	 * Gets a order from the DB using id.
	 * 
	 * @param id
	 *            Order Identifier.
	 * 
	 * @return Order object with that id.
	 */
	public Order get(long id);
	
	
	/**
	 * Gets a order from the DB using idu and totalPrice.
	 * 
	 * @param idu
	 *            User Identifier.
	 * @param totalPrice
	 *            Order total price.
	 * 
	 * @return Order object with that id.
	 */
	public Order get(long idu,int totalPrice);


	
	/**
	 * Gets all the orderes from the database.
	 * 
	 * @return List of all the orderes from the database.
	 */
	public List<Order> getAll();

	/**
	 * Gets all the orderes from the database using idu.
	 *
	 * @return List of all the orderes from the database using idu.
	 */
	public List<Order> getAllByIdu(long idu);
	

	/**
	 * Adds a order to the database.
	 * 
	 * @param order
	 *            Order object with the order details.
	 * 
	 * @return Order identifier or -1 in case the operation failed.
	 */
	
	public long add(Order order);

	/**
	 * Updates an existing order in the database.
	 * 
	 * @param order
	 *            Order object with the new details of the existing order.
	 * 
	 * @return True if the operation was made and False if the operation failed.
	 */
	
	
	public boolean update(Order order);

	/**
	 * Deletes a order from the database.
	 * 
	 * @param id
	 *            Order identifier.
	 * 
	 * @return True if the operation was made and False if the operation failed.
	 */
	
	public boolean delete(long id);
}
