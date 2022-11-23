test_that("reactives and output updates", {
  testServer(expr = {
    session$setInputs(my_text_in = "Blah")
    expect_equal(output$my_text_out, "Input text is: Blah")
  })
})
