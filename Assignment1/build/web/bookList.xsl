<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">
        <html>
            <body>
                <form method="GET">
                <table class = "bookList">
		<thead>
			<tr>
                        <th>Title</th>
     			<th>Author</th>
     			<th>Category</th>
                        <th>Number of copies</th>
			</tr>
		</thead>
		<tbody>
			<xsl:apply-templates/>
		</tbody>
                </table>  
                </form>  
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">        
        <tr>
            <xsl:variable name="booktitle" select="title"/>
            <input type="hidden" value="$booktitle" /> 
            <td><a href="manage_books.jsp"><xsl:value-of select="title" /></a></td>
            <td><xsl:value-of select="author" /></td>
            <td><xsl:value-of select="category" /></td>
            <td><xsl:value-of select="copies" /></td>            
        </tr>
    </xsl:template>        

</xsl:stylesheet>