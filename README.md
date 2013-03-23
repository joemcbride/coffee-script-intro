Introduction to CoffeeScript
===================

See [http://coffeescript.org/](http://coffeescript.org/) for full documentation.

**Installation**

	npm install -g coffee-script

**Compile Examples:**

Compile a directory tree of .coffee files in src into a parallel tree of .js files in lib:

	coffee --compile --output lib/ src/
		
Watch a file for changes, and recompile it every time the file is saved:

	coffee --watch --compile experimental.coffee

Concatenate a list of files into a single script:

	coffee --join project.js --compile src/*.coffee
	
Print out the compiled JS from a one-liner:

	coffee -bpe "alert i for i in [0..10]"
	
All together now, watch and recompile an entire project as you work on it:

	coffee -o lib/ -cw src/

Start the CoffeeScript REPL (Ctrl-D to exit, Ctrl-Vfor multi-line):

	coffee