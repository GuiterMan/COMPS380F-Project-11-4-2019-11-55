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

        <h2>Create a Lecture</h2>
        <form:form method="POST" enctype="multipart/form-data" modelAttribute="lectureForm">
            <form:label path="lectureTitle">LectureTitle</form:label><br/>
            <form:input type="text" path="lectureTitle" /><br/><br/>
            <form:label path="body">Body</form:label><br/>
            <form:textarea path="body" rows="5" cols="30" /><br/><br/>
            <b>Attachments</b><br/>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
            <div id="drop-zone">
                Drop files here...
                <div id="clickHere">
                    or click here..
                    <input type="file" name="file" id="file" />
                </div>
            </div>

            <input type="file" name="attachments" multiple="multiple"/><br/><br/>          
            <input type="submit" value="Submit"/>
        </form:form>



        <script>
            $(function () {
                var dropZoneId = "drop-zone";
                var buttonId = "clickHere";
                var mouseOverClass = "mouse-over";

                var dropZone = $("#" + dropZoneId);
                var ooleft = dropZone.offset().left;
                var ooright = dropZone.outerWidth() + ooleft;
                var ootop = dropZone.offset().top;
                var oobottom = dropZone.outerHeight() + ootop;
                var inputFile = dropZone.find("input");
                document.getElementById(dropZoneId).addEventListener("dragover", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    dropZone.addClass(mouseOverClass);
                    var x = e.pageX;
                    var y = e.pageY;

                    if (!(x < ooleft || x > ooright || y < ootop || y > oobottom)) {
                        inputFile.offset({top: y - 15, left: x - 100});
                    } else {
                        inputFile.offset({top: -400, left: -400});
                    }

                }, true);

                if (buttonId != "") {
                    var clickZone = $("#" + buttonId);

                    var oleft = clickZone.offset().left;
                    var oright = clickZone.outerWidth() + oleft;
                    var otop = clickZone.offset().top;
                    var obottom = clickZone.outerHeight() + otop;

                    $("#" + buttonId).mousemove(function (e) {
                        var x = e.pageX;
                        var y = e.pageY;
                        if (!(x < oleft || x > oright || y < otop || y > obottom)) {
                            inputFile.offset({top: y - 15, left: x - 160});
                        } else {
                            inputFile.offset({top: -400, left: -400});
                        }
                    });
                }

                document.getElementById(dropZoneId).addEventListener("drop", function (e) {
                    $("#" + dropZoneId).removeClass(mouseOverClass);
                }, true);

            })
        </script>
        <style>
            #drop-zone {
                /*Sort of important*/
                width: 300px;
                /*Sort of important*/
                height: 200px;
                position:absolute;
                left:50%;
                top:100px;
                margin-left:-150px;
                border: 2px dashed rgba(0,0,0,.3);
                border-radius: 20px;
                font-family: Arial;
                text-align: center;
                position: relative;
                line-height: 180px;
                font-size: 20px;
                color: rgba(0,0,0,.3);
            }

            #drop-zone input {
                /*Important*/
                position: absolute;
                /*Important*/
                cursor: pointer;
                left: 0px;
                top: 0px;
                /*Important This is only comment out for demonstration purposes.
                opacity:0; */
            }

            /*Important*/
            #drop-zone.mouse-over {
                border: 2px dashed rgba(0,0,0,.5);
                color: rgba(0,0,0,.5);
            }


            /*If you dont want the button*/
            #clickHere {
                position: absolute;
                cursor: pointer;
                left: 50%;
                top: 50%;
                margin-left: -50px;
                margin-top: 20px;
                line-height: 26px;
                color: white;
                font-size: 12px;
                width: 100px;
                height: 26px;
                border-radius: 4px;
                background-color: #3b85c3;

            }

            #clickHere:hover {
                background-color: #4499DD;

            }
        </style>

    </body>
</html>
