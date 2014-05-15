*******************************************************************
	This is the sample application project
	"Flashies"
	v1.0
	
	dev by The Bandits
	Jarrod Dickinson, Patrick Snelgar, Tori Lane
*******************************************************************


****************************************************************
		HOW TO ACCESS 'FLASHIES' ON A STANDALONE MACHINE
****************************************************************
----------------------------
	Prerequisites:
----------------------------
Your machine must have the following installed to be able to run Flashies

	* Ruby and Rails
		Rails 3.2 or above installed

	* Image Processor
		ImageMagick must be installed and Flashies must have access to it. Download ImageMagick from http://www.imagemagick.org/ 
		To ensure that it does, on your command line, run: 
			'which convert' 
		which is one of the ImageMagick utilities. This will give you the path where that utility is installed. For example, it might return /usr/local/bin/convert.
		The Flashies configuration file may need to be ajdusted to tell Flashies where to access ImageMagick. 
		In the file'config/environments/development.rb', find the section of code:

			#allow access to ImageMagick
  			Paperclip.options[:command_path] = "/c/windows/system32/"

		And change the file path from "/c/windows/system32/" to whatever 'which convert' returned.
		
		If you're on Mac OS X, you'll want to run the following with Homebrew:
			brew install imagemagick
		If you are dealing with pdf uploads or running the test suite, you'll also need GhostScript to be installed. On Mac OS X, you can also install that using Homebrew:
			brew install gs
	* File command
		The Unix file command is required for content type checking.

----------------------------
	Installing:
----------------------------

	1. 	Extract the Flashies app file
			on windows, this is right click extract, on linux, unzip

	2. 	Move this unzipped file to your the place you want to store the app, ie ../Rails/Flashies

	3. 	In a rails terminal, navigate to the Flashies app folder
	   	The following commands can be used to help navigation:
			dir 			list the files in the current directory
			cd ..			change directory to the parent directory
			cd <directory name>	change directory to the given directory

	4. 	Run the command:
			bundle install
	   	which will install the gems included in the Flashies app

	5. 	Run the command 
			rake db:migrate
	   	which will create the database for the app
	
	6. 	Start the rails server. Run the command
			rails server
		- or -
			rails s

	7. 	When the terminal that has run the server command returns with the line 'Ctrl-C to shutdown server' (this may take a few seconds)
			=> Booting WEBrick
			=> ....more ...
			=> Ctrl-C to shutdown server

	   	Open a browser window (ie, Chrome or Firefox), and type 'http://localhost:3000' into the url

	8. 	You are now running the Flashies app!
 
	9. 	Sign up to access Flashies in force


****************************************************************
		HOW TO ACCESS 'FLASHIES' ON A HEROKU
****************************************************************
2. access your code already deployed on Heroku or other cloud environments



****************************************************************
		HOW TO ACCESS 'FLASHIES' API DOCUMENTATION
****************************************************************
3. access your api documentation


****************************************************************
		FEATURES INCLUDED IN 'FLASHIES'
****************************************************************
The following are features implemented as optional extras

	1.
	2.
	3.