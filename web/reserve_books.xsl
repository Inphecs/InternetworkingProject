<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="books">
            <body id="reserve">                
                <form method="GET" id="reserve" action="reserve_books_action.jsp">
                <div class="container">
                    <h2>Reserve Book</h2>
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
    </xsl:template>

    <xsl:template match="book">    
        <xsl:variable name="status" select="status" /> 
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
            <xsl:if test="status='Available'">                
                <td id="green"><xsl:value-of select="status" /></td>
            <td><input type="checkbox" name="" id="{$bookID}" class="checkbox-select" onclick="selectOnlyThis(this.id)" value="{$bookID}" /></td>                
            </xsl:if>
            <xsl:if test="status='Reserved'">
                <td id="red"><xsl:value-of select="status" /></td>
            <td><input type="checkbox" name="" id="{$bookID}" class="checkbox-select" onclick="selectOnlyThis(this.id)" disabled="disabled" value="{$bookID}" /></td>                
            </xsl:if>            
        </tr>
    </xsl:template> 
    
    <xsl:template match="books/reserve">
        <div class="form-group">
        <table class="table" style="width:20%">
            <tbody id="reservetable" style="display:none;">
                <tr><br /></tr>
                <th colspan="2">Book Reservation Form</th>
                <tr>
                    <td><xsl:value-of select="name" /></td>
                    <td><input type="text" class="form-control" name="name" id="name" /></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="email" /></td>
                    <td><input type="text" class="form-control" name="email" id="email" /></td>                
                </tr>
                <tr><td></td><td align="right"><input id="reserveBtn"  class="btn btn-default" type="submit" value="Reserve" /></td></tr>            
            </tbody>            
        </table>              
        </div>

    </xsl:template>       
</xsl:stylesheet>