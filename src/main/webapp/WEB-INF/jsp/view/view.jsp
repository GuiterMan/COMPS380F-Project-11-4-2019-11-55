<!DOCTYPE html>
<html>
    <head>
        <title>Online Course Website</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Lecture: <c:out value="${lecture.lectureTitle}" /></h2>
        <security:authorize access="hasRole('ADMIN') or principal.username=='${lecture.customerName}'">            
            [<a href="<c:url value="/lecture/edit/${lecture.id}" />">Edit</a>]
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">            
            [<a href="<c:url value="/lecture/delete/${lecture.id}" />">Delete</a>]
        </security:authorize>
        <br /><br />
        <i>Lecturer Name - <c:out value="${lecture.customerName}" /></i><br /><br />
        <c:out value="${lecture.body}" /><br /><br />
        <c:if test="${fn:length(lecture.attachments) > 0}">
            Attachments:
            <c:forEach items="${lecture.attachments}" var="attachment"
                       varStatus="status">
                <c:if test="${!status.first}">, </c:if>
                <a href="<c:url value="/lecture/${lecture.id}/attachment/${attachment.name}" />">
                    <c:out value="${attachment.name}" /></a>
            </c:forEach><br /><br />
        </c:if>
        <a href="<c:url value="/lecture" />">Return to list lectures</a>
    </body>
</html>
