
ui <- function(request) {
  fixedPage(
    theme = bslib::bs_theme(version = 5),
    useShinyjs(),
    
    title = config::get("title"),
    tags$head(
      tags$link(rel = "icon", href = "favicon.ico"),
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js")
    ),
  
    fixedRow(
      class = "pb-4 mt-4 border-bottom",
      column(
        class = "my-auto",
        width = 3,
        img(
          class = "img-fluid d-block mx-auto",
          src = "img_logo.png",
          width = "100px",
          height = "100px",
          alt = "Logo"
        )
      ),
      column(class = "my-auto", width = 9, h1(config::get("title")))
    ),
    
    fixedRow(
      class = "m-2",
      column(3, actionButton("js_message", "What's the time?", class = "btn-primary")),
      column(9)
    ),
    
    tabsetPanel(
      tabPanel(
        "Data module",
        fixedRow(
          class = "mt-2",
          column(12, selectDataVarUI("data"))
        )
      ),
      
      tabPanel(
        "Data module 2",
        fixedRow(
          class = "mt-2",
          column(12, selectDataVarUI("data2"))
        )
      ),
      
      tabPanel(
        "Weather data",
        fixedRow(
          column(
            6,
            fixedRow(
              class = "mt-2",
              column(12, dataTableOutput("weather_table"))
            ),
            fixedRow(
              class = "mt-2",
              column(
                12,
                a(
                  "Source",
                  href = "https://www.kaggle.com/datasets/jsphyg/weather-dataset-rattle-package?select=weatherAUS.csv"
                )
              )
            )
          ),
          column(
            6,
            fixedRow(
              class = "mt-2",
              column(6, selectVariableUI("weather_var_y", "Y axis")),
              column(6, selectVariableUI("weather_var_x", "X axis"))
            ),
            fixedRow(
              class = "mt-2",
              column(12, plotOutput("weather_plot"))
            )
          )
        )
      ),
      
      tabPanel(
        "Testing the server",
        fixedRow(
          class = "mt-2",
          column(12, textInput("my_text_in", "Enter some text")),
        ),
        fixedRow(
          class = "mt-2",
          column(12, verbatimTextOutput("my_text_out", placeholder = TRUE))
        )
      )
    )
  )
}
