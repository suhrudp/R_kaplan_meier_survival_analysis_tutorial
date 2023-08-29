# KAPLAN-MEIER ANALYSIS

## **LOAD LIBRARIES**

```{r}
library(tidyverse)
library(ggpubr)
library(lawstat)
library(survival)
library(survminer)
library(gtsummary)
library(flextable)
```

## **ATTACH DATA**

```{r}
df <- read.csv(file.choose())
attach(df)
View(df)
```

## **DESCRIPTIVE ANALYSIS**

```{r}
table1 <- tbl_summary(df[c("Group","Age","Smoking","Duration","Outcome")], by="Group")
table1
```

## **KAPLAN-MEIER ASSUMPTIONS**

1.  The event status consists of two mutually exclusive and collectively exhaustive states: "censored" or "event."

2.  The time to an event or censorship (the "survival time") is clearly defined and precisely measured.

3.  Left-censoring is minimal/avoided (occurs when the starting point of an experiment is not easily identifiable.)

4.  There is independence of censoring and the event (censored participants are not at greater risk of developing the event.)

5.  There are no secular trends/secular changes (disease course of the participants recruited at different time points should be similar and should not introduce bias in any form.)

6.  There exists a similar amount and pattern of censorship per group (when two or more groups are present.)

## **KAPLAN-MEIER MODELS**

```{r}
kmall <- survfit(Surv(Duration, Outcome) ~ 1, data=df)
kmall

kmgroup <- survfit(Surv(Duration, Outcome) ~ Group, data=df)
kmgroup

kmsmoke <- survfit(Surv(Duration, Outcome) ~ Smoking, data=df)
kmsmoke
```

## TIME-TO-EVENT PLOTS

```{r}
ggsurvplot(kmall, conf.int=T, risk.table=T, tables.height = 0.3)

ggsurvplot(kmgroup, conf.int=T, risk.table=T, tables.height = 0.4, pval=T,surv.median.line="hv")

ggsurvplot(kmsmoke, conf.int=T, risk.table=T, tables.height = 0.4, pval=T,surv.median.line="hv")
```
