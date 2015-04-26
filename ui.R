shinyUI(
  fluidPage(
    # Add on customized css styles
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "bootstrap.css")
    ),
    titlePanel("Calculate Future Value"),
    sidebarLayout(
      sidebarPanel(
        numericInput("rate", label="Interest Rate Per Time Period (%)", value = "15"),
        numericInput("period", label="Number of Time Periods (e.g. weeks, months, or years)", value = "10"),
        numericInput("pv", label="Present Value", value = "10000"),
        submitButton("Calculate")
        ),
      mainPanel(
        p("The value of an asset or cash at a specified date in the future that is equivalent in value to a specified sum today."),
        p("Future Value (FV) is a formula used in finance to calculate the value of a cash flow at a later date than originally received. This idea that an amount today is worth a different amount than at a future time is based on the time value of money."),
        p("The time value of money is the concept that an amount received earlier is worth more than if the same amount is received at a later time."),
        hr(),
        htmlOutput("fvResults"),
        plotOutput("fvPlot")
        )
    )
  )
)