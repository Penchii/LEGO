# LEGO
TNM097 Project LEGO

1. Install git bash
2. generate keys
go to C:\users\username\.ssh
create folder .ssh if it does not exist
in this folder, start git bash
type: ssh-keygen.exe
press enter multiple times when it asks things. 

3. Add public key to github
 
Go to the .ssh folder on ur computer, open the id_rsa.pub file in a text editor
copy all the text

go to github. Settings. SSH and GPU keys. Add new SSH key. Paste.

4. clone the project
Go to werever u want the project on ur computer
open Git bash in that location. 
type :
git clone git@github.com:Penchii/LEGO.git

then, to enter the folder, type:
cd LEGO


now can use all the git commands