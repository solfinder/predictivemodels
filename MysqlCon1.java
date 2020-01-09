
/** 
Java class for preprocessing of input data stored in mysql to transform it into relevant csv files which are then used as input for subsequent processing using R forecasting.

Developed By: Prateek Khanna
*/

import java.sql.*; 
import java.io.*;

 
class MysqlCon1{  
public static void main(String args[]){  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection(  
"jdbc:mysql://localhost:3306/darpa","root","");  

Statement stmt=con.createStatement();  
ResultSet rs=stmt.executeQuery("select distinct org_name from monthlydata");  
while(rs.next()){
	String org_name=rs.getString(1);
         try{ 
		String org_file=org_name.replace(' ','_').replace('/','_');
           FileWriter fw=new FileWriter("csv_receipts\\" + org_file +"_receipts" +".csv");
		fw.write("Month,Receipts\r\n"); 
		Connection con1=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/darpa","root","");  
   
		Statement stmt1=con1.createStatement();  
		ResultSet rs1=stmt1.executeQuery("select concat(month,'-',year),receipts from monthlydata where  org_name='" + org_name+ "';");  
		if(rs1 !=null){
			int index=1;
			while(rs1.next()){  
           		fw.write(rs1.getString(1)+"," + rs1.getInt(2)+"\r\n");
			} 
			rs1.close();
		}   
		stmt1.close();
		con1.close();
		fw.close();
    
         }catch(Exception e){e.printStackTrace();} 

         try{ 
		String org_file=org_name.replace(' ','_').replace('/','_');
           FileWriter fw=new FileWriter("csv_disposal\\" + org_file +"_disposal" +".csv");
		fw.write("Month,Disposal\r\n"); 
		Connection con1=DriverManager.getConnection(  
		"jdbc:mysql://localhost:3306/darpa","root","");  
   
		Statement stmt1=con1.createStatement();  
		ResultSet rs1=stmt1.executeQuery("select concat(month,'-',year),disposal from monthlydata where  org_name='" + org_name+ "';");  
		if(rs1 !=null){
			int index=1;
			while(rs1.next()){  
				
           		fw.write(rs1.getString(1)+"," + rs1.getInt(2)+"\r\n");
			} 
			rs1.close();
		}   
		stmt1.close();
		con1.close();
		fw.close();
    
         }catch(Exception e){e.printStackTrace();}    
   
}  
rs.close();
stmt.close();
con.close();  

}catch(Exception e){ System.out.println(e);}  
}
  
}  