$ ->
  data = [
    { author: "whiny_nil", text: "Wow! This is teh bomb" }
    { author: "eimaj", text: "You said it!" }
  ]

  React.render `<CommentBox data={data}/>`, document.getElementById('comments')
