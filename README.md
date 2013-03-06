resonate-flixel-workshop
========================

During the workshop each participant will design and program a unique character for a simple 2D-action game using the Flash-based game framework Flixel. In the game two players compete against each other in a virtual arena. At the beginning of a match, each player is randomly assigned one of the characters with a unique set of features and properties, allowing for asymmetric game play.

Participants will learn how to create interesting game interactions within an existing structure, and how to collaborate on a project in a parallel fashion. Each contributed game character will directly affect the game play, evoking discussion about what makes a game balanced, coherent, diverse and enjoyable. The finished game including all contributed characters will be released as open source on GitHub.

# Setup

1. Download the Flex SDK 4.6 http://www.adobe.com/devnet/flex/flex-sdk-download.html
2. Download the Flash Player 11.6 Projector content debugger http://www.adobe.com/support/flashplayer/downloads.html#fp11
3. Download the workshop project https://github.com/pixelate/resonate-flixel-workshop/archive/master.zip
4. Create a new folder for this workshop (e.g. ```asymetric-gamedesign```)
5. Unzip all downloaded files
6. Move the unzipped folders and the Flash Player Debugger into your new folder

# Compile the project

1. Open a command line Terminal
2. Type ```cd asymetric-gamedesign``` to change the current directory to your new folder
3. Compile the workshop project using mxmlc: ```./flex_sdk_4.6/bin/mxmlc ./resonate-flixel-workshop-master/src/Main.as -static-link-runtime-shared-libraries=true -output ./Main.swf```
4. Open the ```Main.swf``` file using the Flash Player Debugger
