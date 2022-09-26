# AzerothWarsLR
Azeroth Wars: Legacy Reborn is a Warcraft 3 macro-strategy map representing the events of the Warcraft story from Reign of Chaos through to World of Warcraft: Cataclysm.

It is written entirely in vJASS. A work-in-progress C# version can be found at https://github.com/AzerothWarsLR/AzerothWarsCSharp.

# Running the project
1. Clone the project to a local folder
2. Run the project once by executing buildTools/AzerothWarsMapCompiler.exe
3. The above will probably fail, but you will now have a file called appsettings.{YOURUSERNAME}.json. Modify this file so that it has the correct path to your Warcraft 3 directory
4. Run AzerothWarsMapCompiler.exe again. This time, it should compile the map and launch it in Warcraft 3
5. Observe that it has also created a published .w3x file in the compiledMaps

Once everything is working, you can also compile and test the map by pressing CTRL+Shift+B from within Visual Studio Code.
