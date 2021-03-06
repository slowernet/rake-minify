Feature: Minify Javascripts 
  In order to build awesome javascript applications
  A ruby programmer
  Wants to minify its javascripts using rake

  Scenario: Minify single javascript
    Given we want to add the file "a.js" into "a.min.js" with options:
      | minify | true  |
    When I run rake minify
    Then "a.min.js" should be minified

  Scenario: Combine multiple javascripts into a single file
    Given we want to add the file "a.js" into "app.js" with options:
      | minify | false |
    And we want to add the file "b.js" into "app.js" with options:
      | minify | false |
    When I run rake minify
    Then "app.js" should include "a.js" and "b.js"

  Scenario: Minify multiple javascripts into a single file
    Given we want to add the file "a.js" into "app.min.js" with options:
      | minify | true |
    And we want to add the file "b.js" into "app.min.js"
    When I run rake minify
    Then "app.min.js" should include "a.min.js" and "b.min.js"

  Scenario: Minify multiple javascripts into multiple files
    Given we want to add the file "a.js" into "app.min.js"
    And we want to add the file "b.js" into "app.min.js"
    And we want to add the file "a.js" into "a.min.js"
    When I run rake minify
    Then "app.min.js" should include "a.min.js" and "b.min.js"
    And "a.min.js" should be minified

  Scenario: Combine and minify only one file
    Given we want to add the file "a.js" into "app.js" with options:
      | minify | false |
    And we want to add the file "b.js" into "app.js"
    When I run rake minify
    Then "app.js" should include "a.js" and "b.min.js"

  Scenario: Minify single javascript with basedir
    Given the basedir "public"
    And we want to add the file "a.js" into "a.min.js"
    When I run rake minify
    Then "a.min.js" should be minified

  Scenario: Minify multiple javascripts with basedir
    Given the basedir "public"
    And we want to add the file "a.js" into "app.min.js"
    And we want to add the file "b.js" into "app.min.js"
    When I run rake minify
    Then "app.min.js" should include "a.min.js" and "b.min.js"

  Scenario: Minify multiple javascripts with an inner directory
    Given the inner directory "public"
    And we want to add the file "a.js" into "app.min.js"
    And we want to add the file "b.js" into "app.min.js"
    When I run rake minify
    Then "app.min.js" should include "a.min.js" and "b.min.js"

  Scenario: Minify multiple javascripts with a basedir and an inner directory
    Given the basedir "base"
    And the inner directory "in"
    And we want to add the file "a.js" into "app.min.js"
    And we want to add the file "b.js" into "app.min.js"
    When I run rake minify
    Then "app.min.js" should include "a.min.js" and "b.min.js"

  Scenario: Minify single javascript with a destination directory
    Given we want to add the file "a.js" into "build/a.min.js"
    When I run rake minify
    Then "build/a.min.js" should include "a.min.js"

  Scenario: Minify single javascript with a deep destination directory
    Given we want to add the file "a.js" into "a/dir/a.min.js"
    When I run rake minify
    Then "a/dir/a.min.js" should include "a.min.js"

  Scenario: Minify single javascript built by ruby
    Given we want to add the following javascript into "a.min.js":
      """
        a = "a"
        "var a =  \"hello #{a}\" ;"




      """
    When I run rake minify
    Then "a.min.js" should be minified


  Scenario: Minify single coffeescript built by ruby
    Given we want to add the following coffeescript into "c-a-wrapped.min.js":
      """
        a = "a"
        "a =  \"hello #{a}\""




      """
    When I run rake minify
    Then "c-a-wrapped.min.js" should be minified

  Scenario: Minify multiple javascripts built by ruby
    Given we want to add the following javascript into "app.min.js":
      """
        a = "a"
        "var a =  \"hello #{a}\" ;"




      """
    And we want to add the file "b.js" into "app.min.js"
    When I run rake minify
    Then "app.min.js" should include "a.min.js" and "b.min.js"
