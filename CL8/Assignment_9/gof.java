Factory method pattern

public abstract class User {
    private String name,contact_no,email;

    public void add_money(){
        //code to add money to wallet
    }

    public void graphical_view_expenditure(){
        //code to show graphical view of money expenditure
    }

    public void Add_Daily_Expense(){
        //code to add daily expense
    }

    public void Search_Expenditure(){
        //code to search past expenditures
    }
}



Facade Design Pattern

public class Pesonal_Event {
    public int lenderId,amount;
    public Personal_Event(){}
    public Personal_Event(int lenderId,int amount)
    {
        this.lenderId=lenderId;
        this.amount=amount;
    }    

}

public class BorrowMoneyService {
    public static void Send_BorrowMoney_Request(int lenderId,int amount){
        //code to send money request to lender
    }
    public static void Pay_BorrowedMoney(){
        //code to pay borrowed money to lender
    }
}

public class LendMoneyService {
    public static boolean Answer_MoneyRequest(int amount){
        if(ValidateWalletService.validateAmount(amount)){
        //code to ansuwer money request from borrower and add personal event
        }
    }
}

public class ValidateWalletService {
    public static void validateAmount(int amount){
        //code to validate amount against wallet balance
    }
}

public interface PersonalEventService {
    void Create_Personal_Event(int lenderId,int amount);
}

public class PersonalEventServiceFacadeImpl implements PersonalEventService{
    public boolean Create_Personal_Event(int lenderId,int amount){
        Personal_Event personal_event = new Personal_Event();
        personal_event.lenderId=lenderId;
        personal_event.amount=amount;
        BorrowMoneyService.Send_BorrowMoney_Request(lenderId,amount);
        if(LendMoneyService.Answer_MoneyRequest())
        {
            System.out.println("Personal Event created");
            return true;
        }
    }
}


public class PersonalEventController {
    PersonalEventServiceFacade facade;
    boolean personalEventcreated=false;
    public void personalEvent_Created(int lenderId,int amount)
    {
        personalEventcreated=facade.Personal_Event(lenderId,amount);
        System.out.println("Personal Event Created");
    }

}

Public class GroupEventController {
    PersonalEventServiceFacade facade;
    boolean personalEventcreated=false;
    public void personalEvent_Created(int[] lenderId,int amount,int count)
    {
        for(int i=0;i<count;i++)
        {
            personalEventcreated=facade.Personal_Event(lenderId[i],amount);
        }
        System.out.println("Group Event Created");

    }

}