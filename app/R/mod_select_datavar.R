
#' Dataset and variable selection module UI
#'
#' @param id Module ID.
#'
#' @return A tagList containing module UI elements.
selectDataVarUI <- function(id) {
  ns <- NS(id)
  tagList(
    selectDatasetUI(ns("dataset_select")),
    selectVariableUI(ns("variable_select")),
    
    verbatimTextOutput(ns("module_out"), placeholder = TRUE),
    tableOutput(ns("table"))
  )
}

#' Dataset and variable selection module server
#'
#' @param id Module ID.
#'
#' @return A list containing the selected dataset and variable as reactive
#'   objects.
#' \describe{
#'   \item{data}{Selected dataset as a reactive object}
#'   \item{name}{Dataset name as a reactive string}
#'   \item{var}{Selected variable as a reactive string}
#' }
selectDataVarServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      dataset <- selectDatasetServer("dataset_select")
      
      variable <- selectVariableServer("variable_select", dataset$data)
      
      output$module_out <- renderText({
        paste0(
          "Selected variable `", variable(), "` ",
          "from dataset `", dataset$name(), "`"
        )
      })
      
      output$table <- renderTable({
        dataset$data()
      })
      
      list(
        data = dataset$data,
        name = dataset$name,
        var = variable
      )
    }
  )
}
