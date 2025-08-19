# General Information
- Name: sudo0x18's Level1
- Difficulty: 1.1
- Quality: 4.1
- Language: C/C++
- Platform: Unix/Linux etc.
- Arch: x86-64
- Source: https://crackmes.one/crackme/646627a933c5d439389131d9
# Solve
- Opening the file using IDA Pro and checking the main function, we see that the program asks for a password, which is then checked through the checkPass function.

<div style="margin: auto; display: flex; justify-content: center; align-items: center">
    <img 
        style="text-align: center; display: block; margin-left: auto; margin-right: auto"
        src="./Pictures/main.png"
        alt="main function">
    </img>
</div>

- Looking at the checkPass function, the function simply checks for each character of our input to see if it matches its hardcoded password.
- The next step is clear, we look up our ASCII table and find that the password is sudo0x18

<div style="margin: auto; display: flex; justify-content: center; align-items: center">
    <img 
        style="text-align: center; display: block; margin-left: auto; margin-right: auto"
        src="./Pictures/checkPass.png"
        alt="checkPass function">
    </img>
</div>

- Confirm the password by running the executable (in my case, I ran the file through WSL)

<div style="margin: auto; display: flex; justify-content: center; align-items: center">
    <img 
        style="text-align: center; display: block; margin-left: auto; margin-right: auto"
        src="./Pictures/confirm.png"
        alt="Confirm answer">
    </img>
</div>