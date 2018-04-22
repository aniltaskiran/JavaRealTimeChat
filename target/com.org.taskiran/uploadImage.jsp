<%--
  Created by IntelliJ IDEA.
  User: kev
  Date: 22.04.2018
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>File Upload Demo</title>
</head>
<body>
    <form method="post" action="uploadFile" enctype="multipart/form-data">
        Select file to upload:
        <input type="file" id="files" name="uploadFile" />
        <br/><br/>
        <input type="submit" value="Upload"/>
    </form>
    <output id="list"></output>
</body>
<script>
    if (window.FileReader) {
        function handleFileSelect(evt) {
            var files = evt.target.files;
            var f = files[0];
            var reader = new FileReader();

            reader.onload = (function(theFile) {
                return function(e) {
                    document.getElementById('list').innerHTML = ['<img src="', e.target.result,'" title="', theFile.name, '" width="50"/>'].join('');
                };
            })(f);

            reader.readAsDataURL(f);
        }
    } else {
        alert('This browser does not support FileReader');
    }
    document.getElementById('files').addEventListener('change', handleFileSelect, false);
</script>
</html>