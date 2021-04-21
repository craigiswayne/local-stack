<?php phpinfo(); ?>
<pre>
# TODO
[ ] Get list of all repos you have contributed to
[ ] List of all repos on your machine
[ ] All project repos must have staging, dev and production column
[ ] All project repos must point dev to 152.111.240.159
[ ] If any errors from wrong IP above, allow to automatically log OPS ticket
[ ] OPS Ticket logged from above must be linked to prevent duplicating OPS tickets
[ ] All project repos environments must respond with 200
[ ] All project repos to have jenkins jobs
[ ] All project repos to have last jenkins job status as sunny
[ ] List of outstanding issues on all repos
[ ] Jenkins staging environments must have a release branch that starts with release
[ ] All staging repos must live on php7 box
[ ] All sites to be SSL
[ ] All sites / projects to be composered
[ ] Get all your gists from github, see here: https://stackoverflow.com/questions/18019142/how-to-clone-a-github-gist-via-ssh-protocol
</pre>

<details>
  <legend>Portfolio Sites</legend>
  <table>
    <thead>
      <tr><th>URL</th><th>Description</th></tr>
    </thead>
    <tr><td>https://www.runnersworld.co.za/</td><td>Web Presence for the Popular RunnersWorld Magazine</td><tr>
    <tr><td>https://www.bicycling.co.za/</td><td>Web Presence for the Popular Bicycling Magazine</td></tr>
    <tr><td>https://www.womenshealthsa.co.za/</td><td>Web Presence for the Popular WomensHealth Magazine</td></tr>
    <tr><td>https://mh.co.za</td><td>Web Presence for the Popular MensHealth Magazine</td></tr>
    <tr><td>https://thankyouforcaring.health24.com/</td><td>Healthy Lifestyle Campaign run by Health24 in Partnership with TENA</td></tr>
    <tr><td>https://beyondbeauty.health24.com/</td><td>(Similarly) Health and Beauty Lifestyle Campaign run by Health24</td></tr>
    <tr><td>http://www.gupta-leaks.com</td><td>Marketing Campaign which focus on the developments of the infamous Gupta Brothers and their associates</td></tr>
    <tr><td>https://cyril100.news24.com/</td><td>Marketing Campaign which focus on the Presidency of Cyril Ramaphosa</td></tr>
    <tr><td>https://exposed.news24.com/</td><td>Marketing Campaign which focus circulation of Fake News within the South African context</td></tr>
  </table>
</details>

<details>
  <legend>Portfolio Personal Packages</legend>
  <table>
    <thead>
      <tr><th>Project<th>URL</th><th>Description</th></tr>
    </thead>
    <tr><td>Gravity Forms LinkedIN Integration<td>https://packagist.org/packages/craigiswayne/gravity-forms-linkedin-autofill</td><td>This WordPress plugin integrates Gravity Forms WordPress plugin with the LinkedIN API allowing users to "automatically fill in" a form with details from their LinkedIN Profile Links: https://gitlab.com/craigiswayne/gravity-forms-linkedin-addon This plugin is available to install via packagist.org</td><tr>
    <tr><td>Kirki JSON Config</td><td>https://packagist.org/packages/craigiswayne/kirki-json-config</td><td>This plugin allows for developers to define Customizer Settings via a JSON file, read by another popular plugin called Kirki </td></tr>
  </table>
</details>

WAKA Time Link: https://wakatime.com/@craigiswayne

<table>
  <thead>
    <tr>
      <th>Project</th>
      <th>git URL</th>
      <th>Live</th>
      <th>Staging</th>
      <th>Dev</th>
      <th>Composered</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>First Grader</td>
      <td></td>
      <td>http://firstgrader.you.co.za/</td>
      <td>http://staging.firstgrader.you.co.za/</td>
      <td>http://dev.firstgrader.you.co.za/</td>
    </tr>
  </tbody>
</table>

<pre>
  <?php
  $doc_root = $_SERVER['DOCUMENT_ROOT'];
  $directories = new \RecursiveDirectoryIterator($doc_root, \FilesystemIterator::SKIP_DOTS);
  foreach( $directories as $dir ){
    echo $dir->getFilename();
    echo '<br/>';
  }
  ?>
</pre>
