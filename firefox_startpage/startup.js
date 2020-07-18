/*
 * startup.js
 * Copyright (C) 2020 sandvich <sandvich@sandvich-pc>
 *
 * Distributed under terms of the MIT license.
 */

function addBookmark(label, url, list) {
	var div = document.createElement('div'); 
	var content = document.createTextNode(label); 

	div.appendChild(content); 
	div.className = 'list-item';

	div.onclick = function() {
		top.location.href = url;
	}

	var listElement = document.getElementById('list' + list); 
	listElement .appendChild(div);
}

function readTextFile(file) 
{ 
    var rawFile = new XMLHttpRequest(); 
    rawFile.open("GET", file, false); 
    rawFile.onreadystatechange = function () 
    { 
        if(rawFile.readyState === 4) 
        { 
            if(rawFile.status === 200 || rawFile.status == 0) 
            { 
                var allText = rawFile.responseText; 
                alert(allText); 
            } 
        } 
    } 
    rawFile.send(null); 
}

function loadBookmarks() {
	console.log("hello world");
	fetch('./bookmarks.json')
		.then(response => response.json())
		.then(jsonResponse => jsonResponse.bookmarks.forEach(function(list, i) {
			for (const item in list) {
				addBookmark(item, list[item], i + 1);
			}
		}));
	
	//bookmarks.forEach(element => console.log(element));
}

function saveBookmarks() {

}

loadBookmarks();
