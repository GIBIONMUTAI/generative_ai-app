# generative_ai-app
### Project Setup and Execution Steps

## cd generative_ai-app

Change Directory: Navigates into the main project folder.

## python -m pip --version

Verify Pip: Checks that the Python package installer is available.

## python -m venv .venv

Create Virtual Environment: Sets up a dedicated, isolated environment named .venv for the project.

## pip install requests

Install Package: Installs the standard Python library for making HTTP requests.

## source .venv/Scripts/activate

Activate Environment: Activates the isolated environment on Windows.

### touch user.jac

Create File: Creates an empty file named user.jac where the application code will reside.

## code user.jac

Opens the newly created user.jac file in VS Code for editing.

## pip install jaclang

Install Jac Interpreter: Installs the necessary compiler and tools to execute Jac code.

## pip install --upgrade pip setuptools wheel

Upgrade Tools: Updates core Python packaging tools to ensure compatibility and efficiency.

### pip install jac byllm

Install Jac Libraries: Installs the main Jac language tool (jac) and the Large Language Model library (byllm).

## API KEY:"Google AI"

Set API Key: Instructs the application to use the configured API key for Google's Generative AI services.

### jac run user.jac

Run Application: Executes the main Jac application script, user.jac, within the configured environment.