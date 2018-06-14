#Sparta UI testing

To use clone or download the repo to your computer. As well as the browser Chrome this project requires the gem "selenium-webdriver". To install it run

```
gem install selenium-webdriver
```

The test specs will require "rspec", run

```
rspec install
```
to install it.

cd to the project folder of your choice then run

```
rspec
```
to see the tests in action

This project uses the selenium webdriver to test a [website](http://demoqa.com/registration/) form. It currently only tests on the browser Chrome. The tests check that each part of the registration form can be filled out along with additional methods to check whether the form inputs contain a value.
