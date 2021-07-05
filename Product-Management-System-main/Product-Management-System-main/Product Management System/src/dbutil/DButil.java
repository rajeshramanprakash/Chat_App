package dbutil;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DButil {
	public Connection dbconnection() {
		String url = "jdbc:mysql://localhost:3306/product_management";
		String username = "root";
		String password = "";
		
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection(url, username, password);
				System.out.println("Connection Successfully Connected.");
				return connection;
			} catch (SQLException | ClassNotFoundException e) {
				System.out.println("Connection Failed.");
				e.printStackTrace();
			}
			return null;
		}
	public static void main(String arg []) {
		DButil obj = new DButil();
		System.out.println(obj.dbconnection());
	}
}

