package cn.edu.tit.bean;

public class Admin {

	private Integer adminId; // 管理员id
	private String adminUsername; // 管理员名
	private String adminPassword; // 管理员密码
	
	// setter-getter
	
	public String getAdminUsername() {
		return adminUsername;
	}
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public Admin(Integer adminId, String adminUsername, String adminPassword) {
		super();
		this.adminId = adminId;
		this.adminUsername = adminUsername;
		this.adminPassword = adminPassword;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminUsername=" + adminUsername + ", adminPassword=" + adminPassword
				+ "]";
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
