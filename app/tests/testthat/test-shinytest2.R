library(shinytest2)

test_that("Initial snapshot values are consistent", {
  app <- AppDriver$new(name = "init")
  app$expect_values()
})


test_that("{shinytest2} recording: data_module_changes", {
  app <- AppDriver$new(variant = platform_variant(), name = "data_module_changes", 
      height = 974, width = 1619)
  app$set_inputs(`data-dataset_select-dataset` = "AirPassengers")
  app$set_inputs(`data-dataset_select-dataset` = "anscombe")
  app$set_inputs(`data-variable_select-variable` = "x4")
  app$expect_values()
  app$set_inputs(`data-dataset_select-dataset` = "DNase")
  app$set_inputs(`data-variable_select-variable` = "conc")
  app$expect_screenshot()
  app$expect_values()
})
