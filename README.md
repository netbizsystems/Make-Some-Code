# Make-Some-Code
Writing a simple web-page that shows one single property such as CompanyName requires that you write lots of code. The journey that CompanyName makes from a column on a table all the way down to the web-page is not a trivial one. It requires that you write lots of code that is prone to error and time consuming (and boring to write). Generating all that code saves your time and allows for code that meets your expectations and standards.

![UWP](sampleapp.png)

When I get 5 stars I will upload the code :)

## Overview
All templates reply on metadata that is seeded from the SQL Server INFORMATION_SCHEMA views and then enhanced with additional properties that describe how tables and columns are used in the generated code.

All templates, using the same settings, can be run with one click. Or, you can run a template on its own. Either way, you now have code that you can integrate into your application without all that typing.

![xxx](t4output.png)

## Prerequisites

* Visual Studio 2017
* .NET Core 2.0 (https://www.microsoft.com/net/core)

## Setup Requirements to Run Local

* Open the MakeSomeCode.sln solution in Visual Studio.
* Set code-generation properties in $settings.tt
* Click Transform All T4 Templates on the Build menu
