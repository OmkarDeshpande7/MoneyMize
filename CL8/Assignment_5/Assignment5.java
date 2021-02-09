
public class LoginController
{
	Connection con = null;
	SQLQuery query = null;

	public LoginController()
	{
		// Prepare the statement using the function 
		// Execute Query
		// Close the connection
	}
	public void Fetch dashboard()
	{
		//fetch details for dashboard
	}
}



public class dailyExpense
{
	public String category;
	public int amount;
	public String eid;
	public Date dateOfExpense;

	public void addDaily()
	{
		//add daily expense 
	}	
}


public class groupExpense
{
	public String gid;
	public int amount;
	public String phno;
	public Date dateOfExpense;

	public void addGroup()
	{
		//add group expense 
	}	
}

public class personalExpense
{
	public String pid;
	public int amount;
	public Date dateOfExpense;
	public String expenseReason;	

	public void addGroup()
	{
		//add group expense 
	}	
}






