I built a commercial cellphone charging station with a team of some friends. The charging station has 8 cells that are actuated with solenoid locks. [You can find out more about the project here.](https://tytodd.wixsite.com/tyrin-ian-todd/charging-station-project)

There are 6 pages on this GUI each represented by a .pde file. 
![Slideshow Page](./src/Slideshow.pde)
The slide show page renders images off of a USB hard drive plugged into the charging station and shuffles through them while the charging station is idle. This allows administrators to advertise for clubs and events on the charging station. 

![Start Page](./src/StartPage.pde)
The start page is the first thing a user sees when they tap the slide show. It prompts them to select if they are here to pickup a phone or drop one off. On the start page there is also a button that links to the admin page. If no action is detected on the StartPage for a proloned period of time the charging station will go idle and start playing the slideshow.

![Admin Page](./src/Admin.pde)
The Admin Page alows administrators to unlock any ports on the charging station in case a user forgets their pin number. It is acessed through pushing a button on the start page and enterting a pin number. 

![Port Page](./src/PortPage.pde)
When a user selects either pickup or dropoff on the StartPage they will be broughht to the port page where they are prompted to select a port.

![Pin Page](./src/PinPage.pde)
When a user selects a port from page they are either prompted to enter in a custom pin (if they are dropping off) or the pin they entered prior (if they are dropping off)

![Confimation Page](./src/ConfirmationPage.pde)
After entering a pin the user is brough to the confirmation page which will tell them that either their pin is wrong, that the door has been unlocked, or that the door is ready for them to place their phone inside.

![pins file](./src/pins.txt)
This file stores the pins entered so that the charging station can remember the pins even if there were a power outage.

I also have some custom objects that I made to act as various components I use througout the program.

![Button](./src/Button.pde)
A standard button that follows the theme.

![Entry](./src/Entry.pde)
Allows text from user to be entered. Follows the marroon and grey theme.

![NumButton](./src/NumButton.pde) and ![NumPad](./src/NumPad.pde)
NumButton extends Button and numpad is a group of NumButtons. These together allow users to enter a pin into the text entry.

![Port](./src/Port.pde)
An object that extends Button and represents one of the 8 ports on the charging station. These show up on PortPage when the user selects that port they are going to use.





