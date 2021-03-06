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
        <table class="table" style="width:25%">
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
            <label style="color:red;" id="nameError" name="nameError"><xsl:value-of select="nameError" /></label>
            <label style="color:red;" id="emailError" name="emailError"><xsl:value-of select="emailError" /></label>
            <label style="color:red;" id="passwordError" name="passwordError"><xsl:value-of select="passwordError" /></label>
            <label style="color:red;" id="dobError" name="dobError"><xsl:value-of select="dobError" /></label>                     
            <tr><td></td><td align="right"><input type="submit" class="btn btn-default" name="submitBtn" value="Register" /></td></tr>
        </table>
        </div>
        </form>        
    </xsl:template>
    
</xsl:stylesheet>