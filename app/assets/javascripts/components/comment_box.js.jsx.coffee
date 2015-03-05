@CommentBox = React.createClass
  # standard React methods
  getInitialState: ->
    return { data: []}
  componentDidMount: ->
    @loadCommentsFromServer()
    setInterval @loadCommentsFromServer, @props.pollInterval
  render: ->
    return (
      `<div className="commentBox">
        <h1>Comments</h1>
        <CommentList data={this.state.data} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit} />
      </div>`
      )
  # custom methods
  loadCommentsFromServer: ->
    $.ajax
      url: @props.url
      dataType: 'json'
      success: (
        (data) ->
          @setState({data: data})
        )
        .bind @
      error: (
        (xhr, status, err) ->
          console.error @props.url, status, err.toString
        )
        .bind @
  handleCommentSubmit: (comment) ->
    comments = @state.data
    newComments = comments.concat([comment])
    @setState {data: newComments}
    $.ajax
      url: @props.url
      dataType: 'json'
      type: 'POST'
      data: comment,
      success: (
        (data) ->
          @setState({data: data})
        ).bind @
      error: (
        (xhr, status, err) ->
          console.error @props.url, status, err.toString()
        ).bind @

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
    return (
      `<form className="commentForm" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Your name" ref="author" />
        <input type="text" placeholder="Say something..." ref="text" />
        <input type="submit" value="Post" />
      </form>`
      )
  handleSubmit: (e) ->
    e.preventDefault()
    author = @refs.author.getDOMNode().value.trim()
    text = @refs.text.getDOMNode().value.trim()
    if !text || !author
      return

    @props.onCommentSubmit({author: author, text: text})
    @refs.author.getDOMNode().value = ''
    @refs.text.getDOMNode().value = ''
