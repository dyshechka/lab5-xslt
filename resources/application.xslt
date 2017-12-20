<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:m="http://martha.qweert.ru"
                xmlns:xalan="http://xml.apache.org/xalan" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"&gt;</xsl:text>
        <html>
            <head>
                <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
            </head>
            <body>
                <div class="container">

                    <table class="table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Тип</th>
                                <th>Наименование</th>
                                <th style="text-align:center">Количество</th>
                                <th style="text-align:center">Стоимость за одну штуку</th>
                                <th style="text-align:center">Итого</th>
                            </tr>
                        </thead>

                        <tbody>

                            <xsl:for-each select="m:application/m:goods/m:good">
                                <tr>
                                    <td>
                                        <xsl:number/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="@goodType"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="m:name"/>
                                    </td>
                                    <td style="text-align:center">
                                        <xsl:value-of select="m:quantity"/>
                                    </td>
                                    <td style="text-align:center">
                                        <xsl:value-of select="m:cost"/>
                                    </td>
                                    <td style="text-align:center">
                                        <item>
                                            <xsl:value-of select="m:cost*m:quantity"/>
                                        </item>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th style="text-align:center">
                                    <xsl:variable name="tmpTotal">
                                        <total_amount>
                                            <xsl:for-each select="m:application/m:goods/m:good">
                                                <item>
                                                    <xsl:value-of select="m:cost*m:quantity"/>
                                                </item>
                                            </xsl:for-each>
                                        </total_amount>
                                    </xsl:variable>
                                    <total>
                                        <xsl:variable name="myTotal" select="xalan:nodeset($tmpTotal)"/>
                                        <xsl:value-of select="sum($myTotal/total_amount/item)"/>
                                    </total>
                                </th>
                            </tr>
                        </tfoot>
                    </table>
                    <div>
                        <label>Имя: </label>
                        <xsl:value-of select="m:application/m:person/m:firstName"/>
                    </div>
                    <div>
                        <label>Фамилия: </label>
                        <xsl:value-of select="m:application/m:person/m:lastName"/>
                    </div>
                    <div>
                        <label>Отчество:    </label>
                        <xsl:value-of select="m:application/m:person/m:patronymic"/>
                    </div>
                    <div>
                        <label>Дата рождения:   </label>
                        <xsl:value-of select="m:application/m:person/m:birthDate"/>
                    </div>
                </div>
            </body>
        </html>

    </xsl:template>


</xsl:stylesheet>