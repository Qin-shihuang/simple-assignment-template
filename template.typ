#let justify_align(left_body, right_body) = {
  block[
    #box(width: 1fr)[
      #align(left)[
        #left_body
      ]
    ]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let box(contents) = {
  rect(
    fill: rgb(242,242,242), 
    stroke: 0pt,
    width: 100%,
    align(left)[#contents]
  )
}

#let simple_answer(question, term) = {
  [=== #question]

  box(term)
}

#let answer(question, numbering_fmt: "a", ..answers) = {
  [=== #question]

  let length = answers.pos().len()
  for i in range(0, length) {
    let answer = answers.pos().at(i)
    let question_number = numbering(numbering_fmt, i+1)

    [==== #question_number]
    box(answer)
  }
}

#let init(title, author, student_number: none, body) = {
  set document(title: title, author: author)
  set page(
    paper: "a4",
    margin: (left: 10mm, right: 10mm, top: 10mm, bottom: 10mm),
    footer: [
      #set text(fill: gray, size: 8pt)
      #justify_align[
        #smallcaps[#datetime.today().display("Compiled at [year]-[month]-[day]")]
      ][
        #counter(page).display()
      ]
    ],
    footer-descent: 0pt,
  )
  set text(font: "PingFang SC")
  align(top + left)[Name: #author]

  if student_number != none {
    align(top + left)[Student ID: #student_number]
  }

  align(center)[= #title]

  body
}