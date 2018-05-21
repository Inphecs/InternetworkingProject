<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="listers">        
            <body id="login">            
                <div class="container">
                <xsl:apply-templates />
                </div>
            </body>
    </xsl:template>
    
    <xsl:template match="lister">        
        <h1>Login</h1>
        <br />
        <form action="login_action.jsp" method="POST">        
        <div class="form-group">                    
        <table class="table" style="width:25%">
            <tr>
                <td><xsl:value-of select="email" /></td>                
                <td><input type="text" class="form-control" name="email" /></td>
            </tr>
            <tr>
                <td><xsl:value-of select="password" /></td>                
                <td><input type="password" class="form-control" name="password" /></td>
            </tr>
            <tr><td></td><td align="right"><input type="submit" class="btn btn-default" name="submitBtn" value="Login" /></td></tr>
        </table>
        </div>
        </form>        
    </xsl:template>
    
</xsl:stylesheet>