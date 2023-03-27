{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "0e7d2380",
   "metadata": {
    "papermill": {
     "duration": 0.006016,
     "end_time": "2023-03-27T06:52:56.645180",
     "exception": false,
     "start_time": "2023-03-27T06:52:56.639164",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **Problem Statement**\n",
    "The main goals of this analysis is to:\n",
    "\n",
    "1. Identify trends in smart device usage \n",
    "2. Apply these trends to Bellabeat customers\n",
    "3. Record the effects of these trends on Bellabeat's marketing strategy\n",
    "\n",
    "## \"**Data**\"\n",
    "\n",
    "The dataset was obtain from Kaggle, licensed under CCO: Public Domaib and was made available through [Mobius](https://www.kaggle.com/arashnic). The dataset contains personal fitness tracker from thirty fitbit users who consented to the submission of personal tracker data which includes:\n",
    "\n",
    "* minute-level output for physical activity\n",
    "* heart rate\n",
    "* sleep monitoring\n",
    "* steps\n",
    "\n",
    "## **Processing the data**\n",
    "\n",
    "First, the dataset was downloaded from Kaggle and then uploaded to RStudio cloud. \n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "8bd502f2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:52:56.661166Z",
     "iopub.status.busy": "2023-03-27T06:52:56.658126Z",
     "iopub.status.idle": "2023-03-27T06:52:58.083665Z",
     "shell.execute_reply": "2023-03-27T06:52:58.081475Z"
    },
    "papermill": {
     "duration": 1.437367,
     "end_time": "2023-03-27T06:52:58.087237",
     "exception": false,
     "start_time": "2023-03-27T06:52:56.649870",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "463f0f8b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:52:58.132766Z",
     "iopub.status.busy": "2023-03-27T06:52:58.099270Z",
     "iopub.status.idle": "2023-03-27T06:53:07.814676Z",
     "shell.execute_reply": "2023-03-27T06:53:07.812885Z"
    },
    "papermill": {
     "duration": 9.725549,
     "end_time": "2023-03-27T06:53:07.817634",
     "exception": false,
     "start_time": "2023-03-27T06:52:58.092085",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       "  & <dbl> & <chr> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDate &lt;chr&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 4/12/2016    13162      8.50          8.50           \n",
       "2 1503960366 4/13/2016    10735      6.97          6.97           \n",
       "3 1503960366 4/14/2016    10460      6.74          6.74           \n",
       "4 1503960366 4/15/2016     9762      6.28          6.28           \n",
       "5 1503960366 4/16/2016    12669      8.16          8.16           \n",
       "6 1503960366 4/17/2016     9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDate'</li><li>'TotalSteps'</li><li>'TotalDistance'</li><li>'TrackerDistance'</li><li>'LoggedActivitiesDistance'</li><li>'VeryActiveDistance'</li><li>'ModeratelyActiveDistance'</li><li>'LightActiveDistance'</li><li>'SedentaryActiveDistance'</li><li>'VeryActiveMinutes'</li><li>'FairlyActiveMinutes'</li><li>'LightlyActiveMinutes'</li><li>'SedentaryMinutes'</li><li>'Calories'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDate'\n",
       "\\item 'TotalSteps'\n",
       "\\item 'TotalDistance'\n",
       "\\item 'TrackerDistance'\n",
       "\\item 'LoggedActivitiesDistance'\n",
       "\\item 'VeryActiveDistance'\n",
       "\\item 'ModeratelyActiveDistance'\n",
       "\\item 'LightActiveDistance'\n",
       "\\item 'SedentaryActiveDistance'\n",
       "\\item 'VeryActiveMinutes'\n",
       "\\item 'FairlyActiveMinutes'\n",
       "\\item 'LightlyActiveMinutes'\n",
       "\\item 'SedentaryMinutes'\n",
       "\\item 'Calories'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDate'\n",
       "3. 'TotalSteps'\n",
       "4. 'TotalDistance'\n",
       "5. 'TrackerDistance'\n",
       "6. 'LoggedActivitiesDistance'\n",
       "7. 'VeryActiveDistance'\n",
       "8. 'ModeratelyActiveDistance'\n",
       "9. 'LightActiveDistance'\n",
       "10. 'SedentaryActiveDistance'\n",
       "11. 'VeryActiveMinutes'\n",
       "12. 'FairlyActiveMinutes'\n",
       "13. 'LightlyActiveMinutes'\n",
       "14. 'SedentaryMinutes'\n",
       "15. 'Calories'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Id\"                       \"ActivityDate\"            \n",
       " [3] \"TotalSteps\"               \"TotalDistance\"           \n",
       " [5] \"TrackerDistance\"          \"LoggedActivitiesDistance\"\n",
       " [7] \"VeryActiveDistance\"       \"ModeratelyActiveDistance\"\n",
       " [9] \"LightActiveDistance\"      \"SedentaryActiveDistance\" \n",
       "[11] \"VeryActiveMinutes\"        \"FairlyActiveMinutes\"     \n",
       "[13] \"LightlyActiveMinutes\"     \"SedentaryMinutes\"        \n",
       "[15] \"Calories\"                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & ActivityDay & Calories\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay Calories\n",
       "1 1503960366 4/12/2016   1985    \n",
       "2 1503960366 4/13/2016   1797    \n",
       "3 1503960366 4/14/2016   1776    \n",
       "4 1503960366 4/15/2016   1745    \n",
       "5 1503960366 4/16/2016   1863    \n",
       "6 1503960366 4/17/2016   1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDay'</li><li>'Calories'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDay'\n",
       "\\item 'Calories'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDay'\n",
       "3. 'Calories'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"          \"ActivityDay\" \"Calories\"   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>SedentaryMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>VeryActiveMinutes</th><th scope=col>SedentaryActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>VeryActiveDistance</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td> 728</td><td>328</td><td>13</td><td>25</td><td>0</td><td>6.06</td><td>0.55</td><td>1.88</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td> 776</td><td>217</td><td>19</td><td>21</td><td>0</td><td>4.71</td><td>0.69</td><td>1.57</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1218</td><td>181</td><td>11</td><td>30</td><td>0</td><td>3.91</td><td>0.40</td><td>2.44</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 726</td><td>209</td><td>34</td><td>29</td><td>0</td><td>2.83</td><td>1.26</td><td>2.14</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td> 773</td><td>221</td><td>10</td><td>36</td><td>0</td><td>5.04</td><td>0.41</td><td>2.71</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 539</td><td>164</td><td>20</td><td>38</td><td>0</td><td>2.51</td><td>0.78</td><td>3.19</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & Id & ActivityDay & SedentaryMinutes & LightlyActiveMinutes & FairlyActiveMinutes & VeryActiveMinutes & SedentaryActiveDistance & LightActiveDistance & ModeratelyActiveDistance & VeryActiveDistance\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 &  728 & 328 & 13 & 25 & 0 & 6.06 & 0.55 & 1.88\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 &  776 & 217 & 19 & 21 & 0 & 4.71 & 0.69 & 1.57\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1218 & 181 & 11 & 30 & 0 & 3.91 & 0.40 & 2.44\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  726 & 209 & 34 & 29 & 0 & 2.83 & 1.26 & 2.14\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 &  773 & 221 & 10 & 36 & 0 & 5.04 & 0.41 & 2.71\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  539 & 164 & 20 & 38 & 0 & 2.51 & 0.78 & 3.19\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | SedentaryMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | VeryActiveMinutes &lt;int&gt; | SedentaryActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 |  728 | 328 | 13 | 25 | 0 | 6.06 | 0.55 | 1.88 |\n",
       "| 2 | 1503960366 | 4/13/2016 |  776 | 217 | 19 | 21 | 0 | 4.71 | 0.69 | 1.57 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1218 | 181 | 11 | 30 | 0 | 3.91 | 0.40 | 2.44 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  726 | 209 | 34 | 29 | 0 | 2.83 | 1.26 | 2.14 |\n",
       "| 5 | 1503960366 | 4/16/2016 |  773 | 221 | 10 | 36 | 0 | 5.04 | 0.41 | 2.71 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  539 | 164 | 20 | 38 | 0 | 2.51 | 0.78 | 3.19 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay SedentaryMinutes LightlyActiveMinutes\n",
       "1 1503960366 4/12/2016    728             328                 \n",
       "2 1503960366 4/13/2016    776             217                 \n",
       "3 1503960366 4/14/2016   1218             181                 \n",
       "4 1503960366 4/15/2016    726             209                 \n",
       "5 1503960366 4/16/2016    773             221                 \n",
       "6 1503960366 4/17/2016    539             164                 \n",
       "  FairlyActiveMinutes VeryActiveMinutes SedentaryActiveDistance\n",
       "1 13                  25                0                      \n",
       "2 19                  21                0                      \n",
       "3 11                  30                0                      \n",
       "4 34                  29                0                      \n",
       "5 10                  36                0                      \n",
       "6 20                  38                0                      \n",
       "  LightActiveDistance ModeratelyActiveDistance VeryActiveDistance\n",
       "1 6.06                0.55                     1.88              \n",
       "2 4.71                0.69                     1.57              \n",
       "3 3.91                0.40                     2.44              \n",
       "4 2.83                1.26                     2.14              \n",
       "5 5.04                0.41                     2.71              \n",
       "6 2.51                0.78                     3.19              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDay'</li><li>'SedentaryMinutes'</li><li>'LightlyActiveMinutes'</li><li>'FairlyActiveMinutes'</li><li>'VeryActiveMinutes'</li><li>'SedentaryActiveDistance'</li><li>'LightActiveDistance'</li><li>'ModeratelyActiveDistance'</li><li>'VeryActiveDistance'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDay'\n",
       "\\item 'SedentaryMinutes'\n",
       "\\item 'LightlyActiveMinutes'\n",
       "\\item 'FairlyActiveMinutes'\n",
       "\\item 'VeryActiveMinutes'\n",
       "\\item 'SedentaryActiveDistance'\n",
       "\\item 'LightActiveDistance'\n",
       "\\item 'ModeratelyActiveDistance'\n",
       "\\item 'VeryActiveDistance'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDay'\n",
       "3. 'SedentaryMinutes'\n",
       "4. 'LightlyActiveMinutes'\n",
       "5. 'FairlyActiveMinutes'\n",
       "6. 'VeryActiveMinutes'\n",
       "7. 'SedentaryActiveDistance'\n",
       "8. 'LightActiveDistance'\n",
       "9. 'ModeratelyActiveDistance'\n",
       "10. 'VeryActiveDistance'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Id\"                       \"ActivityDay\"             \n",
       " [3] \"SedentaryMinutes\"         \"LightlyActiveMinutes\"    \n",
       " [5] \"FairlyActiveMinutes\"      \"VeryActiveMinutes\"       \n",
       " [7] \"SedentaryActiveDistance\"  \"LightActiveDistance\"     \n",
       " [9] \"ModeratelyActiveDistance\" \"VeryActiveDistance\"      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>StepTotal</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & ActivityDay & StepTotal\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | StepTotal &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay StepTotal\n",
       "1 1503960366 4/12/2016   13162    \n",
       "2 1503960366 4/13/2016   10735    \n",
       "3 1503960366 4/14/2016   10460    \n",
       "4 1503960366 4/15/2016    9762    \n",
       "5 1503960366 4/16/2016   12669    \n",
       "6 1503960366 4/17/2016    9705    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDay'</li><li>'StepTotal'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDay'\n",
       "\\item 'StepTotal'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDay'\n",
       "3. 'StepTotal'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"          \"ActivityDay\" \"StepTotal\"  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>SleepDay</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/16/2016 12:00:00 AM</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/17/2016 12:00:00 AM</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/19/2016 12:00:00 AM</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Id & SleepDay & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 12:00:00 AM & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 12:00:00 AM & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 4/15/2016 12:00:00 AM & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 4/16/2016 12:00:00 AM & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 4/17/2016 12:00:00 AM & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 4/19/2016 12:00:00 AM & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | SleepDay &lt;chr&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 12:00:00 AM | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 4/13/2016 12:00:00 AM | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 4/15/2016 12:00:00 AM | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 4/16/2016 12:00:00 AM | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 4/17/2016 12:00:00 AM | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 4/19/2016 12:00:00 AM | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         SleepDay              TotalSleepRecords TotalMinutesAsleep\n",
       "1 1503960366 4/12/2016 12:00:00 AM 1                 327               \n",
       "2 1503960366 4/13/2016 12:00:00 AM 2                 384               \n",
       "3 1503960366 4/15/2016 12:00:00 AM 1                 412               \n",
       "4 1503960366 4/16/2016 12:00:00 AM 2                 340               \n",
       "5 1503960366 4/17/2016 12:00:00 AM 1                 700               \n",
       "6 1503960366 4/19/2016 12:00:00 AM 1                 304               \n",
       "  TotalTimeInBed\n",
       "1 346           \n",
       "2 407           \n",
       "3 442           \n",
       "4 367           \n",
       "5 712           \n",
       "6 320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'SleepDay'</li><li>'TotalSleepRecords'</li><li>'TotalMinutesAsleep'</li><li>'TotalTimeInBed'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'SleepDay'\n",
       "\\item 'TotalSleepRecords'\n",
       "\\item 'TotalMinutesAsleep'\n",
       "\\item 'TotalTimeInBed'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'SleepDay'\n",
       "3. 'TotalSleepRecords'\n",
       "4. 'TotalMinutesAsleep'\n",
       "5. 'TotalTimeInBed'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"                 \"SleepDay\"           \"TotalSleepRecords\" \n",
       "[4] \"TotalMinutesAsleep\" \"TotalTimeInBed\"    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>Date</th><th scope=col>WeightKg</th><th scope=col>WeightPounds</th><th scope=col>Fat</th><th scope=col>BMI</th><th scope=col>IsManualReport</th><th scope=col>LogId</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>5/2/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td>True </td><td>1.462234e+12</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>5/3/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td>True </td><td>1.462320e+12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1927972279</td><td>4/13/2016 1:08:52 AM </td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>False</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2873212765</td><td>4/21/2016 11:59:59 PM</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td>True </td><td>1.461283e+12</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2873212765</td><td>5/12/2016 11:59:59 PM</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td>True </td><td>1.463098e+12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>4319703577</td><td>4/17/2016 11:59:59 PM</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td>True </td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Id & Date & WeightKg & WeightPounds & Fat & BMI & IsManualReport & LogId\\\\\n",
       "  & <dbl> & <chr> & <dbl> & <dbl> & <int> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 5/2/2016 11:59:59 PM  &  52.6 & 115.9631 & 22 & 22.65 & True  & 1.462234e+12\\\\\n",
       "\t2 & 1503960366 & 5/3/2016 11:59:59 PM  &  52.6 & 115.9631 & NA & 22.65 & True  & 1.462320e+12\\\\\n",
       "\t3 & 1927972279 & 4/13/2016 1:08:52 AM  & 133.5 & 294.3171 & NA & 47.54 & False & 1.460510e+12\\\\\n",
       "\t4 & 2873212765 & 4/21/2016 11:59:59 PM &  56.7 & 125.0021 & NA & 21.45 & True  & 1.461283e+12\\\\\n",
       "\t5 & 2873212765 & 5/12/2016 11:59:59 PM &  57.3 & 126.3249 & NA & 21.69 & True  & 1.463098e+12\\\\\n",
       "\t6 & 4319703577 & 4/17/2016 11:59:59 PM &  72.4 & 159.6147 & 25 & 27.45 & True  & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | Date &lt;chr&gt; | WeightKg &lt;dbl&gt; | WeightPounds &lt;dbl&gt; | Fat &lt;int&gt; | BMI &lt;dbl&gt; | IsManualReport &lt;chr&gt; | LogId &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 5/2/2016 11:59:59 PM  |  52.6 | 115.9631 | 22 | 22.65 | True  | 1.462234e+12 |\n",
       "| 2 | 1503960366 | 5/3/2016 11:59:59 PM  |  52.6 | 115.9631 | NA | 22.65 | True  | 1.462320e+12 |\n",
       "| 3 | 1927972279 | 4/13/2016 1:08:52 AM  | 133.5 | 294.3171 | NA | 47.54 | False | 1.460510e+12 |\n",
       "| 4 | 2873212765 | 4/21/2016 11:59:59 PM |  56.7 | 125.0021 | NA | 21.45 | True  | 1.461283e+12 |\n",
       "| 5 | 2873212765 | 5/12/2016 11:59:59 PM |  57.3 | 126.3249 | NA | 21.69 | True  | 1.463098e+12 |\n",
       "| 6 | 4319703577 | 4/17/2016 11:59:59 PM |  72.4 | 159.6147 | 25 | 27.45 | True  | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Date                  WeightKg WeightPounds Fat BMI  \n",
       "1 1503960366 5/2/2016 11:59:59 PM   52.6    115.9631     22  22.65\n",
       "2 1503960366 5/3/2016 11:59:59 PM   52.6    115.9631     NA  22.65\n",
       "3 1927972279 4/13/2016 1:08:52 AM  133.5    294.3171     NA  47.54\n",
       "4 2873212765 4/21/2016 11:59:59 PM  56.7    125.0021     NA  21.45\n",
       "5 2873212765 5/12/2016 11:59:59 PM  57.3    126.3249     NA  21.69\n",
       "6 4319703577 4/17/2016 11:59:59 PM  72.4    159.6147     25  27.45\n",
       "  IsManualReport LogId       \n",
       "1 True           1.462234e+12\n",
       "2 True           1.462320e+12\n",
       "3 False          1.460510e+12\n",
       "4 True           1.461283e+12\n",
       "5 True           1.463098e+12\n",
       "6 True           1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'Date'</li><li>'WeightKg'</li><li>'WeightPounds'</li><li>'Fat'</li><li>'BMI'</li><li>'IsManualReport'</li><li>'LogId'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'Date'\n",
       "\\item 'WeightKg'\n",
       "\\item 'WeightPounds'\n",
       "\\item 'Fat'\n",
       "\\item 'BMI'\n",
       "\\item 'IsManualReport'\n",
       "\\item 'LogId'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'Date'\n",
       "3. 'WeightKg'\n",
       "4. 'WeightPounds'\n",
       "5. 'Fat'\n",
       "6. 'BMI'\n",
       "7. 'IsManualReport'\n",
       "8. 'LogId'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"             \"Date\"           \"WeightKg\"       \"WeightPounds\"  \n",
       "[5] \"Fat\"            \"BMI\"            \"IsManualReport\" \"LogId\"         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>Time</th><th scope=col>Value</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>2022484408</td><td>4/12/2016 7:21:00 AM</td><td> 97</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2022484408</td><td>4/12/2016 7:21:05 AM</td><td>102</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>2022484408</td><td>4/12/2016 7:21:10 AM</td><td>105</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2022484408</td><td>4/12/2016 7:21:20 AM</td><td>103</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2022484408</td><td>4/12/2016 7:21:25 AM</td><td>101</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>2022484408</td><td>4/12/2016 7:22:05 AM</td><td> 95</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & Time & Value\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 2022484408 & 4/12/2016 7:21:00 AM &  97\\\\\n",
       "\t2 & 2022484408 & 4/12/2016 7:21:05 AM & 102\\\\\n",
       "\t3 & 2022484408 & 4/12/2016 7:21:10 AM & 105\\\\\n",
       "\t4 & 2022484408 & 4/12/2016 7:21:20 AM & 103\\\\\n",
       "\t5 & 2022484408 & 4/12/2016 7:21:25 AM & 101\\\\\n",
       "\t6 & 2022484408 & 4/12/2016 7:22:05 AM &  95\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | Time &lt;chr&gt; | Value &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 2022484408 | 4/12/2016 7:21:00 AM |  97 |\n",
       "| 2 | 2022484408 | 4/12/2016 7:21:05 AM | 102 |\n",
       "| 3 | 2022484408 | 4/12/2016 7:21:10 AM | 105 |\n",
       "| 4 | 2022484408 | 4/12/2016 7:21:20 AM | 103 |\n",
       "| 5 | 2022484408 | 4/12/2016 7:21:25 AM | 101 |\n",
       "| 6 | 2022484408 | 4/12/2016 7:22:05 AM |  95 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Time                 Value\n",
       "1 2022484408 4/12/2016 7:21:00 AM  97  \n",
       "2 2022484408 4/12/2016 7:21:05 AM 102  \n",
       "3 2022484408 4/12/2016 7:21:10 AM 105  \n",
       "4 2022484408 4/12/2016 7:21:20 AM 103  \n",
       "5 2022484408 4/12/2016 7:21:25 AM 101  \n",
       "6 2022484408 4/12/2016 7:22:05 AM  95  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'Time'</li><li>'Value'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'Time'\n",
       "\\item 'Value'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'Time'\n",
       "3. 'Value'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"    \"Time\"  \"Value\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "daily_activity <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv\")\n",
    "head(daily_activity)\n",
    "colnames(daily_activity)\n",
    "\n",
    "daily_calories <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv\")\n",
    "head(daily_calories)\n",
    "colnames(daily_calories)\n",
    "\n",
    "daily_intensities <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv\")\n",
    "head(daily_intensities)\n",
    "colnames(daily_intensities)\n",
    "\n",
    "daily_steps <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv\")\n",
    "head(daily_steps)\n",
    "colnames(daily_steps)\n",
    "\n",
    "daily_sleep <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv\")\n",
    "head(daily_sleep)\n",
    "colnames(daily_sleep)\n",
    "\n",
    "weight_info <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv\")\n",
    "head(weight_info)\n",
    "colnames(weight_info)\n",
    "\n",
    "heartrate_secs <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/heartrate_seconds_merged.csv\")\n",
    "head(heartrate_secs)\n",
    "colnames(heartrate_secs)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "201d6cf8",
   "metadata": {
    "papermill": {
     "duration": 0.007527,
     "end_time": "2023-03-27T06:53:07.833037",
     "exception": false,
     "start_time": "2023-03-27T06:53:07.825510",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **Cleaning Data**\n",
    "Changed the date and time formats to be consistent\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "7892f53a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:07.852687Z",
     "iopub.status.busy": "2023-03-27T06:53:07.850980Z",
     "iopub.status.idle": "2023-03-27T06:53:07.883987Z",
     "shell.execute_reply": "2023-03-27T06:53:07.881998Z"
    },
    "papermill": {
     "duration": 0.045467,
     "end_time": "2023-03-27T06:53:07.886604",
     "exception": false,
     "start_time": "2023-03-27T06:53:07.841137",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "daily_activity$ActivityDate <- as.Date(daily_activity$ActivityDate, \"%m/%d/%Y\")\n",
    "daily_sleep$ActivityDate <- parse_date_time(daily_sleep$SleepDay, orders = \"mdy HMS\")\n",
    "daily_sleep$ActivityDate <- as.Date(daily_sleep$ActivityDate, \"%m/%d/%y %h:%m:%s\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b0c3760a",
   "metadata": {
    "papermill": {
     "duration": 0.007261,
     "end_time": "2023-03-27T06:53:07.901289",
     "exception": false,
     "start_time": "2023-03-27T06:53:07.894028",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Checking and removing duplicates for duplicates"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "edc7b694",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:07.922368Z",
     "iopub.status.busy": "2023-03-27T06:53:07.920620Z",
     "iopub.status.idle": "2023-03-27T06:53:19.052932Z",
     "shell.execute_reply": "2023-03-27T06:53:19.051007Z"
    },
    "papermill": {
     "duration": 11.14525,
     "end_time": "2023-03-27T06:53:19.055905",
     "exception": false,
     "start_time": "2023-03-27T06:53:07.910655",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "3"
      ],
      "text/latex": [
       "3"
      ],
      "text/markdown": [
       "3"
      ],
      "text/plain": [
       "[1] 3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sum(duplicated(daily_activity))\n",
    "\n",
    "sum(duplicated(daily_sleep))\n",
    "daily_sleep <- distinct(daily_sleep)\n",
    "sum(duplicated(daily_sleep))\n",
    "\n",
    "sum(duplicated(daily_calories))\n",
    "\n",
    "sum(duplicated(daily_intensities))\n",
    "\n",
    "sum(duplicated(daily_steps))\n",
    "\n",
    "sum(duplicated(weight_info))\n",
    "\n",
    "sum(duplicated(heartrate_secs))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "67008fe4",
   "metadata": {
    "papermill": {
     "duration": 0.009415,
     "end_time": "2023-03-27T06:53:19.078038",
     "exception": false,
     "start_time": "2023-03-27T06:53:19.068623",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Checking for empty values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "ed475757",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:19.103968Z",
     "iopub.status.busy": "2023-03-27T06:53:19.102139Z",
     "iopub.status.idle": "2023-03-27T06:53:19.167531Z",
     "shell.execute_reply": "2023-03-27T06:53:19.165181Z"
    },
    "papermill": {
     "duration": 0.084183,
     "end_time": "2023-03-27T06:53:19.171091",
     "exception": false,
     "start_time": "2023-03-27T06:53:19.086908",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "FALSE"
      ],
      "text/latex": [
       "FALSE"
      ],
      "text/markdown": [
       "FALSE"
      ],
      "text/plain": [
       "[1] FALSE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "is.null(daily_activity)\n",
    "is.null(daily_calories)\n",
    "is.null(daily_intensities)\n",
    "is.null(daily_sleep)\n",
    "is.null(daily_steps)\n",
    "is.null(weight_info)\n",
    "is.null(heartrate_secs)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1ed40595",
   "metadata": {
    "papermill": {
     "duration": 0.009925,
     "end_time": "2023-03-27T06:53:19.190876",
     "exception": false,
     "start_time": "2023-03-27T06:53:19.180951",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **Analyzing data**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "5f810a24",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:19.214874Z",
     "iopub.status.busy": "2023-03-27T06:53:19.213016Z",
     "iopub.status.idle": "2023-03-27T06:53:19.399914Z",
     "shell.execute_reply": "2023-03-27T06:53:19.397914Z"
    },
    "papermill": {
     "duration": 0.202231,
     "end_time": "2023-03-27T06:53:19.402650",
     "exception": false,
     "start_time": "2023-03-27T06:53:19.200419",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "       Id             ActivityDate          TotalSteps    TotalDistance   \n",
       " Min.   :1.504e+09   Min.   :2016-04-12   Min.   :    0   Min.   : 0.000  \n",
       " 1st Qu.:2.320e+09   1st Qu.:2016-04-19   1st Qu.: 3790   1st Qu.: 2.620  \n",
       " Median :4.445e+09   Median :2016-04-26   Median : 7406   Median : 5.245  \n",
       " Mean   :4.855e+09   Mean   :2016-04-26   Mean   : 7638   Mean   : 5.490  \n",
       " 3rd Qu.:6.962e+09   3rd Qu.:2016-05-04   3rd Qu.:10727   3rd Qu.: 7.713  \n",
       " Max.   :8.878e+09   Max.   :2016-05-12   Max.   :36019   Max.   :28.030  \n",
       " TrackerDistance  LoggedActivitiesDistance VeryActiveDistance\n",
       " Min.   : 0.000   Min.   :0.0000           Min.   : 0.000    \n",
       " 1st Qu.: 2.620   1st Qu.:0.0000           1st Qu.: 0.000    \n",
       " Median : 5.245   Median :0.0000           Median : 0.210    \n",
       " Mean   : 5.475   Mean   :0.1082           Mean   : 1.503    \n",
       " 3rd Qu.: 7.710   3rd Qu.:0.0000           3rd Qu.: 2.053    \n",
       " Max.   :28.030   Max.   :4.9421           Max.   :21.920    \n",
       " ModeratelyActiveDistance LightActiveDistance SedentaryActiveDistance\n",
       " Min.   :0.0000           Min.   : 0.000      Min.   :0.000000       \n",
       " 1st Qu.:0.0000           1st Qu.: 1.945      1st Qu.:0.000000       \n",
       " Median :0.2400           Median : 3.365      Median :0.000000       \n",
       " Mean   :0.5675           Mean   : 3.341      Mean   :0.001606       \n",
       " 3rd Qu.:0.8000           3rd Qu.: 4.782      3rd Qu.:0.000000       \n",
       " Max.   :6.4800           Max.   :10.710      Max.   :0.110000       \n",
       " VeryActiveMinutes FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes\n",
       " Min.   :  0.00    Min.   :  0.00      Min.   :  0.0        Min.   :   0.0  \n",
       " 1st Qu.:  0.00    1st Qu.:  0.00      1st Qu.:127.0        1st Qu.: 729.8  \n",
       " Median :  4.00    Median :  6.00      Median :199.0        Median :1057.5  \n",
       " Mean   : 21.16    Mean   : 13.56      Mean   :192.8        Mean   : 991.2  \n",
       " 3rd Qu.: 32.00    3rd Qu.: 19.00      3rd Qu.:264.0        3rd Qu.:1229.5  \n",
       " Max.   :210.00    Max.   :143.00      Max.   :518.0        Max.   :1440.0  \n",
       "    Calories   \n",
       " Min.   :   0  \n",
       " 1st Qu.:1828  \n",
       " Median :2134  \n",
       " Mean   :2304  \n",
       " 3rd Qu.:2793  \n",
       " Max.   :4900  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "24"
      ],
      "text/latex": [
       "24"
      ],
      "text/markdown": [
       "24"
      ],
      "text/plain": [
       "[1] 24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "8"
      ],
      "text/latex": [
       "8"
      ],
      "text/markdown": [
       "8"
      ],
      "text/plain": [
       "[1] 8"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "14"
      ],
      "text/latex": [
       "14"
      ],
      "text/markdown": [
       "14"
      ],
      "text/plain": [
       "[1] 14"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "n_distinct(daily_activity$Id)\n",
    "summary(daily_activity)\n",
    "n_distinct(daily_calories$Id)\n",
    "n_distinct(daily_intensities$Id)\n",
    "n_distinct(daily_sleep$Id)\n",
    "n_distinct(daily_steps$Id)\n",
    "n_distinct(weight_info$Id)\n",
    "n_distinct(heartrate_secs$Id)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "44c8de2d",
   "metadata": {
    "papermill": {
     "duration": 0.012427,
     "end_time": "2023-03-27T06:53:19.429851",
     "exception": false,
     "start_time": "2023-03-27T06:53:19.417424",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Clearly, most fitbit users use smart devices frequently to track their daily activity, calories, intensities and steps and just a few use it to check their weight."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "c782f23f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:19.458922Z",
     "iopub.status.busy": "2023-03-27T06:53:19.456287Z",
     "iopub.status.idle": "2023-03-27T06:53:21.209634Z",
     "shell.execute_reply": "2023-03-27T06:53:21.207503Z"
    },
    "papermill": {
     "duration": 1.770167,
     "end_time": "2023-03-27T06:53:21.212517",
     "exception": false,
     "start_time": "2023-03-27T06:53:19.442350",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`geom_smooth()` using method = 'loess' and formula = 'y ~ x'\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = daily_activity)+ geom_smooth(mapping = aes(x = TotalDistance,y=Calories))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cfa9f5e3",
   "metadata": {
    "papermill": {
     "duration": 0.012053,
     "end_time": "2023-03-27T06:53:21.236565",
     "exception": false,
     "start_time": "2023-03-27T06:53:21.224512",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The graph above shows a positive correlation between the distance taken and the calories burned."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "e1332df0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:21.266339Z",
     "iopub.status.busy": "2023-03-27T06:53:21.264443Z",
     "iopub.status.idle": "2023-03-27T06:53:21.627706Z",
     "shell.execute_reply": "2023-03-27T06:53:21.625068Z"
    },
    "papermill": {
     "duration": 0.528935,
     "end_time": "2023-03-27T06:53:21.777239",
     "exception": false,
     "start_time": "2023-03-27T06:53:21.248304",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nPPrcwlZH/PPSYb0jX3brtU+3tF/HPn6bHH9PvP4JL/TD+ocx5W96JHZx1rj92fb7Vz29Yus5\nbSsXdL5/4sO8Pn9P/+H/qr4nVLryqXse+O8XSwrKfe277n3qBSMP3L2RiAw/edDxd9645OZb\nvlxZkJ3b/IBjzh09pF/kr5Ss/+aBe2d9vfTHYn/Tg04cXjUWlW1e/PC9Mz9e+HNBWTi/Veej\nzxg9+K+tf3hw9IQPejz3eOWtc8vP95095t17n3u6dZrdUGGIB6f8xIGnnPnIs6flZ0ReOOOk\ngQfc89SlrbLDFRtmPzjj9Y8Wbiz1te7Ue9DwC4/slhv5nrULXr3/yXlLf1vly8rrfcgJl5xz\nQobPqil6ojuAlj/3hN0yXv/vIhm8u4isfOWTjKYnHzJs6VO3PR1yDrYtKVozN+w4f9t7NxGp\nKSY1/e4xOltNP6ra2Mb4JzTHtibh8k2PTbnhta9+9GXmH3D0iEtP7ycSqyuecdLAMx54aM0j\n095dlDFz5gQvhMidXQJVtRTrqcgUhZzSTWt2fGX3E0eO77g58udqf+UZ55z2n40l8tLYU989\n8PmZV9SxHxp6x6ujWGGs+VKVmm96qdcJWYCIN1/6eXvnffD40sovnbJHvlp/0PAdl/+d+y+/\n8j+LnXMvm3DLP8f2Dv7vtrGXLS2uiLw3b9wt7QeNvnvGvZcM6vbmUzfPWlskIk7FhutG3/Dp\nhtxzr7hu3CVDN74x7aUNxZHvf/SqyR9tbHvpxBun3nLDib3DM28du74i3G7wsaWbX/uqsDzy\nPV899GlO5/NUdbt6mnnNZXMW22f+Y/ytN447eg/nrmv+/sbvRSJSUfTd6Mn3+/oOvO7m2676\n+0mL//PIja+vjBE9UR/Avx7WvGjdnJAjIvL2e2taH9tvt16nhkpXvryxRERWv7XEH9z9kCbp\nNcUk9u9ebWer6UdVG1tJuc755Y0Trb8Mvm363aNO6vbWMzc/v7641r/y4fTJWfuedPOtozwS\notjC5euW7Cy8/a2qQFV9s6ciIyLnDey1fsHdI8ZMeuKF/3zzw29ljtjBzn379o28W+2vfP5D\nT1/QIrvdcf965rGxsX94VXiNvuPVRewwxvbHm15KdkJm7OKv29kHbbj8wZJw36DP2rriqd+t\n1sNaZ8/Y/m7R2lmvryi87NFxh+UFRaRLzx7fnXHWjJeW3zGko4hkHTB2+FG9RaTtoCtaPzV/\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "daily_activity %>% \n",
    "  mutate(weekdays = weekdays(as.Date(ActivityDate))) %>% \n",
    "  select(weekdays, TotalSteps) %>% \n",
    "  mutate(weekdays = factor(weekdays, levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))) %>% \n",
    "  drop_na() %>%\n",
    "  ggplot(aes(x= weekdays, y= TotalSteps/1000)) +\n",
    "  geom_col(fill=\"purple\",alpha = 0.6)+\n",
    "  labs(title = \"Total steps taken\",subtitle=\"Total number of steps taken per weekday\", y= \"Total steps\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d966704e",
   "metadata": {
    "papermill": {
     "duration": 0.012997,
     "end_time": "2023-03-27T06:53:21.803983",
     "exception": false,
     "start_time": "2023-03-27T06:53:21.790986",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The graph above depicts that the highest number of steps are usually taken on Sunday followed by Monday and the least number of steps are taken on Saturday.\n",
    "\n",
    "According to the sleep physicians and scientists of National Center for Chronic Disease Prevention and Health Promotion([NCCDPHP](https://www.cdc.gov/sleep/about_sleep/how_much_sleep.html)) and [Sleep Foundation](https://www.sleepfoundation.org/how-sleep-works/how-much-sleep-do-we-really-need) studies, it is highly recommended for adults to have at least 7~9 hours or on average 8 hours of sleeping time. So let's apply it to our results."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "ac97fefa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:21.835310Z",
     "iopub.status.busy": "2023-03-27T06:53:21.833520Z",
     "iopub.status.idle": "2023-03-27T06:53:21.857342Z",
     "shell.execute_reply": "2023-03-27T06:53:21.855424Z"
    },
    "papermill": {
     "duration": 0.042974,
     "end_time": "2023-03-27T06:53:21.860023",
     "exception": false,
     "start_time": "2023-03-27T06:53:21.817049",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7"
      ],
      "text/latex": [
       "7"
      ],
      "text/markdown": [
       "7"
      ],
      "text/plain": [
       "[1] 7"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sleep_dur <- round(daily_sleep$TotalMinutesAsleep/60)\n",
    "avgsleep_dur <- round(mean(sleep_dur))\n",
    "avgsleep_dur"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cd3be247",
   "metadata": {
    "papermill": {
     "duration": 0.012215,
     "end_time": "2023-03-27T06:53:21.884701",
     "exception": false,
     "start_time": "2023-03-27T06:53:21.872486",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The average sleep of Fitbit users was 7 hours a day. The histogram below shows the distribution of sleep."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "c58ef39b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:21.917084Z",
     "iopub.status.busy": "2023-03-27T06:53:21.915235Z",
     "iopub.status.idle": "2023-03-27T06:53:22.238986Z",
     "shell.execute_reply": "2023-03-27T06:53:22.236993Z"
    },
    "papermill": {
     "duration": 0.343249,
     "end_time": "2023-03-27T06:53:22.241291",
     "exception": false,
     "start_time": "2023-03-27T06:53:21.898042",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n7z56UAihUOyY8bIjX3f0K/bYeUKh2Pn6D50ZQii2bH3iO9/dW6015BxIN+g0ACBeOQx2yyuU\n27d+/k5Hnfj+a++at9LBq9br/+13PvuqmXtvMbajWCiN2XybA17275f++E/L/5Ob/vPkbbcc\nWyi17HzQNWmWYFfZ7MDBRX+94P1v3n3yVm3l8rgJ2x7x5tN/+/Ci5f/V0/dcd9IRB2y52dLl\nZZ2TZn7v7qeP6W5fKSGt1IdVv4s0rf7qyk+88sCpm49pK7WOef4L9jvlo195pP+5imkbdkVf\nR+Pp8IJdOoxXe9Vgl6bpn35y6bGH7bvFuM5SuXXC9ru/4X2fvLunf6WW13lMPdjduWjgf79y\nxv67TupoKW3Wvc2hx57y87ufXsc33//olz9y8gt3mtjRUhq7xcTDjz/9T0/1/f60qcsHu3QY\nb+Wazpw0rf708x/af8rz21qKneO2POCVb/rxn59M0/SLJxw0trXUMX7SwqFa2ohzIBXsAHIq\nSdWsiszQ4icfeqR3+50nrWd5NNblPRPHfPFfi+5cNLBXx8jOS3orAdjIRs9dsZuMUsf4nXYe\n3+xe0ADeSgA2svzfPAEAMEoIdgAAOWEqllHnDRdcumfv4PPX92+8AkC03DwBAJATpmIBAHJC\nsAMAyAnBDgAgJwQ7AICcEOwAAHJCsAMAyAnBDgAgJwQ7AICcyMNfnhgaGlq8ePFKG0ulUqVS\nCSGsuoumSJKkvb19yZIltVqt2X0hhBDa29uTJBkYGBgcHGx2XwghhJaWliRJ+vv7m90RQnAR\niVJHR4eLSN3YsWPXtCsPwS5N01WvTMVisVQqrXYXTZEkSalUGhoaqlarze4LIYRQKBSKxaJg\nF496sPN2RKJQKJRKpRCCdyQepVKpWq0ODQ01uyNRMxULAJATgh0AQE7kYSoWYCP7WUvLA8Xi\nDtXqKwcGmt0XgOcYsQPI7Putred3dHy/tbXZHQFYgWAHAJATgh0AQE5YYweQ2b/19+9Qre6i\n7AIQGcEOILPX9fcHlYSB+JiKBQDICcEOACAnTMUCZKaOHRAnI3YAmaljB8RJsAMAyAnBDgAg\nJ6yxA8hMHTsgToIdQGbq2AFxMhULAJATgh0AQE6YigXITB07IE5G7AAyU8cOiJNgBwCQE4Id\nAEBOWGMHkJk6dkCcBDuAzNSxA+JkKhYAICcEOwCAnDAVC5CZOnZAnIzYAWSmjh0QJ8EOACAn\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data=daily_sleep) + geom_histogram(mapping=aes(x=sleep_dur), binwidth = 1, color=\"purple\", fill=\"purple\", alpha = 0.6)+\n",
    "\n",
    "  geom_vline(mapping=aes(xintercept=mean(sleep_dur, na.rm=T)), color=\"cyan\", \n",
    "             linetype=\"dashed\") + labs(title = \"Distribution of sleep duration\", x= \"sleep_duration\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "5b1b3ad2",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-27T06:53:22.272179Z",
     "iopub.status.busy": "2023-03-27T06:53:22.270338Z",
     "iopub.status.idle": "2023-03-27T06:53:22.543391Z",
     "shell.execute_reply": "2023-03-27T06:53:22.541217Z"
    },
    "papermill": {
     "duration": 0.291973,
     "end_time": "2023-03-27T06:53:22.546017",
     "exception": false,
     "start_time": "2023-03-27T06:53:22.254044",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nAA7x/z7AITqUkg4UAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "daily_sleep %>% \n",
    "  mutate(weekdays = weekdays(as.Date(SleepDay))) %>% \n",
    "  select(weekdays, TotalMinutesAsleep) %>% \n",
    "  mutate(weekdays = factor(weekdays, levels = c('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'))) %>% \n",
    "  drop_na() %>%\n",
    "  ggplot(aes(x= weekdays, y= round((TotalMinutesAsleep)/60))) +\n",
    "  geom_col(fill=\"purple\",alpha = 0.6)+\n",
    "  labs(title =\"Duration of sleep\", subtitle = \"The total duration of sleep per weekday\", y=\"hours slept\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "85421d9c",
   "metadata": {
    "papermill": {
     "duration": 0.014784,
     "end_time": "2023-03-27T06:53:22.574959",
     "exception": false,
     "start_time": "2023-03-27T06:53:22.560175",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "As we noticed earlier, Sunday is when most steps were take and apparently it is also the day where users sleep for longer periods. However there is not enough evidence to conclude that the number of steps is a causation.\n",
    "\n",
    "## **Recommendations**\n",
    "1.Bellabeat can do advertisements on Sunday since it is the most active day for users.\n",
    "\n",
    "2.Give a free trail version of the Bellabeat membership, which can customize and auto generate the exercises as per the user benefits with maybe certain \"awards\" like a chance to win Bellabeat products(Classic Wellness Tracker, Wellness clock, Water Bottle) if they remain loyal to their routine.\n",
    "\n",
    "3. Finally, collect data from more users and in longer time period for better results."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 30.196844,
   "end_time": "2023-03-27T06:53:22.813193",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-27T06:52:52.616349",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
