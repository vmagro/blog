---
layout: post
title: How I reduced the cache loading time of PhotoRun by 250x
---
I noticed that it was taking a ridiculously long time to load data from the cache in recent builds of [PhotoRun](/blog/2014/01/16/sc-photorun).
I put a lot of timing debug statements in the code to figure out what was taking so long, and I was surprised to see that it was taking 8-9ms to read each line from the cache file
(it's just a text file filled with JSON in the application's data directory). Turns out that just by minifying the JSON response from our API,
that time could be reduced to just around 13ms for the _entire_ file (it was only one line after being minified).
I was happy to note that the cache loading times were reduced from 4.5s to around 180ms.

For future reference, I was using a String to store the contents of the file, causing a large amount of copying in order to append the next line into the string.
This could be fixed using something like a StringBuffer. The issue wasn't apparent until the file reached a few hundred lines, it was not a problem when there were only around 10.