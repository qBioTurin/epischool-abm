## INTRODUCTION
Many governments enforced physical distancing measures to control the spread of COVID-19 to avoid the collapse of fragile and overloaded health care systems. Following the physical distancing measures, the closures of schools seemed unavoidable to control and reduce the transmission of the pathogen, given the potentially high-risk settings of these environments. Nevertheless, leaving the closure of schools as an extreme and last resource is a top priority of governments, therefore different non-pharmaceutical interventions in the school settings were implemented to reduce the risk of transmission. Through a detailed Agent-Based Model simulation experiment [1, 5], we study the efficacy of active surveillance strategies in the school environment. Simulations settings employed in the experiments provide hypothetical although realistic scenarios which allow us to identify the most suitable control strategy according to the viral circulation period to avoid massive school closures. The significance of risk reduction through the policies assessed in this work is relevant for public health authorities and school administrators.

## WHAT IS IT?

This is an Agent-Based Model (ABM), developed in the multi-agent programmable modeling environment NetLogo version 6.2.0 [2], to study the spread of COVID-19 infections within an explanatory scholastic environment, and to evaluate in such an environment the effectiveness of non-pharmaceutical interventions (NPIs), such as distancing requirements, screening testing, and environment ventilation.
The model components are:

- The environment including both physical spaces and social contact structure of the population;
- The COVID-19 progression model;
- The NPIs’ logic modeled to contain the COVID-19 spread.

The modeled environment is a school constituted of at most 12 classrooms (arranged on three floors), shared spaces (i.e. entrance, gym, hallways, bathrooms, stairs, medical room, teachers’ office, and principal’s office). In detail, each floor consists of one hallway that connects all the rooms and one bathroom only for the students. The school entrance, the medical room, the gym, the principal’s office, the teachers’ office and the teachers’ bathroom are on the first floor. Moreover, each classroom is characterized by twenty desks (rightly distanced from each other), one teacher desk, and the blackboard.

## HOW IT WORKS
There are four different types of agents: _students, teachers, principal and janitors_.
In particular:

- Students can go to their classroom, to the students' bathroom on the same floor of their classroom, to the principal's office, to the gym, to the hallways, etc.
- Teachers can go to the classrooms, to the teacher's room, to the teachers' bathroom on the ground floor, to the hallways, etc.
- Principal can go to the principal's office, to the teachers' bathroom on the ground floor, to the hallways etc.
- Janitors can go to the medical room, to the teachers' bathroom, to the hallways etc.

There are two different contagion models:

- Aerosol [3]: accumulation of quanta concentration in the main places and of quanta inhaled for each agent. Type of ventilation used: 3 ACH (Air Changes per Hour)<sup>1</sup>. 
- Contact [4]: accumulation of the contact time among a susceptible agent and an infected one. We considered a contact area of 2.1 * 2.1 m<sup>2</sup>}.

<sup>1</sup> Air Changes per Hour (ACH) means that in 1 hour 300.000 L (or analogous 300 m<sup>2</sup>) of external air are entered into the considered room.

## HOW TO USE IT
To run a configuration you need to create a configuration file (with .conf extension) specifying the values to assign for each (or for some) parameters (described below). In the *ExampleOfConfigurationFile* directory you can find some examples of configuration files. After that, you can run the configuration in this way:
```
./start.sh ConfigurationFileName NumberOfThreads
```
For example:
```
./start.sh ExampleOfConfigurationFile/Example1.conf 24
```

There are lots of parameters in this model. Here I describe the parameters that you can modify in the Interface Tab:

