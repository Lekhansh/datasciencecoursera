# Codebook
This code book summarises the variables of dataset 'tidy.txt'.

## Identifiers
There are two identifiers for each observation:

* `subject`: The ID of the subject to whom the observation pertains. Range = 1-30
* `activity`: The activity to which the record pertains. Range = 1-6. See activity labels at the end of this document.

Each subject has an entry for each activity, yeilding a total of 30 \* 6 = 180 observations.

## Variables 

### General scheme of variable names:
The names of the variables consist of three parts:

* Prefix or the first letter of the name: denotes the type of filter from which the original data was derived; variables starting with the letter "t" denote time domain and variables starting with the letter "f" denote fast fourier transformation.

* corpus or the middle part of the name: denotes the sensor from which the original data was derived for example 'bodyacc' denotes a sensor that measured body acceleration.

* suffix1: denotes the summary statistic which the variable shows. Since this dataset only has mean and standard deviations; variables end with 'mean' and 'std' respectively.

* suffix2: for variables that have an axial component the last letter of the variable name is the axis of measurement such that variables end in 'x','y' or 'z'.

For illustration:
'tbodyaccmeanx': Mean acceleration along the x axis as measured in time domain by bodyacc sensor.
'tbodyaccmeanx': Standard deviation of acceleration along the x axis as measured in time domain by bodyacc sensor.

### Units of variables:

All the variables mentioned in this dataset are derived from original variables which were normalised and therefore unitless and bound between -1,1. As a result the variables in this dataset can be considered unitless and normalised.

## List of variables:
1."tbodyaccmeanx"                     
2."tbodyaccmeany"                    
3."tbodyaccmeanz"                     
4."tbodyaccstdx"                     
5."tbodyaccstdy"                      
6."tbodyaccstdz"                     
7."tgravityaccmeanx"                  
8."tgravityaccmeany"                 
9."tgravityaccmeanz"                  
10."tgravityaccstdx"                  
11."tgravityaccstdy"                   
12."tgravityaccstdz"                  
13."tbodyaccjerkmeanx"                 
14."tbodyaccjerkmeany"                
15."tbodyaccjerkmeanz"                 
16."tbodyaccjerkstdx"                 
17."tbodyaccjerkstdy"                 
18."tbodyaccjerkstdz"                 
19."tbodygyromeanx"                    
20."tbodygyromeany"                   
21."tbodygyromeanz"                    
22."tbodygyrostdx"                    
23."tbodygyrostdy"                     
24."tbodygyrostdz"                    
25."tbodygyrojerkmeanx"                
26."tbodygyrojerkmeany"               
27."tbodygyrojerkmeanz"                
28."tbodygyrojerkstdx"                
29."tbodygyrojerkstdy"                 
30."tbodygyrojerkstdz"                
31."tbodyaccmagmean"                   
32."tbodyaccmagstd"                   
33."tgravityaccmagmean"                
34."tgravityaccmagstd"                
35."tbodyaccjerkmagmean"               
36."tbodyaccjerkmagstd"               
37."tbodygyromagmean"                  
38."tbodygyromagstd"                  
39."tbodygyrojerkmagmean"              
40."tbodygyrojerkmagstd"              
41."fbodyaccmeanx"                     
42."fbodyaccmeany"                    
43."fbodyaccmeanz"                     
44."fbodyaccstdx"                     
45."fbodyaccstdy"                      
46."fbodyaccstdz"                     
47."fbodyaccmeanfreqx"                 
48."fbodyaccmeanfreqy"                
49."fbodyaccmeanfreqz"                 
50."fbodyaccjerkmeanx"                
51."fbodyaccjerkmeany"                 
52."fbodyaccjerkmeanz"                
53."fbodyaccjerkstdx"                  
54."fbodyaccjerkstdy"                 
55."fbodyaccjerkstdz"                  
56."fbodyaccjerkmeanfreqx"            
57."fbodyaccjerkmeanfreqy"             
58."fbodyaccjerkmeanfreqz"            
59."fbodygyromeanx"                    
60."fbodygyromeany"                   
61."fbodygyromeanz"                    
62."fbodygyrostdx"                    
63."fbodygyrostdy"                     
64."fbodygyrostdz"                    
65."fbodygyromeanfreqx"                
66."fbodygyromeanfreqy"               
67."fbodygyromeanfreqz"                
68."fbodyaccmagmean"                  
69."fbodyaccmagstd"                    
70."fbodyaccmagmeanfreq"              
71."fbodybodyaccjerkmagmean"           
72."fbodybodyaccjerkmagstd"           
73."fbodybodyaccjerkmagmeanfreq"       
74."fbodybodygyromagmean"             
75."fbodybodygyromagstd"               
76."fbodybodygyromagmeanfreq"         
77."fbodybodygyrojerkmagmean"          
78."fbodybodygyrojerkmagstd"          
79."fbodybodygyrojerkmagmeanfreq"      
80."angletbodyaccmeangravity"         
81."angletbodyaccjerkmeangravitymean"  
82."angletbodygyromeangravitymean"    
83."angletbodygyrojerkmeangravitymean" 
84."anglexgravitymean"                
85."angleygravitymean"                 
86."anglezgravitymean"

## Activity Labels
The variable 'activity' denotes the activity during which measurements were taken. The value-label pairs are as follows:

1. Value = 1, label = laying: Subject was lying down.
2. Value = 2, label = sitting: Subject was sitting.
3. Value = 3, label = standing: Subject was standing.
4. Value = 4, label = walking: Subject was walking on ground.
5. Value = 5, label = walkingdownstairs: Subject was descending stairs.
6. Value = 6, label = walkingupstairs: Subject was ascending stairs.
