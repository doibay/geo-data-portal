<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/jsp/header.jsp" var="head" />
<c:import url="/jsp/footer.jsp" var="foot" />
<c:set var="cont" value="<%=request.getContextPath()%>" />
<jsp:useBean id="uploadedFileList" scope="session" class="java.util.ArrayList"  />

<c:url var="upload" value="/jsp/fileUpload.jsp"/>
<c:url var="geotoolsProcessing" value="/Router?location=geotoolsProcessing&action=initial"/>
<c:url var="cdmProcessing" value="/jsp/cdmProcessing.jsp"/>
<c:url var="deleteFile" value="/Router?location=uploadFiles&action=delete&file="/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${cont}/css/gdp_main.css"  title="USGS Full Width Nav" media="projection, screen, tv" type="text/css">
	<link rel="stylesheet" href="${cont}/css/gdp_main_print.css"  title="USGS Full Width Nav" media="print" type="text/css">
	<link rel="stylesheet" href="${cont}/css/full_width.css"  title="USGS Full Width Nav" media="projection, screen, tv" type="text/css">
	<title>File Upload</title>
</head>

<script type="text/javascript">
<!--
	function addUploadSlot() {
		var uploadInputList = document.getElementById("fileUploads");
		var addSlotText = "<label for='fileUploadInput'>File...</label> " +
			"<input class='fileUploadInput' type='file' name='fileUploadInput' size='30' />" +
			"<br />";
		uploadInputList.innerHTML = uploadInputList.innerHTML + addSlotText;
	}
-->
</script> 
<body>
${head}
	<a href="${geotoolsProcessing}">Geotools Processing</a> | 
	<a href="${cdmProcessing}">CDM Processing</a>
	<br />
	<hr />
File Upload Area: <br />
<form method="post" enctype="multipart/form-data" action="${cont}/Router?location=uploadFiles">

	<div id="fileUploads">
		<label for="fileUploadInput">File...</label>
		<input class="fileUploadInput" type="file" name="fileUploadInput" size="30" />
		<br />
	</div>
	
	<input type="button" value="Add More Slots" onclick="addUploadSlot()" />
	<input type="submit" value="Submit Files" title="Submit Files" /><br />
</form>
<br />

Files Uploaded So Far This Session:<br />
<fieldset class="applicationFieldSet">
	<legend style="display: solid !important">
		Uploaded File List
	</legend>
	<c:forEach var="fileName" items="${uploadedFileList}">
		${fileName} <a href="${deleteFile}${fileName}">[- Delete -]</a><br />
		<br />
	</c:forEach>
</fieldset>
	
${foot}
</body>
</html>