- students-per-classroom: number of students for each classroom.
- num-floors: number of school's floors.
- num-classrooms-per-floor: number of classrooms for each floor. The total number of classrooms is equal to num-floors * num-classrooms-per-floor (minimum 1, maximum 12).
- init-infected: initial number of infected agents.
- init-infected-type: the init-infected will be of this type (anyone, students, teachers, principals or janitors).
- num-groups: number of groups in which the classrooms are divided (1 not staggered admissions, 2 staggered admissions).
- mean-incubation-duration-in-days: average number of incubation days.
- mean-infection-duration-in-days: average number of infection days.
- num-of-quarantine-days: number of quarantine days.
- dad-%: percentage of distance learning.
- prob-go-bathroom: probability to go to the bathroom.
- prob-go-blackboard: probability to go to the blackboard.
- prob-go-somewhere-during-interval: probability to go somewhere during the interval.
- prob-go-principal: probability to go to the principal's office.
- prob-old-teachers: probability that a teacher belongs to the _old_ category.
- prob-old-janitor: probability that a janitor belongs to the _old_ category.
- prob-outside-contagion-young: probability that an agent that belongs to the _young_ category gets the infection outside the school.
- prob-outside-contagion-regular: probability that an agent that belongs to the _regular_ category gets the infection outside the school.
- prob-outside-contagion-old: probability that an agent that belongs to the _old_ category gets the infection outside the school.
- prob-external-screening-1: probability to swab a student outside the school because this student follows activities that involve screening campaings.
- prob-external-screening-2: probability to swab an infected students outside the school.
- lesson-duration-in-minutes: duration of a single lesson in minutes.
- days-of-simulation: number of simulation days for each execution of the simulator.
- run#: unique identifier of the running execution.
- tick-duration-in-seconds: NetLogo temporal tick.
- results-dir-name: name of the results' directory.
- temperature-measurement: temperature measurement type (at the entrance).
- ventilation-type-h-1: ventilation type implemented in all rooms but not in the hallways.
- mask-type: mask type used by agents.
- fraction-of-population-wearing-mask: fraction of all agents that use the mask.
- whole-classroom-quarantined?: we can use two diffentent _quarantine_ policies:
	- First, if we find an infected student in a classroom, we put the whole classroom in quarantine.
	- Second, if we find an infected student in a classroom, we put only this student in quarantine and we swab all the other students in the same classroom. If we find other num-infected-needed-to-quarantine-whole-classroom - 1 infected students we put the whole classroom in quarantine, otherwise we'll swab again all the other students in the same classroom after number-of-after-days-special-swab days. Again, if we find other num-infected-needed-to-quarantine-whole-classroom - 1 infected we put the whole classroom in quarantine.
- num-infected-needed-to-quarantine-whole-classroom: number of infected students needed to quarantine the whole classroom with the second _quarantine_ policy.
- number-of-after-days-special-swab: number of days after that, with the second _quarantine_ policy, we swab again all the other students in the same classroom of the infected student that we found.
- staggered-admissions?: staggered admissions (with num-groups groups).
- spaced-desks?: spaced desks (social distancing).
- outside-contagion?: possibility to get the infection outside the school.
- interval-in-front-of-classroom?: possibility to go at most in front of their classroom during the interval and not elsewhere (the agents can always go to the bathroom).
- external-screening?: external screening (outside tha school).
- vaccinated-teachers?: vaccinated teachers (immunized).
- vaccinated-principals?: vaccinated principals (immunized).
- vaccinated-janitors?: vaccinated janitors (immunized).
- fraction-of-vaccinated-students: fraction of vaccinated students.
- fraction-of-vaccinated-teachers: fraction of vaccinated teachers.
- fraction-of-vaccinated-janitors: fraction of vaccinated janitors.
- vaccine-efficacy: vaccine efficacy for vaccinated subjects.
- screening-policy: infection control stategy (or screening policy); we consider four different screening policies:
	- A1: all every week
	- D1: 1/4 of the class every week, in rotation
	- D2: 1/4 of the class every week, in rotation, spread over two days of the week
	- W0: no screening
