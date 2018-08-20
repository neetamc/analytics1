
#Data Structures----


#vectors----

v1 =1:100000 #create a vectore from 1 to 100000
v2 = c(1,4,5,10) #to concatenate individual values
class(v1)
class(v2)
v3= c('a','Dhiraj','Ashish')
v3 #to print the vector
class(v3)# to get the class of v3
v4 = c(TRUE, FALSE, T, F, T)
class(v4)

#summary on vectors
mean(v1) # R can handle more data than excel
median(v1)
sd(v1)
var(v1)
hist(v1)
hist(women$height)
v2
v2[v2>=5]
x = rnorm(60, mean=60, sd=10)
x
plot(x)
hist(x)
plot(density(x))
abline(v=60)

#rectangles and density together
hist(x, freq=F)
lines(density(x))
hist(x, breaks=10, col= 1:10)
length(x)
sd(x)
?sample

x1 = LETTERS[5:20]
x1

set.seed(1234)
y1= sample(x1)
y1

set.seed(123)# for the same pattern to be displayed/ stored
y1=sample(x1)
y1

set.seed(53)
(y2= sample(x1, size=5))

gender= sample(c('M','F'),size= 60) # to create 60 values of male and female. round bracket to print values
# you get error since sample size is greater than population size=2
(gender=sample(c('M','F'),size = 60,replace=TRUE))
(gender=sample(c('M','F'),size = 60,replace=TRUE, prob=c(0.6,0.4)))
(t1=table(gender))
prop.table(t1)



(gender=sample(c('M','F'),size = 1000,replace=TRUE, prob=c(0.6,0.4)))
(t1=table(gender))
prop.table(t1)
# as the sample becomes larger it starts matching the probability that we've provided as input
pie(t1)
barplot(t1, col= 1:2, horiz=T)

#matrix
(m1 = matrix (1:24, nrow=4)) # by default data is filled column wise

(m2 = matrix (1:24, nrow=4, byrow=T)) # by row
(m3 = matrix (1:24, ncol=4, byrow=T))
(x=runif(60,60,100))#uniform distribution, 60 values, min=60, max=100
plot(x)
plot(density(x))
(x=trunc(runif(60,60,100)))
plot(density(x))
(m4 = matrix(x, ncol=6))
colSums(m4)
rowSums(m4)
rowMeans(m4)
colMeans(m4)
m4[m4>67]
m4[m4>67 & m4 <84]
m4
m4[10, ]
m4[8:10,]
m4[8:10,1:3]
m4[8:10, c(1,3,5)]
rowSums(m4[8:10, c(1,3,5)])


#array----
#data.frame
#rollno, name, gender, coursem marks1, amrks2
(rollno=1:60)
paste('student1',1:60,sep='-')
paste('IIM', paste('student1', 1:60, sep='-'), sep = ' & ')

(name = paste('student1',1:60,sep='-'))

name[1:10]
name[c(15,20,37)]
name[-c(1:10)]
rev(name)
name[60:1]
name[-c(1:10,35:40)]
(gender= sample(c('Male','Female'),size=60,replace=T, prob= c(.3,.7)))
(course=sample(c('BBA','MBA','FPM'),size=60,replace=T, prob=c(0.2,0.7,0.1)))
(t1=table(v1))
prop.table(t1)
(marks1=ceiling(rnorm(60,mean=65,sd=7)))
(marks2=ceiling(rnorm(60,mean=65,sd=11)))
(grades=sample(c('A','B','C'),size=60, replace=T))
students = data.frame(rollno,name, gender, course, marks1, marks2, grades, stringsAsFactors = F)
class(students)
summary(students)
students[, c('name')]
students[students$gender == 'Male',c('rollno','gender','marks1')]
students[students$marks1>55 | students$marks1 <75 , c ('name','marks1')]
students[students$marks>55 & students$marks1<75, c('name','marks1')]
students$gender
t1=table(students$gender)
t1
barplot(table(students$course))
barplot(table(students$course),ylim=c(0,50), col=1:3)
text(1:3,table(students$course)+5, table(students$course) )
str(students)
names(students)
nrow(students)
dim(students)
head(students)# first 6 by default
head(students, n=7)
tail(students, n=19)
tail(students, n=65)

aggregate(students$marks1,by=list(students$gender), FUN=mean)
aggregate(students$marks2, by= list(students$course),FUN=max)
aggregate(students$marks2, by= list(students$course,students$gender),FUN=mean)
aggregate(students$marks2, by= list(students$course,students$grades),FUN=mean)


#deplyr
library(dplyr)
students %>% group_by(gender) %>% summarise(mean(marks1))# pick up the data frame, pick group by gender and find mean
students %>% group_by(gender,course) %>% summarise(mean(marks1),min(marks2),max(marks))
students%>% group_by(course,gender)%>% summarise(meanmarks1=mean(marks1),min(marks2),max(marks2))%>%arrange(desc(meanmarks1))
students%>% arrange(desc(marks1))%>% filter(gender=='Male') %>% top_n(5)
students%>% arrange(desc(marks1))%>% filter(gender=='Male') %>% head(5)
students%>% arrange(desc(marks1))%>% filter(gender=='Male') %>% head(5)
sample_frac(students,0.1)
students %>% sample_frac(0.1)
students %>% sample_n(2)
students %>% sample_frac(0.1) %>% arrange(course)
students %>% sample_frac(0.1) %>% arrange(course) %>% select(name,gender)



#factor

names(students)
students$gender=factor(students$gender)#for ordinal type of data like grades(excellent, sat, poor) for which mode and median is available but no mean
#it helps us convert a clum into an ordered category
#C, A, B C<A<B
students$grades = factor(students$grades, ordered=T, levels=c('C','A','B'))
summary(students$gender)
students$grades
table(students$grades)
barplot(table(students$grades))
summary(students$course)
students$course=factor(students$course, ordered=T, levels=c('FPM','MBA','BBA'))
summary(students)
read.csv("")
summary(students$course)


students
write.csv(students,'./data/iimtrichy.csv')
students2= read.csv('./data/iimtrichy.csv')
students2
#students2 hass one additional column for serial number
head(students2)


students3= read.csv(file.choose())
head(students3)
students3=students3[,-1]
#removes first column
head(students3)
