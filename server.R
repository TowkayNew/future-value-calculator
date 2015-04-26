shinyServer(function(input, output) {
  printMoney <- function(x){
    format(x, digits=10, nsmall=2, decimal.mark=".", big.mark=",", scientific = FALSE)
  }
  
  # Use a reactive expression to calculate bmi
  fv <- reactive({
    
    rate <- input$rate
    period <- input$period
    pv <- input$pv
    result <- ""
    
    if (is.numeric(rate) && is.numeric(period) && is.numeric(pv)) {
      fValue <- printMoney(round((pv * ((1 + (rate/100)) ^ period)), digits=2))
      pValue <- printMoney(pv)
      result <- paste0("<div class='panel panel-success'>
                          <div class='panel-heading'>
                            <h3 class='panel-title'>
                              Future Value is $", fValue, "
                            </h3>
                          </div>
                          <div class='panel-body'>
                            <p>If today you were to invest $",pValue," at a rate of ",rate,"%, you would have $",fValue," at the end of ",period," time periods (e.g. weeks, months, or years). In other words, a future value of $",fValue," is equal to a present value of only $",pValue,".</p>
                            <p>What does this mean to you? Well, if you had a choice between taking an amount higher than the $",pValue," today and taking the $25,937.42 at the end of 10 time periods, you should take the money today. By doing so, you would be able to invest the higher amount at ",rate,"% for ",period," equal time periods, which would end up giving you more than $",fValue,".</p>
                          </div>
                        </div>")
      output$fvPlot <- renderPlot({
          f <- function(x) {pv * ((1 + (rate/100)) ^ x)}
          par(las=2)
          par(mar=c(7,7,1,1), mgp = c(6, 1, 0))
          curve(f,0,period,xlab="Time Period",ylab="Future Value")
        })
      
    } else {
      result <- "<div class='alert alert-dismissible alert-danger'><p>Please fill in all fields in numeric.</p></div>"
    }
      
    
    result
  })
  
  output$fvResults <- renderText({fv()})
  
})
