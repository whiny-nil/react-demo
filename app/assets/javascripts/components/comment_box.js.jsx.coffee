@CommentBox = React.createClass
  render: ->
    return (
      `<div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.props.data}/>
        <CommentForm />
      </div>`
      )

@CommentList = React.createClass
  render: ->
    commentNodes = @props.data.map (comment) ->
      return `<Comment author={comment.author}>{comment.text}</Comment>`

    return `<div className="commentList">{commentNodes}</div>`

@Comment = React.createClass
  render: ->
    return (
      `<div className="comment">
        <h2 className="commentAuthor">{this.props.author}</h2>
        <p>{this.props.children}</p>
      </div>`
      )

@CommentForm = React.createClass
  render: ->
    return `<div className="commentForm">Hello world! I am a CommentForm</div>`
