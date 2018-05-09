<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">
        <html>
            <body>
                <table>
		<thead>
			<tr>
                        <th>Title</th>
     			<th>Author</th>
     			<th>Category</th>
                        <th>Abstract</th>
                        <th>ISBN</th>
                        <th>Year</th>
                        <th>Condition</th>
                        <ht>Status</ht>
			</tr>
		</thead>
		<tbody>
			<xsl:apply-templates/>
		</tbody>
                </table>    
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">		        
        <tr>
            <td><xsl:value-of select="title" /></td>
            <td><xsl:value-of select="author" /></td>
            <td><xsl:value-of select="category" /></td>
            <td><xsl:value-of select="abstract" /></td>
            <td><xsl:value-of select="isbn" /></td>
            <td><xsl:value-of select="year" /></td>
            <td><xsl:value-of select="condition" /></td>
            <td><xsl:value-of select="status" /></td>
        </tr>
    </xsl:template>        

</xsl:stylesheet>
