<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">           
    <xsl:template match="listers">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp">TextBooks</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Available Books</a></li>                    
                    <xsl:if test="lister!= 'null'">
                    <li><a href="index.jsp">Manage Books</a></li>
                    </xsl:if>
                    <xsl:if test="guest!= 'null'">
                    <li><a href="reservation.jsp">Reservations</a></li>
                    </xsl:if>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <xsl:if test="lister!= 'null'">
                    <xsl:apply-templates/>
                    </xsl:if>
                    <xsl:if test="guest!= 'null'">
                        <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Register</a></li>
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    </xsl:if>
                </ul>
            </div>
        </nav>
    </xsl:template>  
        
	<xsl:template match="lister">
            <li><a href='edit_user.jsp'>My Account</a></li>
	    <li><a href='edit_user.jsp'>Welcome back,<xsl:apply-templates/></a></li>
	    <li><a href='logout.jsp'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
	</xsl:template>

</xsl:stylesheet>
