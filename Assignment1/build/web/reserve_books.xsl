<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">
        <html>
            <body id="reserve">
                <br />
                <br />
                <form method="GET">
                <div class="container">
                    <h2>Selected Book List</h2>
                <table class = "bookList">
		<thead>                    
			<tr>                           
                        <th>Title</th>
     			<th>Author</th>
     			<th>Category</th>
                        <th>Abstract</th>
                        <th>ISBN</th>
                        <th>Publisher</th>
                        <th>Year</th>
                        <th>Condition</th>
                        <th>Status</th>
			</tr>
		</thead>
		<tbody>
			<xsl:apply-templates/>
		</tbody>
                </table> 
                </div> 
                </form>  
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">    
        <xsl:variable name="status" select="status" />    
        <tr>
            <td><xsl:value-of select="title" /></td>
            <td><xsl:value-of select="author" /></td>
            <td><xsl:value-of select="category" /></td>
            <td><xsl:value-of select="Abstract" /></td>            
            <td><xsl:value-of select="isbn" /></td>
            <td><xsl:value-of select="publishername" /></td>
            <td><xsl:value-of select="year" /></td>
            <td><xsl:value-of select="condition" /></td>            
            <xsl:if test="status='Available'">
                <td id="green"><xsl:value-of select="status" /></td>
            </xsl:if>
            <xsl:if test="status='Reserved'">
                <td id="red"><xsl:value-of select="status" /></td>
            </xsl:if>            
        </tr>
    </xsl:template>        

</xsl:stylesheet>