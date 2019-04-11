<!DOCTYPE html>
<html>
    <head>
        <title>Online Course Website</title>
    </head>
    <body>
        <security:authorize access="hasAnyRole('USER','ADMIN')">        
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
        </security:authorize>
        <h1>COMPS380F</h1>
        <h2>Lectures</h2>
        <security:authorize access="hasRole('ADMIN')">    
            <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
        </security:authorize>
        <a href="<c:url value="/lecture/create" />">Create a Lecture</a><br /><br />
        <c:choose>
            <c:when test="${fn:length(lectureDatabase) == 0}">
                <i>There are no lectures in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${lectureDatabase}" var="lecture">
                    Lecture:
                    <a href="<c:url value="/lecture/view/${lecture.id}" />">
                        <c:out value="${lecture.lectureTitle}" /></a>
                    (lecturer: <c:out value="${lecture.customerName}" />)
                    <security:authorize access="hasRole('ADMIN')">
                        [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]          
                        [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
