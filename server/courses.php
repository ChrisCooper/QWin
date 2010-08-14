<?php
    echo "You are on Chris' test server.<br><br>";
    if(@$_GET['option']) {
        echo "Your test option was \"{$_GET['option']}\"";
    }
    exec("python CourseScraper.py")
	//course_entries.data
	
?>