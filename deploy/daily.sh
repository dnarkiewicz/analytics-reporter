#!/bin/bash

export PATH=$PATH:/usr/local/bin
source $HOME/.bashrc

# JSON and CSV versions
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# ED Reports
source $HOME/envs/ed.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# VA Reports
source $HOME/envs/va.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# NASA Reports
source $HOME/envs/nasa.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# DOJ Reports
source $HOME/envs/doj.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Commerce Reports
source $HOME/envs/commerce.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# EPA Reports
source $HOME/envs/epa.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# SBA Reports
# source $HOME/envs/sba.env
# $HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
# $HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Energy Reports
source $HOME/envs/energy.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# DOI Reports
source $HOME/envs/doi.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# NARA Reports
source $HOME/envs/nara.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Agriculture
source $HOME/envs/agriculture.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Defense
source $HOME/envs/defense.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Health and Human Services
source $HOME/envs/hhs.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Housing and Urban Development
source $HOME/envs/hud.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Homeland Security
source $HOME/envs/dhs.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Labor
source $HOME/envs/labor.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of State
source $HOME/envs/state.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of Transportation
source $HOME/envs/transportation.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Department of the Treasury
source $HOME/envs/treasury.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Agency for International Development
source $HOME/envs/usaid.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# General Services Administration
source $HOME/envs/gsa.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# National Science Foundation
source $HOME/envs/nsf.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Nuclear Regulatory Commission
source $HOME/envs/nrc.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Office of Personnel Management
source $HOME/envs/opm.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv

# Social Security Administration
source $HOME/envs/ssa.env
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose
$HOME/analytics-reporter/bin/analytics --publish --frequency=daily --slim --verbose --csv