- first-day-of-week: day of the week on which school's screening takes place; In the case of D2 policy, one half of the group is swabbed on this day.
- second-day-of-week: parameter used in the case of the D2 policy; the other half of the group is swabbed on this day.
- screening-adhesion-%: percentage of students' adhesion to the screening campaign.

Each run produce an output file and for each day we get the following information:

- day
- seedRun
- susceptible
- exposed
- infected
- removed
- susceptible-in-quarantine
- exposed-in-quarantine
- infected-in-quarantine
- removed-in-quarantine
- susceptible-in-quarantine-external-1
- exposed-in-quarantine-external-1
- infected-in-quarantine-external-1
- removed-in-quarantine-external-1
- susceptible-in-quarantine-external-2
- exposed-in-quarantine-external-2
- infected-in-quarantine-external-2
- removed-in-quarantine-external-2
- num-of-screened-students
- num-of-screened-students-external-1
- num-of-screened-students-external-2
- num-of-positive-students
- num-of-positive-students-external-1
- num-of-positive-students-external-2
- num-vaccinated-susceptible
- num-vaccinated-exposed
- num-vaccinated-infected
- num-vaccinated-removed
- num-vaccinated-susceptible-in-quarantine
- num-vaccinated-exposed-in-quarantine
- num-vaccinated-infected-in-quarantine
- num-vaccinated-removed-in-quarantine
- num-vaccinated-susceptible-in-quarantine-external-1
- num-vaccinated-exposed-in-quarantine-external-1
- num-vaccinated-infected-in-quarantine-external-1
- num-vaccinated-removed-in-quarantine-external-1
- num-vaccinated-susceptible-in-quarantine-external-2
- num-vaccinated-exposed-in-quarantine-external-2
- num-vaccinated-infected-in-quarantine-external-2
- num-vaccinated-removed-in-quarantine-external-2
- num-infected-outside
- classroom-in-quarantine
- num-of-classroom-in-quarantine
- classroom-with-at-least-one-infected

## EXTERNAL INPUT
The model needed some external input files inside a _Utils_ directory:

- *Seed.txt*: this file contains the seed.
- *ClassroomsScheduling.txt*: this file contains the teachers' scheduling on the five weekly days; each teacher has an associated identifier (it's important to not overlap the teachers between different classroom in the same hour). It's necessary to specify the scheduling for each interested classroom and for each day there must be six lessons.
- *StaggeredClassroomsScheduling.txt*: this file contains the teachers' scheduling in the case of staggered admissions.
- *GymTeachers.txt*: this file contains the identifier of the gym teachers.

## EXTENDING THE MODEL
- Fix the measure-temperature function
- Fix the create-supply-teacher function
- Fix the create-supply-janitor function
- Fix the copy-teacher function
- Fix the copy-janitor function
- Introduce some features such as:
	- Possibility of reinfection

## REFERENCES
[1] Daniele Baccega. _SchoolSEIRModel_. _2021_. URL: https://gitlab.com/danielebaccega/schoolseirmodel.

[2] Wilensky, U. (1999). NetLogo. http://ccl.northwestern.edu/netlogo/. Center for Connected Learning and Computer-Based Modeling, Northwestern University, Evanston, IL.

[3] Savvas Gkantonas et al. _airborne.cam: a risk calculator of SARSCoV-2 aerosol transmission under well-mixed ventilation conditions_. _2021_. URL: https://airborne.cam.

[4] Nicolas Hoertel et al. _«A stochastic agent-based model of the SARS-CoV-2 epidemic in France»_. In: _Nature medicine 26.9 (2020)_, pp. 1417–1421.

[5] PAPER JASS

## COPYRIGHT AND LICENSE

Copyright Daniele Baccega, Marco Beccuti, Paolo Castagno, Simone Pernice, Matteo Sereno, Pietro Terna

![CC BY-NC-SA 3.0](http://ccl.northwestern.edu/images/creativecommons/byncsa.png)

This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 License.  To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 559 Nathan Abbott Way, Stanford, California 94305, USA.
