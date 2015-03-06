Blackberry Jam
==============

Blackberry Jam is the follow up to <a href="https://github.com/justaskmedia/raspberry-jam">Raspberry Jam</a>. I have removed Browserify and Flatten replacing them with Bower.

<h2>Getting Started</h2>

If you haven't already, install Gulp. You need to do it globally. Open up terminal and run the following code.

<pre>npm install -g gulp</pre>

Once that has finished installing, you need to install the packages included in this framework. To do this run:

<pre>npm install</pre>

Run the command <pre>gulp</pre> and you're good to go.

<h2>Sass</h2>

The Sass stucture is the same as before. All of the development files exist under assets/sass. With Gulp watching the directory, every time you make a change it will compile the CSS.

There are two mixins included. The first Mixin generates a Media Query. Just include the width that you wish the media query to trigger at and youre good to go.

<pre>
	body {
		background:#00f;

		@include media(960) {
			background-color:#f00;
		}
	}

	//Creates:
  	@media only screen and (min-width: 960px) { 
  		body {
  			background-color:#f00;
  		}
  	}
</pre>

The other mixin is for the font size. It uses rem font sizes rather then em's or pixels. If the browser doesn't support rem sizes, the mixin also creates a pixel based font size. The base font size has been designed to allow for pixel-based sizes. To use it, just include the following code.

<pre>
	@include font-size(1.2);
	// Creates:
	// font-size: 12px;
	// font-size: 1.2rem;
</pre>

When the compiler runs, an Autoprefixer will also run. This means you don't need to include any vendor prefixes when you write your code. It'll be done automatically when you save.

The generated code will be minified and a source map created. The source map allow for easier debugging.

<h2>Javascript</h2>

The Javascript strucutre is also the same as before and can be found under assets/js. With Gulp watching the directory, every time you make a change it will compile the Javascript.

The main.js file includes code to prevent console.log errors from occuring. Inside the libs folder are the following files:
	<ul>
		<li>jQuery 2.1.3 Minified</li>
	</ul>

As files are added through bower main.js will automatically be updated to reflect these changes.

<h2>BrowserSync</h2>

This is a great tool for seeing the changes update as soon as they happen. Fore more information see the <a href="https://www.npmjs.org/package/browser-sync" target="_blank">BrowserSync page</a>.