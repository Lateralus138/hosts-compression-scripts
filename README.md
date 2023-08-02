# Hosts Compression Scripts

![Readme Card](https://github-readme-stats.vercel.app/api/pin/?username=Lateralus138&repo=hosts-compression-scripts)

---

***This project is*** ![Under Construction](https://img.shields.io/static/v1?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAACmElEQVQokUWSa0iTcRTGn//26u4b6ZQ0U8lKMqykwPpgZVBEHyLp8jEoIZJADCQ0iCiStIwuZmHRioIuroQss2VkrkIrdeFckiZqdhctTXPOve8Tr7M6X8/zO+fwPEfIwy7IwQA0GgExGYQwyhCmMLRX1z2hJCJSN+xZgqAZnPgCaAUQ0EHICjSYLlKBCDdNQb7HLmeRoy3zQFnzYk/1WTckGUIXCVD+Kw+BpAxtuBXCpkN7bdXt/JL3W3J3xuHg3iTsL/NkNFWVPoWkQOj/wxooCrRhFgiTjI4n9ZVHHQObjxVEY8UGIi1zEhVFCahwdq5qvn+hHkKC0EcBigxwvAnkW3ge7L6TMi+VztOLOOKOY8ulKL68GM2emnjeLF3AZSlz2FCZ6yaHwLGv6pkv8MyxsUoHLcsLwBuHwE0rtdy2UuLWNTpmpkkszQEfnAPDAd47tbaB7NaJR+eXujfmtGTUXgFWp5uwPd8Oi1GBJEmwWYlP34L4PSFw7chPeD+MYnkWUVmy0CeNfe5N8ANIjNWpNmHzqklYrDIGRwRm2gXsM/xofRMOf1AgcbYOAfgxMvgxCmS9+dbh5A6VarxuIMdBDoJ0g+vSreytNpAEux7qqWrK82I+kC2xYOAzyFbz5QNJPrXhdRo4XK/n3WILkxPsbKqwsr8xBB3PjukhGyJJv+qqB+QvkN0mR2Fim5pU1hobzxTYOPbcyJoTNpoAlu6wdZKvIslR0O9VXe0Clc5p2Ge4WDh36ux3ThM/1RqnNhXvilU32cjvINtAf4cKdkzlSHpBTqgNY11JfLtFA+o14NU8Wx/piggNfg2yGVR8EF9/dP37PyCIoDQLs8z9hmv71nsC4wFz9klX2tD4/AEG+gBoQ7KghD8MZ2xdnt7s7wAAAABJRU5ErkJggg==&label=Under&message=Construction&style=for-the-badge&labelColor=1D1D1D&color=ffff99)

- [Hosts Compression Scripts](#hosts-compression-scripts)
  - [About](#about)
    - [Description](#description)
    - [Motivation](#motivation)
  - [TODO](#todo)
  - [Usage](#usage)
  - [Guides And Examples](#guides-and-examples)
    - [Compressing Windows](#compressing-windows)
      - [PowerShell Compression - Steven Black's](#powershell-compression---steven-blacks)
    - [Replacing Windows Hosts File](#replacing-windows-hosts-file)
  - [Notes](#notes)
    - [Note 1](#note-1)
    - [Note 2](#note-2)
    - [Note 3](#note-3)
  - [Contribute](#contribute)
  - [LICENSE](#license)

---

## About

Scripts to compress the hosts file in various operating systems.

 ***DISCLAIMER*** - For now I've only written the *PowerShell* script because it is a priority as *Windows* is horrible with DNS caching and a large hosts file. *Linux* handles large hosts files just fine.

### Description

 Here you will find *scripts* I've written (eventually programs) to help compress the hosts file found in various operating systems. The very first script provided here is a PowerShell script specifically for the hosts files found at [Steven Black's repository](https://github.com/StevenBlack/hosts), but I will add more gradually.

 The *hosts*<sup>[[1](#note-1)]</sup> file is a text file in all (that I know of) operating systems that maps hostnames[[2](#note-2)]</sup> (google.com for example) to ip addresses[[3](#note-3)]</sup> (0.0.0.0 or 127.0.0.1 for examples) and they can become very large if you use a custom one (especially a consolidated one such as one of [Steven Black's](https://github.com/StevenBlack/hosts)). In *Linux* the file's size is not much of an issue, but in Windows (especially) this can slow down DNS caching and therefore cause internet/application issues such as slowing down the internet/external network or even bringing the internet to a halt. A way to circumvent this issue is to *compress* (or aggregate) multiple host names into single lines (or disable the DNS Client, which I definitely do not recommend for various reasons (and especially if you use WSL)). Windows can handle 9 hostnames per line; for example:

 ```
 0.0.0.0 fakename_1.url fakename_2.url fakename_3.url fakename_4.url fakename_5.url fakename_6.url fakename_7.url fakename_8.url fakename_9.url
 ```

 whereas Linux has no limit (that I know of; I have tested 10000 names on a single line).

 Therefore it's a great idea to compress larges hosts files, especially in Windows and one can do so with scripts found here. My last compression turned 189k+ hostnames into 21k+ lines and went from an hour plus of no internet after boot to instantaneous internet.

### Motivation

A need to use a large hosts file in Windows and actually have access to the internet.

---

## TODO

Please bear with me as this is a lot of work and I am a busy man, but in my opinion the most important script is ready and usable.

  - [ ] Scripts
    - [ ] Windows
      - [x] Create PowerShell script - Steven Black's
      - [ ] Create PowerShell script - Generic
      - [ ] Create CMD script - Steven Black's
      - [ ] Create CMD script - Generic
      - [ ] Create AutoHotkey script/compiled executable for both.
    - [ ] Linux
      - [ ] Create Bash script - Steven Black's
      - [ ] Create Bash script - Generic
      - [ ] Create POSIX shell script - Steven Black's
      - [ ] Create POSIX shell script - Generic
    - [ ] MacOS
      - [ ] Probably not, we'll see
    - [ ] Cross Platform
      - [ ] Create Python script  
- [ ] Programs
  - [ ] Create C++ program
  - [ ] Create (maybe) Rust program 

## Usage

For now these are all command line tools, whether they be a script or binary executable. No immediate plans for GUIs, but that make eventually change.

The main focus for now is Windows and Linux, but as stated in the [Motivation](#motivation) section the whole reasons I started this is for the shipwreck that is the Windows environment. I love Windows and Linux, but to deny there are some issues in Windows (in both really, but most notably Windows) is folly.

## Guides And Examples

Here you will find guides for Windows and Linux as these are my primary environments for which I have the most knowledge. If you care to contribute a MacOS or any other script and/or other guides (or anything else) please feel free to [fork](https://github.com/Lateralus138/hosts-compression-scripts/fork) and make a *pull request*.

These guides are not for use with the PiHole or adblockers, they are specifically for hosts found in the default directories such as:

Windows:

```C:\Windows\System32\drivers\etc\hosts```

and Linux:

```/etc/hosts```

I'll not give specific instructions on editing or installing the hosts file, if you need to compress yours you've probably already passed that point, but, of course, you can look it up yourself and here's a starting point if you like via *DuckDuckGo*:

[How to edit the hosts file @ DDG](https://duckduckgo.com/?q=How+to+edit+the+hosts+file&ia=web)

More will be added as I write more scripts. These guide assume you have already replaced or altered your hosts file. These scripts do not edit the file in place (for now) and only prints the output to the console by default.

### Compressing Windows

The Windows hosts file located at ```C:\Windows\System32\drivers\etc\hosts```

#### PowerShell Compression - Steven Black's

This assumes you have already installed a custom hosts file from Mr. Black's repository and it is located in the appropriate directory as stated above.

1. Download ```compress_steven_black_hosts.ps1``` from the current [Releases Page](https://github.com/Lateralus138/hosts-compression-scripts/releases) or directly from [src\windows\blackhosts\compress_steven_black_hosts.ps1](src\windows\blackhosts\compress_steven_black_hosts.ps1) and place anywhere you like. 
2. Open a PowerShell terminal from the Start Menu, Run (Win+r), or from CMD (powershell or pwsh).
![StartMenuPowerShell](docs/images/pshell_start_menu.png)
![RunPowerShell](docs/images/pshell_run.png)
![CMDPowerShell](docs/images/pshell_cmd.png)

3. Change directory to the location of the PS1 script you downloaded from here; you don't have to, but if you don't you must provide the path to the full script (for example C:\Path\To\ScriptLocation\script.ps1). For example:
```PowerShell
 PS> cd C:\Users\<USERNAME>\Downloads
```
4. It's possible that executing PowerShell scripts is disabled by default on your Windows machine. If so then enable it. You'll need to run this next command as Administrator in an Administrative PowerShell instance:
      - You can either Right Click->Run as administrator from the Start Menu or use the hotkey ```Win+x``` and either press 'a' or click the options from the menu.
    ![WINX](docs/images/winx.png)
      - From the administrative PowerShell instance type `Set-ExecutionPolicy unrestricted` and hit [Enter].
      ```Powershell
       PS> Set-ExecutionPolicy unrestricted
      ```
5. If you only want to see the compressed results from the command line then (from the directory of the script, unless you want to type the full path) type `.\compress_steven_black_hosts.ps1` and it will somewhat verbosely run through the process of compression and output the results to the screen.
```
 PS> .\compress_steven_black_hosts.ps1
```
6. To actually output the compressed results to a file run the same command, but redirect the output to a file: `compress_steven_black_hosts.ps1 > hosts`. You can use `Set-Content`, but that's more than is necessary. I do not recommend overwriting the original file (as this is harder to do and I provide a more reliable method below in [Replacing Windows hosts file](#replacing-windows-hosts-file)).

### Replacing Windows Hosts File



## Notes

### Note 1

[What is the hosts file @ DDG](https://duckduckgo.com/?q=what+is+the+hosts+file&t=h_&ia=web)

### Note 2

What is a hostname

[What is a hostname @ DDG](https://duckduckgo.com/?q=What+is+a+hostname&t=h_&ia=web)

### Note 3

[What is an IP address @ DDG](https://duckduckgo.com/?q=What+is+an+IP+address&t=h_&ia=web)

## Contribute

Please feel free to contribute by `forking and making a *pull request*.

[![FORKTHIS](docs/images/fork_this_button_small.png)](https://github.com/Lateralus138/hosts-compression-scripts/fork)

## [LICENSE](./LICENSE)

![License Info](https://img.shields.io/github/license/Lateralus138/cppproject_linux?style=for-the-badge&labelColor=1D1D1D&color=ffff99)

<details>
  <summary>&#x4C;&#x69;&#x63;&#x65;&#x6E;&#x73;&#x65;&#x20;&#x45;&#x78;&#x63;&#x65;&#x72;&#x70;&#x74;</summary>
  <br>
  <blockquote>
  &#x20;&#x54;&#x68;&#x69;&#x73;&#x20;&#x70;&#x72;&#x6F;&#x67;&#x72;&#x61;&#x6D;&#x20;&#x69;&#x73;&#x20;&#x66;&#x72;&#x65;&#x65;&#x20;&#x73;&#x6F;&#x66;&#x74;&#x77;&#x61;&#x72;&#x65;&colon;&#x20;&#x79;&#x6F;&#x75;&#x20;&#x63;&#x61;&#x6E;&#x20;&#x72;&#x65;&#x64;&#x69;&#x73;&#x74;&#x72;&#x69;&#x62;&#x75;&#x74;&#x65;&#x20;&#x69;&#x74;&#x20;&#x61;&#x6E;&#x64;&sol;&#x6F;&#x72;&#x20;&#x6D;&#x6F;&#x64;&#x69;&#x66;&#x79;&#x20;&#x69;&#x74;&#x20;&#x75;&#x6E;&#x64;&#x65;&#x72;&#x20;&#x74;&#x68;&#x65;&#x20;&#x74;&#x65;&#x72;&#x6D;&#x73;&#x20;&#x6F;&#x66;&#x20;&#x74;&#x68;&#x65;&#x20;&#x47;&#x4E;&#x55;&#x20;&#x47;&#x65;&#x6E;&#x65;&#x72;&#x61;&#x6C;&#x20;&#x50;&#x75;&#x62;&#x6C;&#x69;&#x63;&#x20;&#x4C;&#x69;&#x63;&#x65;&#x6E;&#x73;&#x65;&#x20;&#x61;&#x73;&#x20;&#x70;&#x75;&#x62;&#x6C;&#x69;&#x73;&#x68;&#x65;&#x64;&#x20;&#x62;&#x79;&#x20;&#x74;&#x68;&#x65;&#x20;&#x46;&#x72;&#x65;&#x65;&#x20;&#x53;&#x6F;&#x66;&#x74;&#x77;&#x61;&#x72;&#x65;&#x20;&#x46;&#x6F;&#x75;&#x6E;&#x64;&#x61;&#x74;&#x69;&#x6F;&#x6E;&comma;&#x20;&#x65;&#x69;&#x74;&#x68;&#x65;&#x72;&#x20;&#x76;&#x65;&#x72;&#x73;&#x69;&#x6F;&#x6E;&#x20;&#x33;&#x20;&#x6F;&#x66;&#x20;&#x74;&#x68;&#x65;&#x20;&#x4C;&#x69;&#x63;&#x65;&#x6E;&#x73;&#x65;&comma;&#x20;&#x6F;&#x72;&#x20;&lpar;&#x61;&#x74;&#x20;&#x79;&#x6F;&#x75;&#x72;&#x20;&#x6F;&#x70;&#x74;&#x69;&#x6F;&#x6E;&rpar;&#x20;&#x61;&#x6E;&#x79;&#x20;&#x6C;&#x61;&#x74;&#x65;&#x72;&#x20;&#x76;&#x65;&#x72;&#x73;&#x69;&#x6F;&#x6E;&period;
  </blockquote>
  <br>
  <blockquote>
  &#x54;&#x68;&#x69;&#x73;&#x20;&#x70;&#x72;&#x6F;&#x67;&#x72;&#x61;&#x6D;&#x20;&#x69;&#x73;&#x20;&#x64;&#x69;&#x73;&#x74;&#x72;&#x69;&#x62;&#x75;&#x74;&#x65;&#x64;&#x20;&#x69;&#x6E;&#x20;&#x74;&#x68;&#x65;&#x20;&#x68;&#x6F;&#x70;&#x65;&#x20;&#x74;&#x68;&#x61;&#x74;&#x20;&#x69;&#x74;&#x20;&#x77;&#x69;&#x6C;&#x6C;&#x20;&#x62;&#x65;&#x20;&#x75;&#x73;&#x65;&#x66;&#x75;&#x6C;&comma;&#x20;&#x62;&#x75;&#x74;&#x20;&#x57;&#x49;&#x54;&#x48;&#x4F;&#x55;&#x54;&#x20;&#x41;&#x4E;&#x59;&#x20;&#x57;&#x41;&#x52;&#x52;&#x41;&#x4E;&#x54;&#x59;&semi;&#x20;&#x77;&#x69;&#x74;&#x68;&#x6F;&#x75;&#x74;&#x20;&#x65;&#x76;&#x65;&#x6E;&#x20;&#x74;&#x68;&#x65;&#x20;&#x69;&#x6D;&#x70;&#x6C;&#x69;&#x65;&#x64;&#x20;&#x77;&#x61;&#x72;&#x72;&#x61;&#x6E;&#x74;&#x79;&#x20;&#x6F;&#x66;&#x20;&#x4D;&#x45;&#x52;&#x43;&#x48;&#x41;&#x4E;&#x54;&#x41;&#x42;&#x49;&#x4C;&#x49;&#x54;&#x59;&#x20;&#x6F;&#x72;&#x20;&#x46;&#x49;&#x54;&#x4E;&#x45;&#x53;&#x53;&#x20;&#x46;&#x4F;&#x52;&#x20;&#x41;&#x20;&#x50;&#x41;&#x52;&#x54;&#x49;&#x43;&#x55;&#x4C;&#x41;&#x52;&#x20;&#x50;&#x55;&#x52;&#x50;&#x4F;&#x53;&#x45;&period;&#x20;&#x20;&#x53;&#x65;&#x65;&#x20;&#x74;&#x68;&#x65;&#x20;&#x47;&#x4E;&#x55;&#x20;&#x47;&#x65;&#x6E;&#x65;&#x72;&#x61;&#x6C;&#x20;&#x50;&#x75;&#x62;&#x6C;&#x69;&#x63;&#x20;&#x4C;&#x69;&#x63;&#x65;&#x6E;&#x73;&#x65;&#x20;&#x66;&#x6F;&#x72;&#x20;&#x6D;&#x6F;&#x72;&#x65;&#x20;&#x64;&#x65;&#x74;&#x61;&#x69;&#x6C;&#x73;&period;
  </blockquote>
</details>
