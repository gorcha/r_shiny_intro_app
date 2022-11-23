library(datasets)

#' Dataset selection module UI
#'
#' @param id Module ID.
#'
#' @return A tagList containing module UI elements.
selectDatasetUI <- function(id) {
  ns <- NS(id)
  tagList(
    selectInput(ns("dataset"), "Dataset", choices = ls("package:datasets"))
  )
}

#' Dataset selection module server
#'
#' @param id Module ID.
#'
#' @return A list containing the selected dataset and its name as reactive
#'   objects.
#' \describe{
#'   \item{data}{Selected dataset as a reactive object}
#'   \item{name}{Dataset name as a reactive string}
#' }
selectDatasetServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      dataset <- reactive({
        req(input$dataset)
        dataset <- as.data.frame(get(input$dataset, "package:datasets"))
      })
      
      list(
        data = dataset,
        name = reactive(input$dataset)
      )
    }
  )
}
