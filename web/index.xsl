<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">
        <html>
            <body id="home">
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
        <xsl:variable name="title" select="title" />
        <tr>
            <td><a href="reserve_books.jsp?title={$title}"><xsl:value-of select="title" /></a></td>
            <td><xsl:value-of select="author" /></td>
            <td><xsl:value-of select="category" /></td>
            <td><xsl:value-of select="copies" /></td>            
        </tr>
    </xsl:template>        

</xsl:stylesheet>