#import "template.typ": *

#show: init.with("Assignment template", "Name", student_number: "12345678")

#simple_answer(
  "1. What is this?",
  lorem(50)
)

#answer(
  "2. What is that?",
  $x = 1$,
  lorem(50)
)