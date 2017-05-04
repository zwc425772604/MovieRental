/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ZheLin
 */
public class CustomerEditSetting extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mysJDBCDriver = "com.mysql.jdbc.Driver"; 
        String mysURL ="jdbc:mysql://127.0.0.1:3306/cse305";
        String mysUserID = "root"; 
        String mysPassword = "1234";


        java.sql.Connection conn=null;
        try {
            Class.forName(mysJDBCDriver).newInstance();
            java.util.Properties sysprops=System.getProperties();
            sysprops.put("user",mysUserID);
            sysprops.put("password",mysPassword);

            //connect to the database
            conn=java.sql.DriverManager.getConnection(mysURL,sysprops);
   
            // get parameters
            String FName = request.getParameter("FirstName");
            String LName = request.getParameter("LastName");
            String address = request.getParameter("Address");
            String email = request.getParameter("Email");
            String city = request.getParameter("City");
            String state = request.getParameter("State");
            String zipStr = request.getParameter("Zip");
            String phoneStr = request.getParameter("Telephone");
            String creditStr = request.getParameter("CreditCard");
            String accType = request.getParameter("status");

            int zip = Integer.parseInt(zipStr);
            long phone = Long.parseLong(phoneStr);
            long credit = Long.parseLong(creditStr);
            java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTimeInMillis());

            // get original customer datas
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customerData");
            long cusId =customer.getId();
            
            // update fields if needed
            if(!customer.getFName().equals(FName)){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "FirstName");
                stmt.setString(3, "\'"+FName+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setFName(FName);
            }
            if(!customer.getLName().equals(LName)){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "LastName");
                stmt.setString(3, "\'"+LName+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setLName(LName);
            }
            
            if(!customer.getEmail().equals(email)){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "Email");
                stmt.setString(3, "\'"+email+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setEmail(email);
            }
            
            if(!customer.getAddress().equals(address)){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "Address");
                stmt.setString(3, "\'"+address+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setAddress(address);
            }
                        
            if(!customer.getCity().equals(city)){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "City");
                stmt.setString(3, "\'"+city+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setCity(city);  
            }
             
            if(!customer.getState().equals(state)){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "State");
                stmt.setString(3, "\'"+state+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setState(state); 
            }
            
            if(customer.getZip() != zip){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "Zip");
                stmt.setString(3, "\'"+zipStr+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setZip(zip); 
            }
                        
            if(customer.getPhone() != phone){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "Phone");
                stmt.setString(3, "\'"+phoneStr+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setPhone(phone); 
            }
                                    
            if(customer.getCard() != credit){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditCustomer(?,?,?)}");
                stmt.setLong(1, cusId);
                stmt.setString(2, "CreditCard");
                stmt.setString(3, "\'"+creditStr+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setCard(credit); 
            }
            
            if(customer.getType() != accType){
                // update database               
                java.sql.CallableStatement stmt = conn.prepareCall("{CALL EditAccount(?,?,?)}");
                stmt.setLong(1, customer.getAccount());
                stmt.setString(2, "Subscription");
                stmt.setString(3, "\'"+accType+"\'");
                stmt.execute();
                stmt.close();
                // update the session's bean
                customer.setType(accType); 
            }
                        
                               
        } catch(Exception e) {
            e.printStackTrace();
        }
        finally{
            try{conn.close();}catch(Exception ee){};
        }


        RequestDispatcher view = request.getRequestDispatcher("CustomerInfoServlet");
        view.forward(request, response);    

    }

}
