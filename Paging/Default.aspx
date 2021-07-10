<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Paging.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Paging Example</title>
    <style type="text/css">
        .paging 
        {
            margin: 0;
            padding: 0;
            font-family: arial, sans-serif;
            font-size: 12px;
            color: #000;
        }
        .paging li 
        {
            width: 25px;
            float: left;
            list-style-type: none;
            text-align: center;
            padding: 2px;
        }
        .paging li a,
        .paging li span
        {
            width: 25px;
            display: block;
        }
        .paging li a 
        {
            background-color: #DDD;
            text-decoration: none;
            border: 1px solid #000;
            color: #000;
        }
        .paging li a:hover
        {
            background-color: #FFF;
        }
        .paging li span.current 
        {
            border: 1px solid #000;
            background-color: #FFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <ul class="paging">
            <% if (CurrentPage > 1 ) { %>
                <li><a href="default.aspx?page=1">&laquo;</a></li>
                <li><a href="default.aspx?page=<%=CurrentPage-1%>">&lsaquo;</a></li>
            <% } else { %>
                <li><span>&nbsp;</span></li>
                <li><span>&nbsp;</span></li>
            <% } %>
            <% if (PagingRange["PagingStart"] > 1) { %>
                <li><span>&hellip;</span></li>
            <% } else { %>
                <li><span>&nbsp;</span></li>
            <% } %>
            <% for (var i = PagingRange["PagingStart"]; i <= PagingRange["PagingEnd"]; ++i) { %>
                <% if (CurrentPage == i) { %>
                    <li><span class="current"><%=CurrentPage%></span></li>
                <% } else { %>
                    <li><a href="default.aspx?page=<%=i%>"><%=i%></a></li>
                <% } %>
            <% } %>
            <% if (PagingRange["PagingEnd"] < PageCount) { %>
                <li><span>&hellip;</span></li>
            <% } else { %>
                <li><span>&nbsp;</span></li>
            <% } %>
            <% if (CurrentPage < PageCount) { %>
                <li><a href="default.aspx?page=<%=CurrentPage+1%>">&rsaquo;</a></li>
                <li><a href="default.aspx?page=<%=PageCount%>">&raquo;</a></li>
            <% } %>
        </ul>
    </div>
    </form>
</body>
</html>
