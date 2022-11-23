
server <- function(input, output, session) {
  selectDataVarServer("data")
  selectDataVarServer("data2")
  
  observe({
    shinyjs::runjs("alert_today();")
  }) |>
    bindEvent(input$js_message)
  
  dataset <- reactive({
    weather_data
  })
  
  output$weather_table <- renderDataTable({
    datatable(
      dataset(),
      extensions = "FixedColumns",
      filter = "top",
      rownames = FALSE,
      selection = "none",
      options = list(
        fixedColumns = list(leftColumns = 2),
        info = TRUE,
        ordering = TRUE,
        paging = FALSE,
        searching = TRUE,
        scrollX = TRUE,
        scrollY = 400,
        scrollCollapse = TRUE
      )
    ) |>
      formatRound(3:ncol(weather_data), 2)
  })
  
  var_y <- selectVariableServer("weather_var_y", dataset, is.double)
  var_x <- selectVariableServer("weather_var_x", dataset, is.double)
  
  output$weather_plot <- renderPlot({
    req(dataset())
    req(var_x())
    req(var_y())
    req(input$weather_table_rows_all)
    
    ggplot(
      dataset()[input$weather_table_rows_all, ],
      aes(.data[[var_x()]], .data[[var_y()]])
    ) +
      geom_point()
  })
  
  output$my_text_out <- renderText({
    paste("Input text is:", input$my_text_in)
  })
}
