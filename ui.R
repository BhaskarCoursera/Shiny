shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Heart Disease prediction based on age and obesity[BMI]"),
    
    sidebarPanel(
      p('Please enter your age and Body Mass Index (BMI) below and press submit button.'),
      p('Once Submit button is pressed, your inputs will be used to predict the chance (in %) of coronary heart disease.'),
      numericInput('age', 'Age', 45, min = 10, max = 100, step = 1),
      numericInput('obesity', 'Obesity [BMI]', 22, min = 14, max = 50, step = 1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered Age of'),
      verbatimTextOutput("inputValue"),
      h4('You entered obesity[BMI] of'),
      verbatimTextOutput("inputValue2"),
      
      h4('Your chances of Coronary Heart Disease [%] is '),
      verbatimTextOutput("prediction"),
      p('Please note that the estimate is based on past data collected for other patients and is meant to be used only as a guide')
    )
  )
)