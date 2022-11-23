
#' Variable selection module UI
#'
#' @param id Module ID.
#'
#' @return A tagList containing module UI elements.
selectVariableUI <- function(id, label = "Variable") {
  ns <- NS(id)
  tagList(
    selectInput(ns("variable"), label, choices = c())
  )
}

#' Variable selection module server
#'
#' @param id Module ID.
#' @param dataset A reactive expression containing the dataset to select a
#'   variable from.
#' @param filter A function used to filter the vriables available for selection.
#'
#' @return The selected variable as a reactive object.
selectVariableServer <- function(id, dataset, filter = NULL) {
  moduleServer(
    id,
    function(input, output, session) {
      observe({
        req(dataset())
        
        vars <- names(dataset())
        
        if (!is.null(filter)) {
          vars <- vars[sapply(dataset(), filter)]
        }
        
        updateSelectInput(
          session,
          "variable",
          choices = vars
        )
      })
      
      var <- reactive(input$variable)
    }
  )
}
