#!/bin/bash

# Grab who the logged in user is, which is needed to apply the script to the account
USER="$(stat -f %Su "/dev/console")"

echo "Logged in as $USER."

### function for when user selects to make account hidden ###
fMakeAccountHidden()	{

	sudo dscl . create /Users/"$USER" IsHidden 1 	# hides the account account in users and groups.
	sudo dscl . create /Users/"$USER" NFSHomeDirectory /var/"$USER" # sets the NFSHomeDirectory to /var/
	sudo mv /Users/"$USER" /var/"$USER" # moves the account from /Users/ to /var/

	echo "The account for $USER is now hidden, and it's home directory is moved to /var/$USER"

	echo "You must log out for changes to take effect..."

	osascript -e 'tell app "System Events" to log out'

	fMainMenu

}

### function for when user selects to make account visible ###
fMakeAccountVisible()	{

	sudo dscl . create /Users/"$USER" IsHidden 0 # unhides the account account in users and groups.
	sudo dscl . -change /Users/"$USER" NFSHomeDirectory /var/"$USER" /Users/"$USER"
	sudo mv /var/"$USER" /Users/"$USER" # moves the account from /var/ back to /Users/

	echo "The account for $USER is now visible, and it's home directory is moved to /Users/$USER"

	echo "You must log out for changes to take effect..."

	osascript -e 'tell app "System Events" to log out'

	fMainMenu

}

### function to exit script and kill terminal ###
fExit() {

  echo "Exiting Terminal..."
  killall Terminal

}

fMainMenu()	{

	# Presents the user with the option of selecting whether to make the logged in users hiddne or visible
	echo
	echo " ########################################################################################### "
	echo " ############################### SET VISBILITY OF ACCOUNT ################################## "
	echo " ################# By: John Hawkins | Contact: johnhawkins3d@gmail.com ##################### "
	echo " ################### SOURCE: https://support.apple.com/en-us/HT203998 ###################### "
	echo " ########################################################################################### "
	echo
	echo " Please make a selection below:"
	echo "    1  Make the account for $USER ****HIDDEN**** "
	echo "    2  Make the account for $USER ****VISIBLE*** "
	echo "    3  Exit script and close Terminal              "
	echo
	read -r -p "Pick an action # (1-3): " MAKESELECTION

	# actions to be taken by the text only options above
	case $MAKESELECTION in
	    1 ) fMakeAccountHidden ;;
	    2 ) fMakeAccountVisible ;;
	    4 ) fExit ;;
	esac

}

fMainMenu
