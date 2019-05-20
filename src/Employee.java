
public class Employee {
	int emp_id;
	String emp_name;
	String doj;
	String dob;
	String emp_dept;
	String emp_desg;
	public Employee(int emp_id, String emp_name, String doj, String dob, String emp_dept, String emp_desg) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.doj = doj;
		this.dob = dob;
		this.emp_dept = emp_dept;
		this.emp_desg = emp_desg;
	}
	public int getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(int emp_id) {
		this.emp_id = emp_id;
	}
	public String getEmp_name() {
		return emp_name;
	}
	public void setName(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDoj() {
		return doj;
	}
	public void setDoj(String doj) {
		this.doj = doj;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmp_dept() {
		return emp_dept;
	}
	public void setEmp_dept(String emp_dept) {
		this.emp_dept = emp_dept;
	}
	public String getEmp_desg() {
		return emp_desg;
	}
	public void setEmp_desg(String emp_desg) {
		this.emp_desg = emp_desg;
	}
	@Override
	public String toString() {
		return "Employee [emp_id=" + emp_id + ", emp_name=" + emp_name + ", doj=" + doj + ", dob=" + dob + ", emp_dept="
				+ emp_dept + ", emp_desg=" + emp_desg + "]";
	}
}