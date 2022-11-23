testServer(selectVariableServer, args = list(dataset = reactive(mtcars)), {
  session$setInputs(variable = "mpg")
  expect_equal(var(), "mpg")
})
