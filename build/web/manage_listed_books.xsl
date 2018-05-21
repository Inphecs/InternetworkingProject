<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">
            <body id="managebooks">
                <div class="container">
                    <h2>Manage My Books</h2>
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
                        <th>Lister</th>
                        <th>Status</th>
                        <th>Remove</th>
			</tr>
		</thead>
		<tbody>
			<xsl:apply-templates/>
		</tbody>
                </table>
                </div> 
            </body>
    </xsl:template>

    <xsl:template match="book">        
            <xsl:variable name="bookID" select="id" />
        <tr>
            <td><xsl:value-of select="title" /></td>
            <td><xsl:value-of select="author" /></td>
            <td><xsl:value-of select="category" /></td>
            <td><xsl:value-of select="Abstract" /></td>            
            <td><xsl:value-of select="isbn" /></td>
            <td><xsl:value-of select="publishername" /></td>
            <td><xsl:value-of select="year" /></td>
            <td><xsl:value-of select="condition" /></td>      
            <td><xsl:value-of select="lister" /></td>                  
            <xsl:if test="status='Available'">
                <td id="green"><xsl:value-of select="status" /></td>                    
                <td><input type="submit" class="btn btn-danger" id="{$bookID}" name="" value="Delete" onclick="window.location.href='manage_listed_books_action.jsp?bookID={$bookID}'"/></td>                                                                                    
            </xsl:if>
            <xsl:if test="status='Reserved'">
                <td id="red"><xsl:value-of select="status" /></td>   
                <td><input type="submit" class="btn btn-danger" id="{$bookID}" name="" value="Delete" disabled="disabled" /></td>                 
            </xsl:if>            
        </tr>         
    </xsl:template>           
</xsl:stylesheet>
