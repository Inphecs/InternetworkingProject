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
        
        <h1>Edit a Lister</h1>
        <form action="edit_lister.jsp" method="POST" onsubmit="return callMessage()">        
        <table>
            <tr>
                <td><label for="name">Name: </label></td>                
                <td><input type="text" name="name" value="{$name}" /></td>
            </tr>
            <tr>
                <td><label for="email">Email: </label></td>                
                <td><input type="text" name="email" value="{$email}" /></td>
            </tr>            
            <tr>
                <td><label for="password">Password: </label></td>                
                <td><input type="password" name="password" value="{$password}" /></td>
            </tr>
            <tr>
                <td><label for="dob">Dob: </label></td>                
                <td><input type="text" name="dob" value="{$dob}" /></td>
            </tr>              
            <tr><td></td><td><input type="submit" name="submitBtn" value="Edit"  /></td></tr>
        </table>
        </form>        
    </xsl:template>    
</xsl:stylesheet>
