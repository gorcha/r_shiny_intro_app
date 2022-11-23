
# Create a button group. See the HTML example in the Bootstrap docs:
# https://getbootstrap.com/docs/5.2/components/button-group/
buttonGroup <- function(..., class = "") {
  div(
    class = paste("btn-group", class),
    role = "group",
    ...
  )
}
