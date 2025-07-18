@echo off
echo ===================================================
echo 3Shape SQL Inactive User Cleanup
echo ===================================================
echo This will delete all inactive users in the database
echo Please makes sure the user you want to remove is
echo deactivated in 3Shape Control Panel before running
echo ===================================================
pause

sqlcmd -S .\THREESHAPEDENTAL -d DentalManager -E -Q "DELETE FROM dbo.IdentityProfiles WHERE IsActive='0';"

echo ---------------------------------------------------
echo Cleanup complete.
echo ---------------------------------------------------
pause