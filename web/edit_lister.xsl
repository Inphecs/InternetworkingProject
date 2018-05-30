<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="listers">        
        <html>
            <body id="edit">            
                <div class="container">
                <xsl:apply-templates />
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="lister">        
        <xsl:variable name="name" select="name" />
        <xsl:variable name="email" select="email" />
        <xsl:variable name="password" select="password" />
        <xsl:variable name="dob" select="dob" />
        
        <h1>Edit</h1>
        <form action="edit_lister_action.jsp" method="POST">        
        <div class="form-group">                    
        <table class="table" style="width:25%">
            <tr>
                <td><label for="name">Name: </label></td>                
                <td><input type="text" class="form-control" name="name" value="{$name}" readonly="readonly" /></td>
                <input type="hidden" class="form-control" name="name" value="{$name}"/>
            </tr>
            <tr>
                <td><label for="email">Email: </label></td>                
                <td><input type="text" class="form-control" name="email" value="{$email}" readonly="readonly"/></td>
                <input type="hidden" class="form-control" name="email" value="{$email}"/>
            </tr>            
            <tr>
                <td><label for="password">Password: </label></td>                
                <td><input type="password" class="form-control" name="password" value="{$password}" /></td>
            </tr>
            <tr>
                <td><label for="dob">Dob: </label></td>                
                <td><input type="text" class="form-control" name="dob" value="{$dob}" /></td>
            </tr>              
            <tr><td></td><td align="right"><input type="submit" class="btn btn-default" name="submitBtn" value="Edit"  /></td></tr>
        </table>            
            <label style="color:red;" id="passwordError" name="passwordError"><xsl:value-of select="passwordError" /></label>
            <label style="color:red;" id="dobError" name="dobError"><xsl:value-of select="dobError" /></label>                    
            <label style="color:green;" id="pass" name="pass"><xsl:value-of select="pass" /></label>                     
        </div>
        </form>        
    </xsl:template>    
</xsl:stylesheet>
