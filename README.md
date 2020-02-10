# SetUserAccountVisibility-
This script allows allows the user to make the logged in account hidden or visible in Users and Groups.  In addition, the home folder for the account is moved moved to /var/ *.

### SETTING UP SCRIPT ####

1.) Create a text file, save copy the contents from the script to it, then save the text file as a .command file. 
2.) Apply the appropriate permissions to the file if necessary (i.e. chmod 777 /path/to/*.command)

### INSTRUCTIONS ####

1.) Log in as the account that you want to edit the visibility and home folder location.
- If logged in as any other user, please LOG THEM OUT.  

2.) Open SetAccountVisibility.command, then select from either the two options below:
- Make the account hidden, and relocate home folder to var/*
- Make the acccount visible, and move the home folder back to /Users/*

3.) Once you've completed your decision, you will be prompted to Log Out in order for changes to take effect.
