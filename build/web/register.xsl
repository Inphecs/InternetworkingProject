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
        <h1>Register</h1>
        <br />
        <form action="register_action.jsp" method="POST">        
        <div class="form-group">                    
        <table class="table" style="width:20%">
            <tr>
                <td><xsl:value-of select="name" /></td>                
                <td><input type="text" class="form-control" name="name" /></td>
            </tr>
            <tr>
                <td><xsl:value-of select="email" /></td>                
                <td><input type="text" class="form-control" name="email" /></td>
            </tr>            
            <tr>
                <td><xsl:value-of select="password" /></td>                
                <td><input type="password" class="form-control" name="password" /></td>
            </tr>
            <tr>
                <td><xsl:value-of select="dob" /></td>                
                <td><input type="text" class="form-control" name="dob" /></td>                
            </tr>                        
            <tr><td></td><td align="right"><input type="submit" class="btn btn-default" name="submitBtn" value="Register" /></td></tr>
        </table>
        </div>
        </form>        
    </xsl:template>
    
</xsl:stylesheet>