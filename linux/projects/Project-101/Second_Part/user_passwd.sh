#!/bin/bash
#
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.


# Get the username (login).


# Get the real name (contents for the description field).


# Get the password.


# Create the account.


# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.


# Set the password.


# Check to see if the passwd command succeeded.


# Force password change on first login.


# Display the username, password, and the host where the user was created.

#!/bin/bash
#
# This script creates a new user on the local system.
# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [[ "$?" -ne 0 ]]
then
        echo "Error creating user"
        exit 2
fi
# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
# Check to see if the passwd command succeeded.
if [[ "$?" -ne 0 ]]
then
        echo "Error creating password"
        exit 3
fi
# Force password change on first login.
passwd -e ${USER_NAME}
# Display the username and password where the user was created.
echo
echo 'new username: ' ${USER_NAME}
echo 'password:     ' ${PASSWORD}
echo 'Please note user will be required to change password at login'
echo
echo 'Done.'