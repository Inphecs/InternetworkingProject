<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="listers">        
        <html>
            <body id="register">            
                <div class="container">
                <xsl:apply-templates />
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="lister">        
        <h1>Register a Lister</h1>
        <form action="register_action.jsp" method="POST">        
        <table>
            <tr>
                <td><xsl:value-of select="name" /></td>                
                <td><input type="text" name="name" /></td>
            </tr>
            <tr>
                <td><xsl:value-of select="email" /></td>                
                <td><input type="text" name="email" /></td>
            </tr>            
            <tr>
                <td><xsl:value-of select="password" /></td>                
                <td><input type="password" name="password" /></td>
            </tr>
            <tr>
                <td><xsl:value-of select="dob" /></td>                
                <td><input type="text" name="dob" /></td>
            </tr>            
            <tr><td></td><td><input type="submit" name="submitBtn" value="Register" /></td></tr>
        </table>
        </form>        
    </xsl:template>
    
</xsl:stylesheet>
