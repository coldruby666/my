<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--http://java.sun.com/jstl/core 톰켓 5이하-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	.box__dragndrop,
	.box__uploading,
	.box__success,
	.box__error {
	  display: none;
	}
</style>

<script>
    var totalFileLength, totalUploaded, fileCount, filesUploaded;
 
    //To log everything on console
    function debug(s) {
        var debug = document.getElementById('debug');
        if (debug) {
            debug.innerHTML = debug.innerHTML + '<br/>' + s;
        }
    }
 
    //Will be called when upload is completed
    function onUploadComplete(e) {
        totalUploaded += document.getElementById('files').files[filesUploaded].size;
        filesUploaded++;
        debug('complete ' + filesUploaded + " of " + fileCount);
        debug('totalUploaded: ' + totalUploaded);
        if (filesUploaded < fileCount) {
            //uploadNext();
        } else {
            var bar = document.getElementById('bar');
            bar.style.width = '100%';
            bar.innerHTML = '100% complete';
            alert('Finished uploading file(s)');
        }
    }
 
    //Will be called when user select the files in file control
    function onFileSelect(e) {
        var files = e.target.files; // FileList object
        var output = [];
        fileCount = files.length;
        totalFileLength = 0;
        for (var i = 0; i < fileCount; i++) {
            var file = files[i];
            output.push(file.name, ' (', file.size, ' bytes, ', file.lastModifiedDate.toLocaleDateString(), ')');
            output.push('<br/>');
            debug('add ' + file.size);
            totalFileLength += file.size;
        }
        document.getElementById('selectedFiles').innerHTML = output.join('');
        debug('totalFileLength:' + totalFileLength);
    }
 
    //This will continueously update the progress bar
    function onUploadProgress(e) {
        if (e.lengthComputable) {
            var percentComplete = parseInt((e.loaded + totalUploaded) * 100 / totalFileLength);
            var bar = document.getElementById('bar');
            bar.style.width = percentComplete + '%';
            bar.innerHTML = percentComplete + ' % complete';
        } else {
            debug('unable to compute');
        }
    }
 
    //the Ouchhh !! moments will be captured here
    function onUploadFailed(e) {
        alert("Error uploading file");
    }
 
    //Pick the next file in queue and upload it to remote server
    function uploadNext() {
    	var files = document.getElementById('files').files;
        var xhr = new XMLHttpRequest();
        var fd = new FormData();
        console.log("files.length = >>>" + files.length);
        
        files.append
        
        for (var i = 0; i < files.length; i++) {
        	console.log("-------------------------" + i);
        	console.log(files[i]);
            fd.append("multipartFile", files[i]);
        }
        
        xhr.upload.addEventListener("progress", onUploadProgress, false);
        xhr.addEventListener("load", onUploadComplete, false);
        xhr.addEventListener("error", onUploadFailed, false);
        xhr.open("POST", "xls_import.do");
        
        xhr.send(fd);
    }
 
    //Let's begin the upload process
    function startUpload() {
        totalUploaded = filesUploaded = 0;
        uploadNext();
    }
 
    //Event listeners for button clicks
    window.onload = function() {
        document.getElementById('files').addEventListener('change', onFileSelect, false);
        document.getElementById('uploadButton').addEventListener('click', startUpload, false);
    }
    
    function testUpload() {

    	var ajaxData = new FormData($form.get(0));

		if (droppedFiles) {
			$.each(droppedFiles, function(i, file) {
				ajaxData.append($input.attr('name'), file);
			});
		}

		$.ajax({
			url : $form.attr('action'),
			type : $form.attr('method'),
			data : ajaxData,
			dataType : 'json',
			cache : false,
			contentType : false,
			processData : false,
			complete : function() {
				$form.removeClass('is-uploading');
			},
			success : function(data) {
				$form.addClass(data.success == true ? 'is-success'
								: 'is-error');
				if (!data.success)
					$errorMsg.text(data.error);
			},
			error : function() {
				// Log the error, show an alert, whatever works for you
			}
		});
	}
</script>
</head>
<body>
    <div style="width:55%">  
        <h1>HTML5 Ajax Multi-file Upload With Progress Bar</h1>
        <div id='progressBar' style='height: 20px; border: 2px solid green; margin-bottom: 20px'>
            <div id='bar' style='height: 100%; background: #33dd33; width: 0%'>
            </div>
        </div>
        <form style="margin-bottom: 20px">
            <input type="file" id="files" name="file[]" multiple style="margin-bottom: 20px"/><br/>
            <output id="selectedFiles"></output>
            <input id="uploadButton" type="button" value="Upload" style="margin-top: 20px"/>
        </form>
        <div id='debug' style='height: 100px; border: 2px solid #ccc; overflow: auto'></div>
    </div>

<!-- 	<form class="box" method="post" action="" enctype="multipart/form-data">
		<div class="box__input">
			<input class="box__file" type="file" name="files[]" id="file"
				data-multiple-caption="{count} files selected" multiple /> <label
				for="file"><strong>Choose a file</strong><span
				class="box__dragndrop"> or drag it here</span>.</label>
			<button class="box__button" type="submit">Upload</button>
		</div>
		<div class="box__uploading">Uploading&hellip;</div>
		<div class="box__success">Done!</div>
		<div class="box__error">
			Error! <span></span>.
		</div>
	</form> -->
</body>
</html>