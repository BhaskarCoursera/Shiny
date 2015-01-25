library(ElemStatLearn)
library(AppliedPredictiveModeling)
library(caret)
data(SAheart)
set.seed(8484)
chdRisk <- function(age1,obesity1) {
  ## Select only the Obesity[BMI] and Age columns as predictors
  traindat = SAheart[,c(7,9,10)]
  model <- train(chd ~ age + obesity, data = traindat, method = "glm", family = "binomial")  
  ##Create the input dataset
  testdat = traindat[1,]
  testdat$age = age1
  testdat$obesity = obesity1
  chance = predict(model, newdata = testdat)*100
  chance
}


shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$age})
    output$inputValue2 <- renderPrint({input$obesity})   
    output$prediction <- renderPrint({chdRisk(input$age,input$obesity)})
  }
)