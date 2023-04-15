<p align="center">
  <img src="https://www.skie.io/images/skie_logo.svg" width="200" title="hover text">
  
</p>
<h1>Retention Plan Lib</h1>
<p> A Ruby library to manage retention plans for snapshots backups.</p>

<h2> Context </h2>

<i> When we backup a specific ERP instance, we keep the snapshot copies according to the Retention Plan.
    So, if the rule of the retention plan is to keep the snapshots for 7 days, it would mean that a snapshot created today should be deleted after 7 days, and so on.
    We need to create a lib that receives a retention plan and a date, and it should tell us if the snapshot for this date should be retained or deleted.

    The plans and rules are the following:
    - Standard: 42 days retention
          We will retain each snapshot daily for 42 days
    - Gold: 42 days and 12 months retention
           We will retain each snapshot daily for 42 days
           We will retain the last snapshot of the month for 12 months
    - Platinum (42 days, 12 months and 7 years)
           We will retain each snapshot daily for 42 days
           We will retain the last snapshot of the month for 12 months
           We will retain the last snapshot of the year for 7 years</i>

<h2> 🎬 About project</h2>

<p> When we backup a specific ERP instance, we keep the snapshot copies according to the Retention Plan. So, if the rule of the retention plan is to keep the snapshots for 7 days, it would mean that a snapshot created today should be deleted after 7 days, and so on. This library receives a retention plan and a date, and it should tell us if the snapshot for this date should be retained or deleted. </p>
    
<h2>The plans and rules are the following:</h2>
  <li> Standard: 42 days retention
    We will retain each snapshot daily for 42 days</li>
  <li> Gold: 42 days and 12 months retention </li>
    We will retain each snapshot daily for 42 days
    We will retain the last snapshot of the month for 12 months
  <li> Platinum (42 days, 12 months and 7 years)
    We will retain each snapshot daily for 42 days
    We will retain the last snapshot of the month for 12 months
    We will retain the last snapshot of the year for 7 years </li>

<h2> 🛠 Dependencies</h2>

<p>This library was developed using Ruby and depends on the following external gems:</p>

<p>active_support - provides several utility classes and standard library extensions that are useful for Ruby applications.</p>

<p>rspec - a testing framework for Ruby, used for the development of unit tests.</p>

<h2> 🚀 How to run the project</h2>

<p>To install this library, you need to have Ruby installed on your machine. You can install it using your system's package manager or download it from the official website.</p>

<p>After installing Ruby, clone this repository to your local machine:</p>

 ```sh
   git@github.com:Jamal-CRF/retention_plan_lib.git
  ```

<p>Then, navigate to the project's directory and run:</p>

 ```sh
   bundle install
  ```
<p> </p>


<h2> 📝 How to use the library</h2>

<p> Usage
To use this library, you can require the retention_plan file in your project and call the should_retain_snapshot? method, passing the retention plan symbol and a date object as parameters: </p>

 ```sh 
  require_relative 'lib/retention_plan'
  RetentionPlan.should_retain_snapshot?(:standard, Date.today - 20.days)
  # => true 
  ```

<h2> 📝 How to run the tests</h2>

This library was developed using Test-Driven Development (TDD) and all tests are located in the spec directory. To run the tests, navigate to the project's directory and run:

```sh
   rspec
  ```

<h2> Author</h2>

<img src="https://avatars.githubusercontent.com/u/68801163?s=96&v=4" width="110" title="hover text">

<p>Developed by <a href="https://www.linkedin.com/in/lucasaraujomouta/">Lucas Araujo</a>.</strong></p>



<h2> 📝 references</h2>

<p><a href="https://leanpub.com/conhecendo-ruby"> Lvro - Conhecendo Ruby </a></p>
<p><a href="https://www.ruby-lang.org/pt/"> Ruby </a></p>
<p><a href="https://www.rubyguides.com/2018/11/rspec-introduction/"> Rspec </a></p>
<p><a href="https://medium.com/@anchietajunior/c%C3%B3digo-organizado-reutiliz%C3%A1vel-e-f%C3%A1cil-de-testar-utilizando-ruby-service-objects-80c750876610/"> Artigo - Ruby Service Objects </a></p>

