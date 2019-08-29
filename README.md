# Documentation and Tools for Accessing Compute Canada

(Note for Windows) if you are on Windows you need to get a ssh terminal. 
- See [WSL](WSL.md) for Windows installation instructions to get Ubuntu terminals
- Note:  While there are alternatives, (e.g. Putty and  MobaXTerm) the benefit of using Ubuntu on Windows is that you can then follow normal linux setup instructions, can use standard tools/scripts, etc.

## Getting started

Given a linux (on Windows or otherwise) supporting ssh, follow:
1. [Apply for a Compute Canada Account](https://www.computecanada.ca/research-portal/account-management/apply-for-an-account/)
   - If you are a grad student, RA, etc. you will need a faculty sponsor, who will need a compute canada account themselves
   - You will need them to provide you their compute canada **CCRI** which is a form like `abc-123-01`
2. (Windows Specific) You need an ssh terminal.  Follow [WSL](WSL.md) to get Ubuntu running on Windows
   -  While there are alternatives, (e.g. [MobaXTerm](https://docs.computecanada.ca/wiki/Connecting_with_MobaXTer) ) the benefit of WSL is you then have a full linux setup
3. Follow [Setup instructions](setup.md)

After you have done the initial setup you can run code several ways:
- Run `julia` within a login node (for small tests, etc.).  Do not ask for lots of resources this way!  It isn't how clusters work
- Non-interactive [Jupyter](jupyter_login_node.md) accessed from your local machine
- Run an interactive [Interactive Jupyter Job](jupyter_jobs.md) accessed from your local machine
- Submit [Non-Interactive Julia Jobs](julia_jobs.md)



## More on Compute Canada
- List of [Available Software](https://docs.computecanada.ca/wiki/Available_software)
- For more on our [Interactive Jupyter Job](jupyter_job.md) see  may be easier
    - [Jupyter](https://docs.computecanada.ca/wiki/Jupyter) and more on [SSH Tunnelling](https://docs.computecanada.ca/wiki/SSH_tunnelling). 
