<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 
    <xsl:template match="listers">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <xsl:if test="lister!= 'null'">
                        <li><a class="navbar-brand" href="manage_books.jsp">SecondHandBooks</a></li>         
                    </xsl:if>                    
                    <xsl:if test="guest!= 'null'">
                        <li><a class="navbar-brand" href="index.jsp">SecondHandBooks</a></li>         
                    </xsl:if>                                        
                </div>
                <ul class="nav navbar-nav">                 
                    <xsl:if test="lister!= 'null'">
                        <li class="manage"><a id="managetext" href="manage_books.jsp">All Books</a></li>
                    </xsl:if>
                    <xsl:if test="guest!= 'null'">                    
                        <li class="home"><a id="hometext" href="index.jsp">Available Books</a></li>   
                    </xsl:if>
                    <xsl:if test="reserve!= 'null'">
                        <li class="reserve"><a id="reservetext" href="reserve_books.jsp">Reserve Book</a></li>       
                    </xsl:if>
                    <xsl:if test="add!= 'null'">
                        <li class="add"><a id="addtext" href="add_books.jsp">Add Book</a></li>       
                    </xsl:if>
                    <xsl:if test="manage!= 'null'">
                        <li class="managebooks"><a id="managebookstext" href="manage_listed_books.jsp">Manage My Books</a></li>
                    </xsl:if>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <xsl:if test="lister!= 'null'">
                        <xsl:apply-templates/>
                    </xsl:if>
                    <xsl:if test="guest!= 'null'">
                        <li class="register"><a id="registertext" href="register.jsp"><span class="glyphicon glyphicon-user"> Register</span></a></li>
                        <li class="login"><a id="logintext" href="login.jsp"><span class="glyphicon glyphicon-log-in"> Login</span></a></li>
                    </xsl:if>
                </ul>
            </div>
        </nav>
    </xsl:template>  
        
	<xsl:template match="lister">
            <li class="edit"><a id="edittext" href='edit_lister.jsp'>My Account</a></li>
	    <li><a href='edit_lister.jsp'>Welcome back, <xsl:apply-templates/></a></li>
	    <li class="logout"><a id="logouttext" href='logout.jsp?logout=true'><span class="glyphicon glyphicon-log-out"> Logout</span></a></li>
	</xsl:template>

</xsl:stylesheet>
