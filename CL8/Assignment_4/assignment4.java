public class user{
    String loginId, password;
    int wallet;
    public user(loginId, password, wallet){
        this.loginId = loginId;
        this.password = password;
        this.wallet = wallet;
    }
    public int login(){}
    public void manageExpense(){}
    public void updateWallet(){}
    public void addLogs(){}
    public void addMoney(){}
}

public class notification{
    String description;
    Date date;
    public notification(String description, Date date){
        this.description = description;
        this.date = date;
    }
    public void addNotification(){}
    public void markAsRead(){}
    public void delete(){}
}



public class lender extends user{
    List<user> pending_list;
    List<notification> notifications;
    public lender(List<user> pending_list,List<notification> notifications){
        this.pending_list = pending_list;
        this.notifications = notifications;                     
    }
    public void acceptGroupRequest(){}
    public void acceptPersonalRequest(){}
    public void rejectGroupRequest(){}
    public void rejectPersonalRequest(){}
}


public class borrower extends user{
    List<user> pending_list;
    List<notification> notifications;
    public borrower(List<user> pending_list,List<notification> notifications){
        this.pending_list = pending_list;
        this.notifications = notifications;                     
    }
    public void sendPersonalRequest(){}
    public void sendGroupRequest(){}
    public void sendNotification(){}
}



public class personalEvent{
    int eventId;
    lender lender;
    borrower borrower;

    public personalEvent(lender lender, borrower borrower){
        this.lender = lender;
        this.borrower = borrower;
    }
    public int addEvent(){}
    public int addLender(){}
    public int addBorrower(){}
    public void settle(){}
}


public class groupEvent{
    int eventId;
    lender eventOwner;
    List<borrower> participants;

    public personalEvent(lender owner, List<borrower> participants){
        this.lender = lender;
        this.participants = participants;
    }
    public int addEvent(){}
    public int addOwner(){}
    public int addParticipants(){}
    public void settle(){}
}