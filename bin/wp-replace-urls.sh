#!/usr/bin/env bash

#replaceURLs: function() {
#    console.info('Replacing WordPress URLs');
#
#    // if (!this.isInstalled(true)) {
#    //     return;
#    // }
#
#    let siteName = git.repoName();
#
#    let questions = [
#      {
#        type: 'input',
#        name: 'site_name',
#        message: 'Site Name?',
#        default: siteName,
#      },
#      {
#        type: 'list',
#        name: 'desiredSubdomain',
#        message: 'Desired Subdomain',
#        choices: SmashWP.defaults.subdomains,
#        default: SmashWP.defaults.subdomains[0],
#      },
#      {
#        type: 'list',
#        name: 'desiredProtocol',
#        message: 'Desired Protocol?',
#        choices: SmashWP.defaults.protocols,
#        default: SmashWP.defaults.protocols[0],
#      },
#
#    ];
#
#    let inquirer = require('inquirer');
#    inquirer.prompt(questions).then(function(answers) {
#      SmashWP._do_replace('https', answers.desiredSubdomain, answers.site_name);
#    });
#  },
#
#  _do_replace: function(
#      desiredProtocol = '', desiredSubdomain = '', desiredSitetName = '') {
#    let desiredSiteURL = desiredProtocol + '://' + desiredSubdomain + '.' +
#        desiredSitetName;
#
#    for (let i = 0; i < SmashWP.defaults.subdomains.length; i++) {
#      for (let j = 0; j < SmashWP.defaults.protocols.length; j++) {
#        /**
#         * Don't do anything for the chosen subdomain
#         */
#        if (desiredSubdomain === SmashWP.defaults.subdomains[i]) {
#          continue;
#        }
#
#        let protocol = SmashWP.defaults.protocols[j];
#        let subDomain = SmashWP.defaults.subdomains[i];
#        let from = protocol + '://' + subDomain + '.' + desiredSitetName;
#
#        console.log('Replacing ' + from + ' -> ' + desiredSiteURL);
#        sh.exec('wp search-replace ' + from + ' ' + desiredSiteURL +
#            ' --report-changed-only --skip-plugins --skip-themes --skip-packages --all-tables');
#        console.log('');
#      }
#    }
#
#    /**
#     * Make sure that dynamic protocols are used system wide if https is selected
#     */
#    if ('https' === desiredProtocol) {
#      console.log();
#      console.log(
#          'Replacing all non-secure protocols with dynamic protocols...');
#      sh.exec(
#          'wp search-replace http:// https:// --report-changed-only --skip-themes --skip-plugins --skip-packages');
#    }
#
#    // if the db was imported from a different site, make sure that the requested site name replaces that of the other site
#    // @todo allow importing a db from a different site
#    let currentSiteName = SmashWP.siteName();
#    if (currentSiteName !== desiredSitetName) {
#      console.log();
#      console.log('Current Site Name does not match... updating...');
#
#      // sh.exec( 'wp search-replace ' + currentSiteName + ' ' + desiredSitetName + ' --report-changed-only');
#      // sh.exec( 'wp option update sitename ' + desiredSitetName );
#    }
#
#    console.log();
#    console.success('SITE URL is now: ' + SmashWP.siteName());
#    sh.exec('open ' + desiredSiteURL);
#  },