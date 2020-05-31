# NASA_team_Bazinga

to get to know more about this team, please visit: teambazinga.co

# Before you start:

## READ THIS PDF !!
https://drive.google.com/file/d/1wuxHgiOc46fakidJb1S3ykAMSpE5EJ0u/view?usp=sharing

Consider checking our [amazing 3d model](https://a360.co/3dkGRmY), it launches from the browser, a service by Autodesk. (non-commercial licence)

also, have a look at this [VIDEO](https://drive.google.com/file/d/1fnJudSjP9p4uztPqeC9cWlFvzgTDm3ZN/view?usp=sharing). By the way a copy can be found in the fusion360 folder

to contact team members feel free to email us at:

- Gabriel Bessa -> bessa.3301@gmail.com (REPO Host ^^)
- Gabriel Passos -> gabrielpassos28@gmail.com
- Bruna Karina -> brunakarina62@gmail.com

# What does the Bazinga Algorithm do? and how does it work?

> **the problem**: Being able to use any sort of given data, specially passed trougth sensors (serial), and precisely having the information of how often is an Item N is present.

## overview

Let's say you have a given excel (or equivalent) sheet as following:

| SENSOR-1-BOOLEAN | SENSOR-2-strings |
| ---------------- | ---------------- |
| 0                | o2               |
| 0                | o2               |
| 1                | co2              |
| 1                | co2              |
| 0                | o2               |

the data as is needs some sort of manipulation, so we can extract some useful information. For instance, as this is part of our idea, we want to be able to measure how much of a substance there is in the air, so some sort of concatenation is needed to do this.

for that purpose we can say:

| SENSOR-1-BOOLEAN | occurencies | SENSOR-2-strings | occurencies |
| ---------------- | ----------- | ---------------- | ----------- |
| 0                | 3           | o2               | 3           |
| 1                | 2           | co2              | 2           |

and we can use some conversion to the percentage of a given value, in the dataset, for the example bellow, lets call the dataset DATA:

```
# r version 3.6.1 (or later)

# what we need to modify in this script, are the occurencies
# values, replacing then with percentages

percentual_operator <- sum((DATA[1,2] + DATA[1,3]) / 100)

DATA[1,2] <- sum(DATA[1,2] / percentual_operator) #result = 60

# so here we were able to say that "0" == 60%

```

by doing this for every column item, column by column, we can have spot on data, easy to read, and great to have a one-view conclusive feedback:

| SENSOR-1-BOOLEAN | occurencies | SENSOR-2-strings | occurencies |
| ---------------- | ----------- | ---------------- | ----------- |
| 0                | 60%         | o2               | 60%         |
| 1                | 40%         | co2              | 40%         |

# project applications

To effiently gather data, and validate where the air filtering is done properly, its needed some sort of AB test. Thus, having a way to serialize and compare data fast and effectively is crucial. Being able to inform where sistems are operational, as well if there are potentially alarming factors present in the air.

As we dream of having this system in the ISS, these measurements are mandatory to be in agreement with NASA' standards. As well, but not limited to NASA' THT and SMD and wire-to-wire soldering standards, fail-safes, armed, engaged and ready concepts, etc. That we look foward to be in compilance to these standards.
