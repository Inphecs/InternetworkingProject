<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">        
            <body id="add">            
                <div class="container">
                <xsl:apply-templates />
                </div>
            </body>
    </xsl:template>
    
    <xsl:template match="book">        
        <h1>Add Book</h1>
        <br />
        <form action="add_books_action.jsp" method="GET">        
        <div class="form-group">                    
        <table class="table" style="width:20%">            
            <tr>
                <td><xsl:value-of select="bookTitle" /></td>                
                <td><input type="text" class="form-control" name="bookTitle" /></td>
            </tr>
            <tr>
                <td><xsl:value-of select="author" /></td>                
                <td><input type="text" class="form-control" name="author" /></td>
            </tr>            
            <tr>
                <td><xsl:value-of select="category" /></td>                
                <td><select name="category" class="form-control">
                        <option value="History">History</option>
                        <option value="Technology">Technology</option>
                        <option value="Geography">Geography</option>
                        <option value="Biology">Biology</option>
                        <option value="Physics">Physics</option>
                        <option value="Maths">Maths</option>
                        <option value="English">English</option>
                        <option value="Music">Music</option>                        
                    </select></td>
            </tr>
            <tr>
                <td><xsl:value-of select="Abstract" /></td>                
                <td><input type="text" class="form-control" name="Abstract" /></td>
            </tr>         
             <tr>
                <td><xsl:value-of select="isbn" /></td>                
                <td><input type="text" class="form-control" name="isbn" /></td>
            </tr>
             <tr>
                <td><xsl:value-of select="publisher" /></td>                
                <td><input type="text" class="form-control" name="publisher" /></td>
            </tr>            
            <tr>
                <td><xsl:value-of select="year" /></td>                
                <td><input type="text" class="form-control" name="year" /></td>
            </tr>            
            <tr>
                <td><xsl:value-of select="condition" /></td>        
                <td><select name="condition" class="form-control">
                        <option value="New">New</option>
                        <option value="Good">Good</option>
                        <option value="Fair">Fair</option>
                        <option value="Poor">Poor</option>                     
                    </select></td>
            </tr>
            <tr><td></td><td align="right"><input type="submit" class="btn btn-default" name="addBtn" value="Add" /></td></tr>
        </table>
        </div>
        </form>        
    </xsl:template>
    
</xsl:stylesheet>

