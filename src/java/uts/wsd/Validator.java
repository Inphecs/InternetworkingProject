package uts.wsd;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validator {    
    private final String emailPattern = "[a-zA-Z0-9]+@[a-z]+.com";
    private final String namePattern = "[a-zA-Z]+";
    private final String titlePattern = "[a-zA-Z0-9]+";    
    private final String passwordPattern = "[a-zA-Z0-9]{8,}";
    private final String dobPattern = "[1-2]{1}[0-9]{3}-[0-1]{1}[0-9]{1}-[0-3]{1}[0-9]{1}";
    private final String statusPattern = "Reserved|Available";
    private final String conditionPattern = "New|Good|Fair|Poor";
    private final String yearPattern = "[0-9]{4}";
    private final String publisherPattern = "[a-zA-Z]{1,15}";
    private final String isbnPattern = "[0-9]{3}-[0-9]{2}-[0-9]{5}-[0-9]{2}-[0-9]{1}";
    private final String abstractPattern = "[a-zA-Z]+";
            
    public Validator(){}
    
    public boolean emailValidate(String input){
        Pattern regEx = Pattern.compile(emailPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean passwordValidate(String input){
        Pattern regEx = Pattern.compile(passwordPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean titleValidate(String input){
        Pattern regEx = Pattern.compile(titlePattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }    
    
    public boolean nameValidate(String input){
        Pattern regEx = Pattern.compile(namePattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean dobValidate(String input){
        Pattern regEx = Pattern.compile(dobPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }

    public boolean statusValidate(String input){
        Pattern regEx = Pattern.compile(statusPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean conditionValidate(String input){
        Pattern regEx = Pattern.compile(conditionPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean yearValidate(String input){
        Pattern regEx = Pattern.compile(yearPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean publisherValidate(String input){
        Pattern regEx = Pattern.compile(publisherPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }    

    public boolean isbnValidate(String input){
        Pattern regEx = Pattern.compile(isbnPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }
    
    public boolean abstractValidate(String input){
        Pattern regEx = Pattern.compile(abstractPattern);
        Matcher matcher = regEx.matcher(input);
        return matcher.matches();
    }        
}
